namespace _.Models;

public class Tache {
    public int Id { get; set; }
    public string? Title { get; set; }
    public string? Description { get; set; }
    // 0: en cours, 1: terminé, -1: en attente
    public int Status { get; set; }
    public int Importance { get; set; }
    public DateTime? DateDebut { get; set; }
    public DateTime? DateFin { get; set; }
    public int Expected_duree { get; set; }
    public int ProjectId { get; set; }
    public Project? Project { get; set; }
    public string? EmployeeId { get; set; } 
    public ApplicationUser? Employee { get; set; }
}