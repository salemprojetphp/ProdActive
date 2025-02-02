using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using _.Models;
using System.Text.Json;

// This helper is generic and can be used in any controller
// Functions should be generic (can be used in any controller)
// NO APPLICATIONDBCONTEXT PASSED IN ARGUMENT !!!!!
// pls

namespace _.Helpers
{
    public static class DashboardHelper
    {
        public static Dictionary<string, double> GetCompletionRateDict(Dictionary<ApplicationUser, IEnumerable<Tache>> tasksPerEmployee){
            var completionRatePerEmployee = new Dictionary<string, double>();

            // Calculate the completion rate for each employee
            foreach (var employee in tasksPerEmployee)
            {
                var completedTasks = employee.Value.Count(t => t.Status == 1);
                var totalTasks = employee.Value.Count();

                // Avoid division by zero
                if(totalTasks != 0){
                    var completionRate = (double)completedTasks / totalTasks * 100;
                    completionRatePerEmployee.Add(employee.Key.UserName, completionRate);
                }
            }
            return completionRatePerEmployee;
        }
        public static async Task WriteTaskCompletionRateAsync(Dictionary<string, double> completionRatePerEmployee)
        {
            // Convert the dictionary into Chart.js format
            var chartData = new
            {
                labels = completionRatePerEmployee.Keys.ToArray(),
                datasets = new[]
                {
                    new
                    {
                        label = "Task Completion Rate (%)",
                        data = completionRatePerEmployee.Values.ToArray(),
                        backgroundColor = completionRatePerEmployee.Keys.Select((_, i) =>
                            i % 2 == 0 ? "#6389E9" : "rgba(255, 99, 132, 0.6)"
                        ).ToArray() // Alternating colors for clarity
                    }
                }
            };

            // Serialize the structured JSON
            var json = JsonSerializer.Serialize(chartData, new JsonSerializerOptions { WriteIndented = true });

            // Write to JSON file
            var filePath = Path.Combine("wwwroot", "json", "EmployeeDashboard", "CompletionRatePerEmployee.json");
            await File.WriteAllTextAsync(filePath, json);
        }

        public static async Task WriteAverageTaskDurationAsync(Dictionary<ApplicationUser, IEnumerable<Tache>> tasksPerEmployee)
        {
            var averageDurationPerEmployee = new Dictionary<string, double>();

            // Calculate the average task duration for each employee
            foreach (var employee in tasksPerEmployee)
            {
                var completedTasks = employee.Value.Where(t => t.Status == 1 && t.DateFin.HasValue);

                // Calculate average duration
                var averageDuration = completedTasks.Any() 
                    ? completedTasks.Average(t => t.DateFin.Value.Subtract(t.DateDebut.Value).TotalDays) 
                    : 0;

                averageDurationPerEmployee.Add(employee.Key.UserName, averageDuration);
            }

            // Serialize the dictionary to JSON
            var json = JsonSerializer.Serialize(averageDurationPerEmployee);

            // Write to JSON file
            var filePath = Path.Combine("wwwroot", "json", "EmployeeDashboard", "AverageTaskDurationPerEmployee.json");
            await System.IO.File.WriteAllTextAsync(filePath, json);
        }
        
        public static async Task WriteProjectProgressByImportanceAsync(IEnumerable<Tache> tasks)
        {
            try
            {
                var progressPerImportance = new Dictionary<int, double>();

                // Group tasks by importance level
                var tasksGroupedByImportance = tasks.GroupBy(t => t.Importance);

                foreach (var group in tasksGroupedByImportance)
                {
                    var importanceLevel = group.Key;
                    Console.WriteLine("importanceLevel: " + importanceLevel);

                    // Calculate project progress for this importance level
                    var FinishedTasks = group.Count(t => t.Status == 1);
                    Console.WriteLine("FinishedTasks: " + FinishedTasks);
                    var taskCount = group.Count();
                    Console.WriteLine("taskCount" + taskCount);
                    double progress = ((double)FinishedTasks / taskCount) * 100;
                    Console.WriteLine("progress: " + progress);

                    progressPerImportance.Add(importanceLevel, progress);
                }

                // Convert to JSON
                var json = JsonSerializer.Serialize(progressPerImportance, new JsonSerializerOptions { WriteIndented = true });

                // Ensure directory exists
                var directoryPath = Path.Combine("wwwroot", "json", "EmployeeDashboard");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                // Write to JSON file
                var filePath = Path.Combine(directoryPath, "ProjectProgressByImportance.json");
                await File.WriteAllTextAsync(filePath, json);

                Console.WriteLine($"JSON successfully written to {filePath}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error writing JSON: {ex.Message}");
            }
        }


    }
}