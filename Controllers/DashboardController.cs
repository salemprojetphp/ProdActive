namespace _.Controllers;

using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Project_ERP.Models;
using _.Helpers;
using _.Models;
using System.Text.Json;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Microsoft.AspNetCore.Authorization;

[Authorize]
public class DashboardController : Controller
{
    private readonly ILogger<DashboardController> _logger;
    private readonly ApplicationDbContext _context;
    public DashboardController(ILogger<DashboardController> logger, ApplicationDbContext context)
    {
        _logger = logger;
        _context = context;
    }

    [Route("/Dashboard")]
    public IActionResult Index()
    {
        return View();
    }

    [Route("/Dashboard/Employee")]
    [Authorize(Roles = "Employee, ChefProjet")]
    public async Task<IActionResult> Employee()
    {
        // Get all project IDs
        var projectIds = await _context.Projects
            .Where(p => p.Status == 0)
            .Select(p => p.Id)
            .ToListAsync();
        var projectEmployeeIds = await _context.ProjectEmployees
                    .Where(pe => projectIds.Contains(pe.ProjectId))
                    .Select(pe => pe.EmployeeId)
                    .ToListAsync();
        var managerIds = await _context.Projects.Select(p => p.ManagerId).ToListAsync();

        // Get all active employees
        var activeEmployeesIds = projectEmployeeIds.Union(managerIds);

        // Get all tasks per employee with the project active
        Dictionary<ApplicationUser, IEnumerable<Tache>> TasksPerEmployee = new Dictionary<ApplicationUser, IEnumerable<Tache>>();
        foreach (var employeeId in activeEmployeesIds)
        {
            var tasks = await _context.Tasks
                .Where(t => t.EmployeeId == employeeId && projectIds.Contains(t.ProjectId))
                .ToListAsync();

            var employee = await _context.Users
                .FirstOrDefaultAsync(u => u.Id == employeeId);

            if (employee != null)
            {
                TasksPerEmployee.Add(employee, tasks);
            }
        }
        Dictionary<string, double> completionRatePerEmployee = DashboardHelper.GetCompletionRateDict(TasksPerEmployee);
        await DashboardHelper.WriteTaskCompletionRateAsync(completionRatePerEmployee);
        await DashboardHelper.WriteAverageTaskDurationAsync(TasksPerEmployee);

        var FinishedTasks = await _context.Tasks
            .Where(t => projectIds.Contains(t.ProjectId))
            .ToListAsync();
        await DashboardHelper.WriteProjectProgressByImportanceAsync(FinishedTasks);

        // Get the top 3 performers
        Dictionary<ApplicationUser, double> topPerformersRates = completionRatePerEmployee
            .OrderByDescending(kvp => kvp.Value)
            .Take(3)
            .ToDictionary(kvp => TasksPerEmployee.Keys.FirstOrDefault(u => u.UserName == kvp.Key), kvp => kvp.Value);

        // Pass Data to the view 
        EmployeeDashboardViewModel employeeDashboardVM = new EmployeeDashboardViewModel
        {
            TotalActiveEmployees = activeEmployeesIds.Count(),
            TotalActiveProjects = projectIds.Count(),
            topPerformersRates = topPerformersRates,
        };

        return View(employeeDashboardVM);
    }

    [Route("/Dashboard/Projects")]
    public async Task<IActionResult> Projects()
    {
        return View();  
    }
    [Authorize(Roles = "ChefProjet")]
    [Route("/Dashboard/Attendance")]
    public async Task<IActionResult> Attendance()
    {
        // Get all employees (ID & Name)
        var employees = await _context.Users
            .Select(e => new { e.Id, e.UserName })
            .ToListAsync();

        var employeeNames = employees.ToDictionary(e => e.Id, e => e.UserName);

        // Get all data for the helper
        var conges = await _context.Conges.ToListAsync();
        var pointages = await _context.Pointages.ToListAsync();

        // Use the helper methods to calculate the required data
        var leaveFrequency = AttendanceHelper.GetLeaveFrequency(conges);
        var avgWorkingHours = AttendanceHelper.GetAvgWorkingHours(pointages);
        var attendanceRate = AttendanceHelper.GetAttendanceRate(pointages);
        var lateArrivals = AttendanceHelper.GetLateArrivals(pointages);
        var leaveUtilizationRate = AttendanceHelper.GetLeaveUtilizationRate(conges);
        var pendingLeaveRequests = AttendanceHelper.GetPendingLeaveRequests(conges);
        var acceptedLeaveRequests = AttendanceHelper.GetAcceptedLeaveRequests(conges);
        var rejectedLeaveRequests = AttendanceHelper.GetRejectedLeaveRequests(conges);

        // Prepare ViewModel with Employee Names and Calculations
        var attendanceDashboardVM = new AttendanceDashboardViewModel
        {
            LeaveFrequency = leaveFrequency
                .Where(lf => employeeNames.ContainsKey(lf.Key))
                .ToDictionary(lf => employeeNames[lf.Key], lf => lf.Value),

            AvgWorkingHours = avgWorkingHours
                .Where(lf => employeeNames.ContainsKey(lf.Key))
                .ToDictionary(lf => employeeNames[lf.Key], lf => lf.Value),

            AttendanceRate = attendanceRate
                .Where(lf => employeeNames.ContainsKey(lf.Key))
                .ToDictionary(lf => employeeNames[lf.Key], lf => lf.Value),

            LateArrivals = lateArrivals
                .Where(lf => employeeNames.ContainsKey(lf.Key))
                .ToDictionary(lf => employeeNames[lf.Key], lf => lf.Value),

            LeaveUtilizationRate = leaveUtilizationRate
                .Where(lf => employeeNames.ContainsKey(lf.Key))
                .ToDictionary(lf => employeeNames[lf.Key], lf => lf.Value),

            PendingLeaveRequests = pendingLeaveRequests,
            AcceptedLeaveRequests = acceptedLeaveRequests,
            RejectedLeaveRequests = rejectedLeaveRequests
        };

        return View(attendanceDashboardVM);
    }

    [Route("/Dashboard/Feedbacks")]
    [Authorize(Roles = "ChefProjet")]
    public async Task<IActionResult> Feedbacks()
    {
        // Calculate the counts for positive and negative feedbacks
        var feedbackCounts = await _context.Feedbacks
            .GroupBy(f => f.Rating)
            .Select(g => new
            {
                Rating = g.Key,
                Count = g.Count()
            })
            .ToListAsync();

        var negativeFeedbacks = feedbackCounts.FirstOrDefault(f => f.Rating == 0)?.Count ?? 0;
        var positiveFeedbacks = feedbackCounts.FirstOrDefault(f => f.Rating == 1)?.Count ?? 0;

        // Calculate the total number of feedbacks
        var totalFeedbacks = await _context.Feedbacks.CountAsync();

        // Create the ViewModel and pass it to the view
        var feedbackDashboardVM = new FeedbackDashboardViewModel
        {
            NegativeFeedbacks = negativeFeedbacks,
            PositiveFeedbacks = positiveFeedbacks,
            TotalFeedbacks = totalFeedbacks
        };

        return View(feedbackDashboardVM);  
    }

    [Route("/Dashboard/FeedbacksData")]
    [Authorize(Roles = "ChefProjet")]
    public async Task<IActionResult> GetFeedbackData()
    {
        // Retrieve all feedback data for the current week from the database
        var feedbackData = await _context.Feedbacks.ToListAsync();

        // Pass the data to the helper to get the feedback counts for the current week
        var currentWeekFeedbacks = FeedbackHelper.GetFeedbackCountsForCurrentWeek(feedbackData);

        // Return the data as JSON to be used in the chart
        return Json(new
        {
            currentWeekPositive = currentWeekFeedbacks.PositiveFeedbacks,
            currentWeekNegative = currentWeekFeedbacks.NegativeFeedbacks,
        });
    }

    [Route("/Dashboard/FeedbackPercentages")]
    [Authorize(Roles = "ChefProjet")]
    public async Task<IActionResult> GetFeedbackPercentages()
    {
        // Retrieve all feedback data from the database
        var feedbackData = await _context.Feedbacks.ToListAsync();

        // Use the helper method to calculate the percentages of positive and negative feedbacks
        var (positivePercentage, negativePercentage) = FeedbackHelper.GetFeedbackPercentages(feedbackData);

        // Return the percentages as JSON
        return Json(new
        {
            positivePercentage = positivePercentage,
            negativePercentage = negativePercentage
        });
    }


    private async Task WriteChartDataToJson(object data)
    {
        var jsonString = JsonSerializer.Serialize(data);
        var path = Path.Combine("wwwroot", "json", "employee-dashboard.json");
        await System.IO.File.WriteAllTextAsync(path, jsonString);
    }
}
