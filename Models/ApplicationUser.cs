using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;
namespace _.Models;

public class ApplicationUser : IdentityUser
{
    public ICollection<Pointage>? Pointages { get; set; } 
    public ICollection<Conge>? Conges { get; set; }
    public ICollection<ReunionParticipant>? ReunionParticipants {get; set;}
    public ICollection<ProjectEmployee>? ProjectEmployees { get; set;} //projects involved in
    public ICollection<Tache>? Tasks { get; set; }
    public ICollection<TrackedProjects>? TrackedProjects { get; set; } //projects tracked
}
