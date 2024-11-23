namespace _.Services.Service_Contracts;

using _.Models;


public interface IUserService
{
    Task<List<Project>> GetTrackedProjectsAsync(string userId);
    // Task AddTrackedProjectAsync(string userId, int projectId);
    // Task RemoveTrackedProjectAsync(string userId, int projectId);
}

