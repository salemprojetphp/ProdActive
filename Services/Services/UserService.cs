namespace _.Services;

using _.Models;
using _.Repositories;
using _.Services;
using Microsoft.EntityFrameworkCore;

public class UserService : IUserService
{
    private readonly IRepository<TrackedProjects> _trackedProjectsRepository;
    private readonly IRepository<ProjectEmployee> _projectEmployeeRepository;
    private readonly IRepository<ReunionParticipant> _reunionParticipantRepository;

    public UserService(IRepository<TrackedProjects> trackedProjectsRepository, 
                       IRepository<ProjectEmployee> projectEmployeeRepository,
                       IRepository<ReunionParticipant> reunionParticipantRepository)
    {
        _trackedProjectsRepository = trackedProjectsRepository;
        _projectEmployeeRepository = projectEmployeeRepository;
        _reunionParticipantRepository = reunionParticipantRepository;
    }
    
    public async Task<List<Project>> GetAllProjectsAsync(string userId)
    {
        // Get all ProjectEmployee records
        var projects = _projectEmployeeRepository.GetAll();

        // Filter the projects by the userId and select the related projects
        var userProjects= await projects
            .Where(pe=> pe.EmployeeId == userId)
            .Select(pe=>pe.Project!)
            .ToListAsync();
        
        return userProjects;
    }

    public async Task<List<Project>> GetTrackedProjectsAsync(string userId)
    {
        // Get all TrackedEmployee records
        var trackedProjects = _trackedProjectsRepository.GetAll();

        // Filter the records by the userId and select the related projects
        var userTrackedProjects = await trackedProjects
            .Where(pe => pe.EmployeeId == userId)
            .Select(pe => pe.Project!)
            .ToListAsync();

        return userTrackedProjects;
    }

    public async Task<List<Reunion>> GetReunionsAsync(string userId)
    {
        // Get all ReunionParticipant records
        var reunions = _reunionParticipantRepository.GetAll();

        // Filter the records by the userId and select the related reunions
        var userReunions = await reunions
            .Where(pe => pe.EmployeeId == userId)
            .Select(pe => pe.Reunion!)
            .ToListAsync();

        return userReunions;
    }

    public async Task AddTrackedProjectsAsync(string userId, List<int> projectIds)
    {
        var existingTrackedProjects = await _trackedProjectsRepository.GetAll()
            .Where(pe => pe.EmployeeId == userId)
            .ToListAsync();

        var projectsToTrack = projectIds
            .Where(id => !existingTrackedProjects.Any(tp => tp.ProjectId == id))
            .Select(id => new TrackedProjects
            {
                EmployeeId = userId,
                ProjectId = id
            })
            .ToList();
        
        if (projectsToTrack.Any())
        {
            await _trackedProjectsRepository.AddRangeAsync(projectsToTrack);
        }
    }

    public async Task<bool> RemoveTrackedProjectAsync(string userId, int projectId)
    {
        // Find the tracked project in the TrackedProjects table
        var trackedProject = await _trackedProjectsRepository.GetAll()
            .FirstOrDefaultAsync(tp => tp.EmployeeId == userId && tp.ProjectId == projectId);

        if (trackedProject != null)
        {
            var result= await _trackedProjectsRepository.DeleteEntityAsync(trackedProject);
            return result;
        }
        return false;
    }





}
