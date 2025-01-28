namespace _.Services;

using Microsoft.EntityFrameworkCore;
using System.Linq;

using _.Models;
using _.Repositories;
using _.Services;

public class ProjectService : IProjectService
{
    private readonly IRepository<Project> _projectRepository;

    public ProjectService(IRepository<Project> projectRepository)
    {
        _projectRepository = projectRepository;
    }

    // Retrieve all projects
    public async Task<IEnumerable<Project>> GetAllProjectsAsync()
    {
        var projects = _projectRepository.GetAll();
        return await projects
            .Include(p => p.Manager)
            .Include(p => p.ProjectEmployees)
            .Include(p => p.Tasks)
            .ToListAsync();
    }

    // Retrieve a specific project by ID
    public async Task<Project?> GetProjectByIdAsync(int id)
    {
        var projects = _projectRepository.GetAll();       
        return await projects
            .Include(p => p.Manager)
            .Include(p => p.ProjectEmployees)
            .Include(p => p.Tasks)
            .FirstOrDefaultAsync(p => p.Id == id);
    }

    // Add a new project
    public async Task AddProjectAsync(Project project)
    {
        await _projectRepository.AddAsync(project);
    }

    // Update an existing project
    public async Task UpdateProjectAsync(Project project)
    {
        await _projectRepository.UpdateAsync(project);
    }

    // Delete a project by ID
    public async Task DeleteProjectAsync(int id)
    {
        var project = await _projectRepository.GetByIdAsync(id);
        if (project != null)
        {
            await _projectRepository.DeleteAsync(project.Id);
        }
    }
}
