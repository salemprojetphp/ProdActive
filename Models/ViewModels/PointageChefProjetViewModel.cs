namespace _.Models;

public class AttendanceOverviewViewModel
{
    public IEnumerable<_.Models.Pointage>? Pointages { get; set; }
    public Project? Project { get; set; }
    public double ProjectCompletionPercentage { get; set; }
    public int RemainingDays { get; set; }
    public double PunctualityRate { get; set; }
    public TimeSpan AverageBreakDuration { get; set; }
    public int TotalEmployees { get; set; }
}
