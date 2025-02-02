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
        // if (User.Identity != null && User.Identity.IsAuthenticated)
        // {
        //     // The user is logged in
        //     return View();
        // }
        // else{
        //     return Redirect("/Identity/Account/Login");
        // }
        return View();
    }

    [Route("/Dashboard/Employee")]
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
        var totalActiveEmployees = projectEmployeeIds.Concat(managerIds).Distinct().Count();

        EmployeeDashboardViewModel employeeDashboardVM = new EmployeeDashboardViewModel
        {
            TotalActiveEmployees = totalActiveEmployees,
            TotalActiveProjects = projectIds.Count,
            // TasksCompleted = new List<EmployeeChartData>(),
            // CompletionRates = new List<EmployeeChartData>(),
            // AverageDurations = new List<EmployeeChartData>(),
            // ImportanceDurations = new List<ImportanceChartData>()
        };
        return View(employeeDashboardVM);
    }

    [Route("/Dashboard/Projects")]
    public async Task<IActionResult> Projects()
    {
        return View();  
    }

    [Route("/Dashboard/Attendance")]
    public async Task<IActionResult> Attendance()
    {
        return View();  
    }

    [Route("/Dashboard/Feedbacks")]
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
