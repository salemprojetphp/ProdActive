using System.Collections.Generic;

namespace _.Models
{
    public class EmployeeDashboardViewModel
    {
        public int TotalActiveEmployees { get; set; }
        public int TotalActiveProjects { get; set; }
        public Dictionary<ApplicationUser, double> topPerformersRates { get; set; }
        // public List<EmployeeChartData> TasksCompleted { get; set; }
        // public List<EmployeeChartData> CompletionRates { get; set; }
        // public List<EmployeeChartData> AverageDurations { get; set; }
        // public List<ImportanceChartData> ImportanceDurations { get; set; }
    }
}