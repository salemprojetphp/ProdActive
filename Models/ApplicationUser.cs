using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;
namespace _.Models;

public class ApplicationUser : IdentityUser
{
    public float Gender { get; set; }
    public float Age { get; set; }
    public float Years_At_Company { get; set; }
    public float Monthly_Salary { get; set; }
    public float Training_Hours { get; set; }
    public float Work_Hours_Per_Week { get; set; }
    public float Resigned { get; set; }
    public float Promotions { get; set; }
    public float Employee_Satisfaction_Score { get; set; }
    public float Overtime_Hours {get; set;}
    public float Remote_Work_Frequency { get; set; }

    public ICollection<Pointage>? Pointages { get; set; } 
    public ICollection<Conge>? Conges { get; set; }
    public ICollection<ReunionParticipant>? ReunionParticipants {get; set;}
    public ICollection<ProjectEmployee>? ProjectEmployees { get; set;} //projects involved in
    public ICollection<Tache>? Tasks { get; set; }
    public ICollection<TrackedProjects>? TrackedProjects { get; set; } //projects tracked
}
