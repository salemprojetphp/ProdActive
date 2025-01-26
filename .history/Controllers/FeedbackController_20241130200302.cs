using Microsoft.AspNetCore.Mvc;
using _.Models;
using _.Services;
using System.Threading.Tasks;

namespace _.Controllers
{
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
        public async Task<IActionResult> Create([Bind("Subject, Message")] Feedback feedback)
        {
            if (ModelState.IsValid)
            {
                await _feedbackService.AddFeedbackAsync(feedback);
                return RedirectToAction("Index", "Home");
            }

            return View(feedback);
        }

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

        // POST: Feedback/Delete/{id}
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await _feedbackService.DeleteFeedbackAsync(id);
            return RedirectToAction("Index", "Home");
        }
    }
}
