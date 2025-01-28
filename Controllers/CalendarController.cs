namespace _.Controllers;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using _.Services;
using _.Models;
using System.Globalization;

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
        var projects = await _userService.GetAllProjectsAsync(userId);
        // Filter out tracked projects
        var projectsToTrack = projects.Where(p => !trackedProjects.Any(tp => tp.Id == p.Id)).ToList();
        if (projects == null || !projects.Any())
        {
            Console.WriteLine("You currently have no projects.");
            ViewData["Message"] = "You currently have no projects.";
        }
        return View(projectsToTrack);
    }

    // Get the events for the calendar
    [HttpGet("calendar/events")]
    public async Task<IActionResult> GetCalendarEvents()
    {
        try
        {
            var currentUserId = "1"; // For testing purposes
            if (currentUserId == null)
            {
                return Unauthorized(new { message = "User is not authenticated." });
            }

            var trackedProjects = await _userService.GetTrackedProjectsAsync(currentUserId);
            var meetings = await _userService.GetReunionsAsync(currentUserId);

            var calendarEvents = new List<object>();

            // Add tracked project events
            calendarEvents.AddRange(trackedProjects.Select(p => new
            {
                title = "Project: " + p.Title,
                start = p.DateDebut?.ToString("yyyy-MM-dd"),
                end = p.DateFin?.ToString("yyyy-MM-dd"),
                color = p.Status == 0 ? "#023E8A" : p.Status == 1 ? "#28a745" : "#808080", // Optional color coding
                extendedProps = new
                {
                    type = "project",
                    description = p.Description,
                    status = p.Status == 1 ? "Completed" : p.Status == 0 ? "In Progress" : "Cancelled",
                    projectId = p.Id // You can add the projectId if you need to use it for untracking
                }
            }));

            // Add meeting events
            calendarEvents.AddRange(meetings.Select(m => new
            {
                title = "Meeting: " + m.Objet,
                start = m.Date?.ToString("yyyy-MM-dd HH:mm"),
                color = "#fad480", // Customize the color for meetings here
                extendedProps = new
                {
                    type = "meeting",
                    description = m.Description,
                    lieu = m.Lieu == 0 ? "Onsite" : "Online",
                    duree = m.Duree,
                    status = m.Status == 1 ? "Upcoming" : m.Status == 0 ? "Completed" : "Cancelled",
                    projectId = m.ProjectId // If the meeting is associated with a project
                }
            }));

            return Ok(calendarEvents);
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { message = "An error occurred while fetching calendar events.", error = ex.Message });
        }
    }

    // Get the projects that the user is involved in
    [HttpGet("calendar/getAllProjectsToTrack")]
    public async Task<IActionResult> GetAllProjectsToTrack()
    {
        // var currentUserId = _userManager.GetUserId(User);
        var currentUserId = "1"; // For testing purposes 
        var projects = await _userService.GetAllProjectsAsync(currentUserId);
        var trackedProjects = await _userService.GetTrackedProjectsAsync(currentUserId);
        var projectsToTrack = projects.Where(p => !trackedProjects.Any(tp => tp.Id == p.Id)).ToList();
        return Json(projectsToTrack); // Return the projects as JSON
    }

    [HttpPost("calendar/trackProjects")]
    public async Task<IActionResult> TrackProjects([FromBody] List<int> projectIds)
    {
        if (projectIds == null || !projectIds.Any())
        {
            return BadRequest(new { success = false, message = "Invalid request data." });
        }

        // Get the current user's ID
        // var currentUserId = _userManager.GetUserId(User); // Using ClaimTypes for identity resolution
        var currentUserId = "1"; // For testing purposes 
        if (string.IsNullOrEmpty(currentUserId))
        {
            return Unauthorized(new { success = false, message = "User is not authenticated." });
        }

        try
        {
            // Call the user service to update tracked projects
            await _userService.AddTrackedProjectsAsync(currentUserId, projectIds);
            return Json(new { success = true, message = "Tracked projects updated successfully." });

        }
        catch (Exception ex)
        {
            return StatusCode(500, new { success = false, message = "An error occurred while updating tracked projects.", error = ex.Message });
        }
    }

    // Untrack a project
    [HttpPost("calendar/untrackProject")]
    public async Task<IActionResult> UntrackProject([FromBody] int projectId)
    {
        if (projectId == 0)
        {
            return BadRequest(new { success = false, message = "Invalid project ID." });
        }

        try
        {
            var currentUserId = "1"; // For testing purposes (you should get the actual user ID here)

            // Call the RemoveTrackedProjectAsync function to remove the project from the tracked list
            var result = await _userService.RemoveTrackedProjectAsync(currentUserId, projectId);

            if (result)
            {
                return Json(new { success = true, message = "Project untracked successfully." });
            }
            else
            {
                return BadRequest(new { success = false, message = "Project is not tracked or does not exist." });
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, new { success = false, message = "An error occurred while untracking the project.", error = ex.Message });
        }
    }
}

