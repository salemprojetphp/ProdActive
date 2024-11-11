namespace _.Models;

public class ReunionParticipant {
    public string? EmployeeId { get; set; } 
    public ApplicationUser? Employee { get; set;}
    public int ReunionId { get; set; }
    public Reunion? Reunion { get; set; }

}