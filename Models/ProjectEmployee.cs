namespace _.Models;

public class ProjectEmployee {
    public int ProjectId { get; set; }
    public Project? Project { get; set; }
    public string? EmployeeId { get; set; }
    public ApplicationUser? Employee { get; set; }
}