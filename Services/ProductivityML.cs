using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using _.Models;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using Newtonsoft.Json;

public class ProductivityML
{
    private readonly HttpClient _httpClient;
    private readonly ApplicationDbContext _db;
    public ProductivityML(IHttpClientFactory httpClientFactory, ApplicationDbContext db)
    {
        _httpClient = httpClientFactory.CreateClient();
        _db = db;
    }
    public Dictionary<string, float> GetProductivityData(ApplicationUser user)
    {
        // Get user data (unchanged)
        var userData = _db.ApplicationUsers
            .Where(u => u.Id == user.Id)
            .Select(u => new 
            { 
                u.Gender, 
                u.Age, 
                u.Years_At_Company,
                u.Monthly_Salary,
                u.Work_Hours_Per_Week,
                u.Overtime_Hours,
                u.Remote_Work_Frequency,
                u.Training_Hours,
                u.Promotions,
                u.Employee_Satisfaction_Score,
                u.Resigned
            })
            .FirstOrDefault();

        // 1. Get the user's project IDs
        var userProjectIds = _db.ProjectEmployees
            .Where(pe => pe.EmployeeId == user.Id)
            .Select(pe => pe.ProjectId)
            .Distinct()
            .ToList(); // Execute query to get IDs in memory

        // 2. Get employee counts per project (server-side)
        var teamCounts = _db.ProjectEmployees
            .Where(pe => userProjectIds.Contains(pe.ProjectId))
            .GroupBy(pe => pe.ProjectId)
            .Select(g => g.Count())
            .ToList(); // Execute query to get counts in memory

        // 3. Sum counts client-side
        var totalTeamSize = teamCounts.Sum();

        // Fix 2: Calculate other metrics
        var projectsHandled = userProjectIds.Count;

        var sickDays = _db.Conges
            .Where(c => c.Objet == "Sick" && c.EmployeeId == user.Id)
            .AsEnumerable()
            .Sum(c => (c.DateFin - c.DateDebut).Days + 1);

        // Return data in API-expected format
        return new Dictionary<string, float>
        {
            { "Gender", userData?.Gender ?? 0 },
            { "Age", userData?.Age ?? 0 },
            { "Years_At_Company", userData?.Years_At_Company ?? 0 },
            { "Monthly_Salary", userData?.Monthly_Salary ?? 0 },
            { "Work_Hours_Per_Week", userData?.Work_Hours_Per_Week ?? 0 },
            { "Projects_Handled", projectsHandled },
            { "Overtime_Hours", userData?.Overtime_Hours ?? 0 },
            { "Sick_Days", sickDays },
            { "Remote_Work_Frequency", userData?.Remote_Work_Frequency ?? 0 },
            { "Team_Size", totalTeamSize },
            { "Training_Hours", userData?.Training_Hours ?? 0 },
            { "Promotions", userData?.Promotions ?? 0 },
            { "Employee_Satisfaction_Score", userData?.Employee_Satisfaction_Score ?? 0 },
            { "Resigned", userData?.Resigned ?? 0 }
        };
    }
    public async Task<float> GetProductivityScore(Dictionary<string, string> data)
    {
        var json = JsonConvert.SerializeObject(data);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await _httpClient.PostAsync("http://localhost:5000/productivity", content);
        
        var responseData = await response.Content.ReadAsStringAsync(); // Read response content
        Console.WriteLine($"API Response: {responseData}"); // Log the response

        if (response.IsSuccessStatusCode)
        {
            dynamic jsonResponse = JsonConvert.DeserializeObject(responseData);
            return jsonResponse.Performance_Score;
        }

        Console.WriteLine($"API Error: {response.StatusCode} - {responseData}");
        return 0;
    }


}