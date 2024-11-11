namespace _.Models;

public class Conge {
    public int Id { get; set; }
    public DateTime DateDebut { get; set;}
    public DateTime DateFin { get; set;}
    public string? Objet{ get; set;}
    // 0: en attente, 1: accepté, -1: refusé
    public int Status{ get; set;}
    public string? EmployeeId { get; set;}
    public ApplicationUser? Employee { get; set;}
}