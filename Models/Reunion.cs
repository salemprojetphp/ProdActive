namespace _.Models;

public class Reunion {
    public int Id { get; set; }
    public DateTime? Date { get; set;}
    public string? Objet{ get; set;}
    public string? Description{ get; set;}
    // 0:onsite, 1:online
    public int? Lieu{ get; set;}
    public int Duree { get; set;}
    // 1: ulterieure, 0: en cours, -1: terminée
    public int Status {get; set;}
    public int ProjectId { get; set;}
    public Project? Project { get; set;}
    public ICollection<ReunionParticipant>? ReunionParticipants { get; set;}
}