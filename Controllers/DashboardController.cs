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
        DashboardHelper.WriteTaskCompletionRateAsync(completionRatePerEmployee);

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

    [Route("/Dashboard/Attendance")]
    public async Task<IActionResult> Attendance()
    {
        return View();  
    }

    private async Task WriteChartDataToJson(object data)
    {
        var jsonString = JsonSerializer.Serialize(data);
        var path = Path.Combine("wwwroot", "json", "employee-dashboard.json");
        await System.IO.File.WriteAllTextAsync(path, jsonString);
    }
}
