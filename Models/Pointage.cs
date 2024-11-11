namespace _.Models;

public class Pointage {
    public int Id { get; set; }
    public DateTime Date { get; set;}
    //transaction type : entry 1, leaving 0
    public int TransactionType { get; set;}
    public string? EmployeeId { get; set;}
    public ApplicationUser? Employee { get; set;}
}