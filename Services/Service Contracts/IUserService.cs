namespace _.Services.Service_Contracts;

using _.Models;


public interface IUserService
{
    Task<List<Project>> GetTrackedProjectsAsync(string userId);
    Task<List<Project>> GetAllProjectsAsync(string userId);
    Task AddTrackedProjectsAsync(string userId, List<int> projectIds);
    Task<List<Reunion>> GetReunionsAsync(string userId);
    Task<bool> RemoveTrackedProjectAsync(string userId, int projectId);
}

