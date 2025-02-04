using _.Models;

namespace _.ViewModels
{
    public class ProfileViewModel
    {
        public ApplicationUser User { get; set; }
        public List<Tache> Tasks { get; set; }
        public List<Project> TrackedProjects { get; set; }
    }
}