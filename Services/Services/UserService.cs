namespace _.Services.Services;

using _.Models;
using _.Repositories;
using _.Services.Service_Contracts;
using Microsoft.EntityFrameworkCore;

public class UserService : IUserService
{
    private readonly IRepository<TrackedProjects> _trackedProjectsRepository;
    private readonly IRepository<Project> _projectRepository;

    public UserService(IRepository<TrackedProjects> trackedProjectsRepository,IRepository<Project> projectRepository)
    {
        _trackedProjectsRepository = trackedProjectsRepository;
        _projectRepository = projectRepository;
    }

    
    public async Task<List<Project>> GetTrackedProjectsAsync(string userId)
    {
        // Get all ProjectEmployee records where the user is tracking projects
        var userProjects = _trackedProjectsRepository.GetAll();

        // Filter the records by the userId and select the related projects
        var trackedProjects = await userProjects
            .Where(pe => pe.EmployeeId == userId)
            .Select(pe => pe.Project!)
            .ToListAsync();

        return trackedProjects;
    }

    // public async Task AddTrackedProjectAsync(string userId, int projectId)
    // {
    //     // Check if the user is already tracking the project
    //     var userProjects = await _trackedProjectsRepository.GetAllAsync();
    //     if (userProjects.Any(pe => pe.EmployeeId == userId && pe.ProjectId == projectId))
    //     {
    //         throw new InvalidOperationException("The user is already tracking this project.");
    //     }

    //     // Create a new ProjectEmployee record
    //     var projectEmployee = new ProjectEmployee
    //     {
    //         EmployeeId = userId,
    //         ProjectId = projectId
    //     };

    //     // Save it to the database
    //     await _trackedProjectsRepository.AddAsync(projectEmployee);
    // }

 
    // public async Task RemoveTrackedProjectAsync(string userId, int projectId)
    // {
    //     // Find the ProjectEmployee record
    //     var userProjects = await _trackedProjectsRepository.GetAllAsync();
    //     var projectEmployee = userProjects
    //         .FirstOrDefault(pe => pe.EmployeeId == userId && pe.ProjectId == projectId);

    //     if (projectEmployee == null)
    //     {
    //         throw new KeyNotFoundException("The user is not tracking this project.");
    //     }

    //     // Remove it from the database
    //     await _trackedProjectsRepository.DeleteAsync(projectEmployee.ProjectId);
    // }
}
