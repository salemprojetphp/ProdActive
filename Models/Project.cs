namespace _.Models;

public class Project {
    public int Id { get; set; }
    public string? Title { get; set;}
    public string? Description { get; set;}
    // 0: en cours, 1: terminé, -1: annulé
    public int Status { get; set;}
    public DateTime? DateDebut { get; set;}
    public DateTime? DateFin { get; set;}
    // in days
    public int Expected_duree {get; set;}
    public string? ManagerId { get; set;}
    public ApplicationUser? Manager { get; set;}
    public ICollection<ProjectEmployee>? ProjectEmployees { get; set;} //users involved in project
    public ICollection<Tache>? Tasks { get; set;}
    public ICollection<TrackedProjects>? TrackedByEmployees { get; set; } //users tracking project
}
