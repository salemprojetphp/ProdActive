using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using _.Models;
using System.Text.Json;
using System.IO;
using _.Helpers;

namespace Project_ERP.Controllers
{
    public class PointageChefProjetController : Controller
    {
        private readonly ApplicationDbContext _context;

        public PointageChefProjetController(ApplicationDbContext context)
        {
            _context = context;
        }

        [Route("pointage-projet")]
        public async Task<IActionResult> Index()
        {
            // Write data to JSON file
            bool dataWritten = await WriteDataInJson();
            if (dataWritten)
            {
                var applicationDbContext = _context.Pointages.Include(p => p.Employee);
                return View(await applicationDbContext.ToListAsync());
            }
            else
            {
                return StatusCode(500, new { message = "An error occurred while writing the JSON file." });
            }
        }

        private async Task<bool> WriteDataInJson()
        {
            try
            {
                var projectId = 1; 
                var daysOfWeek = new List<string> { "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" };
                var hoursOfDay = new List<string> { "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00" };
                
                var totalWorkingHours = await GetTotalWorkingHoursForWeek(projectId, daysOfWeek);
                var activityPeaks = await CountEmployeeEntriesPerHour(hoursOfDay);

                // Prepare the data for JSON
                var jsonData = new
                {
                    hoursWorked = new
                    {
                        labels = daysOfWeek.ToArray(),
                        data = totalWorkingHours.Select(wh => (int)wh.TotalHours).ToArray() // Convert TimeSpan to total hours (integer)
                    },
                    activityPeaks = new 
                    {
                        labels = hoursOfDay.ToArray(),
                        data = activityPeaks.ToArray()
                    }
                };

                // Serialize the data to JSON format
                string jsonString = JsonSerializer.Serialize(jsonData, new JsonSerializerOptions
                {
                    WriteIndented = true // For human-readable formatting
                });
                var jsonFilePath = Path.Combine("wwwroot", "json", "PointageChefProjet.json");
                await System.IO.File.WriteAllTextAsync(jsonFilePath, jsonString);

                Console.WriteLine("JSON data written to file successfully.");

                // Return success response
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return false;
            }
        }

        private async Task<List<TimeSpan>> GetTotalWorkingHoursForWeek(int projectId, List<string> daysOfWeek)
        {
            // Get project employees
            var projectEmployees = await _context.ProjectEmployees
                .Where(pe => pe.ProjectId == projectId)
                .Include(pe => pe.Employee)
                .ToListAsync();

            // Get all pointages for the project employees
            var employeeIds = projectEmployees.Select(pe => pe.EmployeeId).ToList();
            var pointages = await _context.Pointages
                .Where(p => employeeIds.Contains(p.EmployeeId)) // Filter by project employees
                .ToListAsync();

            // Get current week date range
            var (startOfWeek, endOfWeek) = DateTimeExtensions.GetThisWeekDateRange();

            // Filter pointages for the current week
            var weeklyPointages = pointages
                .Where(p => p.Date >= startOfWeek && p.Date <= endOfWeek)
                .ToList();

            // Convert the pointages into a list of AttendanceEntry objects for each employee
            var attendanceEntriesGroupedByEmployee = weeklyPointages
                .GroupBy(p => p.EmployeeId)
                .ToList();

            // Prepare to accumulate working hours for all employees
            var totalWorkingHours = new List<TimeSpan> { TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero };

            foreach (var employeeEntries in attendanceEntriesGroupedByEmployee)
            {
                var employeeAttendanceEntries = employeeEntries.Select(p => new AttendanceEntry
                {
                    Date = p.Date,
                    TransactionType = p.TransactionType
                }).ToList();

                // Use the ProcessAttendanceData function for this employee
                var (workingHours, _) = DateTimeExtensions.ProcessAttendanceDataProjectChief(employeeAttendanceEntries, daysOfWeek);

                // If working hours were calculated, add them to the total
                if (workingHours.Count == 7) // Ensure there are 7 entries (one for each day)
                {
                    for (int i = 0; i < workingHours.Count; i++)
                    {
                        totalWorkingHours[i] += workingHours[i];
                    }
                }
                else
                {
                    Console.WriteLine($"Skipping employee {employeeEntries.Key} due to invalid working hours count: {workingHours.Count}");
                }
            }
            return totalWorkingHours;
        }
    
        private async Task<int[]> CountEmployeeEntriesPerHour(List<string> hoursOfDay)
        {
            try
            {
                var targetDate = DateTime.Now; // You can adjust this to a specific date if needed
                // Initialize an array to hold the count of employees for each hour
                var employeeCountPerHour = new int[hoursOfDay.Count];

                // Get all pointages for the target date with the "entry" transaction type
                var pointages = await _context.Pointages
                    .Where(p => p.Date.Date == targetDate.Date && p.TransactionType == 1) // Corrected for string comparison
                    .ToListAsync();

                // Loop through each pointage and count the number of entries for each hour
                foreach (var pointage in pointages)
                {
                    // Get the hour of the pointage date
                    var hour = pointage.Date.Hour;

                    // Check if the hour is within the range of hoursOfDay (08:00 to 18:00)
                    if (hour >= 8 && hour <= 18)
                    {
                        // Find the corresponding index in hoursOfDay list (e.g., "08:00" -> index 0, "09:00" -> index 1, etc.)
                        int index = hour - 8; // Subtract 8 because hoursOfDay starts at 8:00

                        // Increment the count for this hour
                        employeeCountPerHour[index]++;
                    }
                }

                // Return the array containing the count of employees per hour
                return employeeCountPerHour;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return null;
            }
        }
    }
}
