namespace _.Controllers;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using _.Services.Service_Contracts;
using _.Models;

public class CalendarController : Controller
{
    // private readonly IProjectService _projectService;
    private readonly IUserService _userService;
    private readonly UserManager<ApplicationUser> _userManager;
    public CalendarController( IUserService userService, UserManager<ApplicationUser> userManager)
    {
        // _projectService = projectService;
        _userService = userService;
        _userManager = userManager;
    }

    public async Task<IActionResult> Index()
    {
        var userId = "1";
        var trackedProjects = await _userService.GetTrackedProjectsAsync(userId);
        if (trackedProjects == null || !trackedProjects.Any())
        {
            Console.WriteLine("You are not tracking any projects.");
            ViewData["Message"] = "You are not tracking any projects.";
        }
        return View();
    }
   
    [HttpGet("calendar/events")]
    public async Task<IActionResult> GetCalendarEvents()
    {
        try{
            // var currentuserId = _userManager.GetUserId(User);
            var currentuserId = "1"; // For testing purposes
            if (currentuserId == null)
            {
                return Unauthorized(new { message = "User is not authenticated." });
            }
            var trackedprojects = await _userService.GetTrackedProjectsAsync(currentuserId);

             var calendarEvents = trackedprojects.Select(p => new
            {
                title = p.Title,
                start = p.DateDebut?.ToString("yyyy-MM-dd"),
                end = p.DateFin?.ToString("yyyy-MM-dd"),
                description = p.Description,
                status = p.Status == 0 ? "In Progress" : p.Status == 1 ? "Completed" : "Cancelled",
                color = p.Status == 0 ? "#007bff" : p.Status == 1 ? "#28a745" : "#dc3545" // Optional color coding
            });

            return Ok(calendarEvents);

        }
        catch(Exception ex)
        {
            return StatusCode(500, new { message = "An error occurred while fetching calendar events.", error = ex.Message });
        }
    }
}

