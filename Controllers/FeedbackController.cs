using Microsoft.AspNetCore.Mvc;
using _.Models;
using _.Services;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace _.Controllers;


[Authorize]
public class FeedbackController : Controller
{
    private readonly IFeedbackService _feedbackService;

    public FeedbackController(IFeedbackService feedbackService)
    {
        _feedbackService = feedbackService;
    }

    // GET: Feedback/Create 
    [HttpGet]
    public IActionResult Create()
    {
        return View();
    }

    // POST: Feedback/Create
    [HttpPost]
    [ValidateAntiForgeryToken]
    [Route("/Feedback")]
    public async Task<IActionResult> Create([Bind("Subject, Message,Rating")] Feedback feedback)
    {
        if (ModelState.IsValid)
        {
            await _feedbackService.AddFeedbackAsync(feedback);
            return RedirectToAction("Index", "Home");
        }

        return View(feedback);
    }
    [Authorize(Roles = "Admin, ChefProjet")]
    // GET: Feedback/Details/{id}
    [HttpGet]
    public async Task<IActionResult> Details(int id)
    {
        var feedback = await _feedbackService.GetFeedbackByIdAsync(id);
        if (feedback == null)
        {
            return NotFound();
        }

        return View(feedback);
    }
    [Authorize(Roles = "Admin, ChefProjet")]
    // GET: Feedback/Delete/{id}
    [HttpGet]
    public async Task<IActionResult> Delete(int id)
    {
        var feedback = await _feedbackService.GetFeedbackByIdAsync(id);
        if (feedback == null)
        {
            return NotFound();
        }

        return View(feedback);
    }
    [Authorize(Roles = "Admin, ChefProjet")]
    // POST: Feedback/Delete/{id}
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(int id)
    {
        await _feedbackService.DeleteFeedbackAsync(id);
        return RedirectToAction("Index", "Home");
    }

    [HttpGet]
    [Route("Feedback/GetAllFeedbacks")]
    [Authorize(Roles = "Admin, ChefProjet")]
    public async Task<IActionResult> GetAllFeedbacks()
    {
        try
        {
            var feedbacks = await _feedbackService.GetAllFeedbackAsync();
            if (feedbacks == null || !feedbacks.Any())
            {
                return NotFound("No feedback found.");
            }
            return Ok(feedbacks);
        }
        catch (Exception ex)
        {
            // Log the error here
            Console.WriteLine("Error fetching feedbacks: " + ex.Message);
            return StatusCode(500, "Internal server error. Please try again later.");
        }
    }

}

