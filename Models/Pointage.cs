namespace _.Models;

public class Pointage {
    public int Id { get; set; }
    public DateTime Date { get; set;} = DateTime.Now;
    //transaction type : entry 1, leaving -1, pause 0, Resume 2
    public int TransactionType { get; set;}
    public string? EmployeeId { get; set;}
    public ApplicationUser? Employee { get; set;}
}