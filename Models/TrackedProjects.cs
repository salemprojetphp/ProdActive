namespace _.Models;

public class TrackedProjects {
    public string? EmployeeId { get; set; }
    public ApplicationUser? Employee { get; set; }
    public int ProjectId { get; set; }
    public Project? Project { get; set; }
    
}