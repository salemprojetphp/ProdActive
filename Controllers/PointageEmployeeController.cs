using Microsoft.AspNetCore.Mvc;
using _.Models;
using _.Services;
using _.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

namespace Project_ERP.Controllers
{
    [Authorize]
    public class PointageEmployeeController : Controller
    {
        private readonly IPointageService _pointageService;
        private readonly UserManager<ApplicationUser> _userManager;

        public PointageEmployeeController(IPointageService pointageService, UserManager<ApplicationUser> userManager)
        {
            _pointageService = pointageService;
            _userManager = userManager;
        }

        // GET: attendance
        [Route("attendance")]
        public async Task<IActionResult> Index()
        {
            // Use the service to get all pointages of the logged in user 
            var pointages = await _pointageService.GetAllByEmployeeId(_userManager.GetUserId(User));

            // Assuming you want to display some custom labels for transaction types
            var dictionary = new Dictionary<int, string>
            {
                { 1, "Entry" },
                { 0, "Pause" },
                { 2, "Resume" },
                { -1, "Exit" }
            };
            ViewData["TransactionTypes"] = dictionary;

            // Write the Week Attendance data into the json file
            var (startOfWeek, endOfWeek) = DateTimeExtensions.GetThisWeekDateRange();
            var weeklyPointages = pointages
                .Where(p => p.Date >= startOfWeek && p.Date <= endOfWeek)
                .ToList();
            var attendanceEntries = weeklyPointages.Select(p => new AttendanceEntry
            {
                Date = p.Date,
                TransactionType = p.TransactionType
            }).ToList();
            var daysOfWeek = new List<string> { "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" };
            var (workingHours, pauseHours) = DateTimeExtensions.ProcessAttendanceData(attendanceEntries, daysOfWeek);
            var jsonData = new
            {
                labels = daysOfWeek,
                datasets = new[]
                {
                    new
                    {
                        label = "Working Hours",
                        data = workingHours,
                        backgroundColor = "rgba(54, 162, 235, 0.75)",
                        borderColor = "rgba(54, 162, 235, 1)",
                        borderWidth = 1
                    },
                    new
                    {
                        label = "Pause Hours",
                        data = pauseHours,
                        backgroundColor = "rgba(255, 159, 64, 0.75)",
                        borderColor = "rgba(255, 159, 64, 1)",
                        borderWidth = 1
                    }
                }
            };
            var jsonFilePath = Path.Combine("wwwroot", "json", "WeekAttendance.json");
            var jsonString = System.Text.Json.JsonSerializer.Serialize(jsonData, new System.Text.Json.JsonSerializerOptions { WriteIndented = true });
            System.IO.File.WriteAllText(jsonFilePath, jsonString);

            // Is it weekend ? 
            bool isWeekend = DateTime.Now.DayOfWeek == DayOfWeek.Saturday || DateTime.Now.DayOfWeek == DayOfWeek.Sunday;
            ViewData["IsWeekend"] = isWeekend;

            return View(pointages);  // Return the data fetched from the service
        }

        // POST: attendance/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Pointage pointage)
        {
            // Example: Assign employee ID from logged-in user (you can get this from your auth system)
            pointage.EmployeeId = _userManager.GetUserId(User);

            if (ModelState.IsValid)
            {
                await _pointageService.AddAsync(pointage);  // Call the service layer to add pointage
                return RedirectToAction(nameof(Index));
            }

            // If the model is invalid, return to the same view
            return View(pointage);
        }

        // POST: PointageEmployee/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            // Call the service layer to delete the pointage
            await _pointageService.DeleteAsync(id);

            return RedirectToAction(nameof(Index));
        }
    }
}
