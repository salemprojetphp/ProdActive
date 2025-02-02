namespace _.Controllers;

using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Project_ERP.Models;
using _.Helpers;
using _.Models;
using System.Text.Json;
using Microsoft.EntityFrameworkCore;
using System.Linq;

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

   public async Task<IActionResult> Attendance()
{
    // Get all employees (ID & Name)
    var employees = await _context.Users
        .Select(e => new { e.Id, e.UserName })
        .ToListAsync();

    var employeeNames = employees.ToDictionary(e => e.Id, e => e.UserName);

    // Calculate Leave Frequency
    var leaveFrequency = await _context.Conges
        .Where(c => c.DateDebut != null && c.DateDebut >= DateTime.Now.AddMonths(-1)) // Last month
        .GroupBy(c => c.EmployeeId)
        .Select(g => new
        {
            EmployeeId = g.Key,
            LeaveCount = g.Count()
        })
        .ToListAsync();
    // Calculate Average Working Hours per Day
    var workingHours = await _context.Pointages
    .Where(p => p.Date >= DateTime.Now.AddMonths(-2)) // Last 2 months
    .OrderBy(p => p.Date) // Ensure transactions are in order
    .GroupBy(p => new { p.EmployeeId, p.Date.Date }) // Group by Employee and Date
    .Select(g => new
    {
        EmployeeId = g.Key.EmployeeId,
        Date = g.Key.Date,
        // Compute hours worked based on first entry (1) and last leaving (-1) of the day
        WorkingHours = g.Any(p => p.TransactionType == 1) && g.Any(p => p.TransactionType == -1)
            ? (g.Where(p => p.TransactionType == -1).Max(p => p.Date) - 
               g.Where(p => p.TransactionType == 1).Min(p => p.Date)).TotalHours
            : 0 // If missing entry or exit, assume 0 hours
    })
    .GroupBy(p => p.EmployeeId)
    .Select(g => new
    {
        EmployeeId = g.Key,
        AvgWorkingHours = g.Average(p => p.WorkingHours)
    })
    .ToListAsync();


    // Calculate Employee Attendance Rate
    var attendanceRate = await _context.Pointages
        .Where(p => p.Date >= DateTime.Now.AddMonths(-1)) // Last  month
        .GroupBy(p => new { p.EmployeeId, p.Date.Date })
        .Select(g => new
        {
            EmployeeId = g.Key.EmployeeId,
            Date = g.Key.Date,
            Present = g.Any(p => p.TransactionType == 1) // Simplified logic
        })
        .GroupBy(p => p.EmployeeId)
        .Select(g => new
        {
            EmployeeId = g.Key,
            AttendanceRate = (double)g.Count(p => p.Present) / g.Select(p => p.Date).Distinct().Count() * 100

        })
        .ToListAsync();

    // Calculate Late Arrivals (assuming 9 AM as the threshold)
    var lateArrivals = await _context.Pointages
        .Where(p => p.Date >= DateTime.Now.AddMonths(-1) && p.TransactionType == 1) // Last month, entry points
        .GroupBy(p => p.EmployeeId)
        .Select(g => new
        {
            EmployeeId = g.Key,
            LateCount = g.Count(p => p.Date.Hour >= 9) // Count late arrivals (after 9 AM)
        })
        .ToListAsync();

    // Calculate Leave Utilization Rate 
    var leaveUtilizationRate = await _context.Conges
        .Where(c => c.DateDebut >= DateTime.Now.AddMonths(-1)) // Last month
        .GroupBy(c => c.EmployeeId)
        .Select(g => new
        {
            EmployeeId = g.Key,
            TotalLeaveTaken = g.Count(),
            TotalLeaveAllocated = 20 
        })
        .Select(l => new
        {
            l.EmployeeId,
            LeaveUtilizationRate = (double)l.TotalLeaveTaken / l.TotalLeaveAllocated * 100
        })
        .ToListAsync();

    // Calculate Pending Leave Requests
    var pendingLeaveRequests = await _context.Conges
        .Where(c => c.Status == 0) // Pending status (Status = 0)
        .GroupBy(c => c.Status)
        .Select(g => new
        {
            Status = g.Key,
            PendingCount = g.Count()
        })
        .ToListAsync();
    var acceptedLeaveRequests = await _context.Conges
        .Where(c => c.Status == 1) 
        .GroupBy(c => c.Status)
        .Select(g => new
        {
            Status = g.Key,
            PendingCount = g.Count()
        })
        .ToListAsync();
    var rejectedLeaveRequests = await _context.Conges
        .Where(c => c.Status == -1) 
        .GroupBy(c => c.Status)
        .Select(g => new
        {
            Status = g.Key,
            PendingCount = g.Count()
        })
        .ToListAsync();
    // Prepare ViewModel with Employee Names and Calculations
    var attendanceDashboardVM = new AttendanceDashboardViewModel
    {
        LeaveFrequency = leaveFrequency
            .Where(lf => employeeNames.ContainsKey(lf.EmployeeId))
            .ToDictionary(lf => employeeNames[lf.EmployeeId], lf => lf.LeaveCount),

        AvgWorkingHours = workingHours
            .Where(wh => employeeNames.ContainsKey(wh.EmployeeId))
            .ToDictionary(wh => employeeNames[wh.EmployeeId], wh => wh.AvgWorkingHours),

        AttendanceRate = attendanceRate
            .Where(ar => employeeNames.ContainsKey(ar.EmployeeId))
            .ToDictionary(ar => employeeNames[ar.EmployeeId], ar => ar.AttendanceRate),

        LateArrivals = lateArrivals
            .Where(la => employeeNames.ContainsKey(la.EmployeeId))
            .ToDictionary(la => employeeNames[la.EmployeeId], la => la.LateCount),

        LeaveUtilizationRate = leaveUtilizationRate
            .Where(lr => employeeNames.ContainsKey(lr.EmployeeId))
            .ToDictionary(lr => employeeNames[lr.EmployeeId], lr => lr.LeaveUtilizationRate),

        PendingLeaveRequests = pendingLeaveRequests
            .ToDictionary(p => p.Status.ToString(), p => p.PendingCount),
        AcceptedLeaveRequests = acceptedLeaveRequests
            .ToDictionary(p => p.Status.ToString(), p => p.PendingCount),
        RejectedLeaveRequests = rejectedLeaveRequests
            .ToDictionary(p => p.Status.ToString(), p => p.PendingCount)
    };

    return View(attendanceDashboardVM);
}

    private async Task WriteChartDataToJson(object data)
    {
        var jsonString = JsonSerializer.Serialize(data);
        var path = Path.Combine("wwwroot", "json", "employee-dashboard.json");
        await System.IO.File.WriteAllTextAsync(path, jsonString);
    }
}
