namespace _.Services;

using _.Models;
using _.Repositories;
using _.Services;
using Microsoft.EntityFrameworkCore;

public class TacheService : ITacheService
{
    private readonly IRepository<Tache> _tacheRepository;

    public TacheService(IRepository<Tache> tacheRepository)
    {
        _tacheRepository = tacheRepository;
    }
    
    public async Task<IEnumerable<Tache>> GetAllTachesAsync(string userId)
    {
        // Get all Tache records
        var taches = _tacheRepository.GetAll();

        // Filter the records by the userId and select the related taches
        var userTaches = await taches
            .Where(t => t.EmployeeId == userId)
            .ToListAsync();
        
        return userTaches;

    }   
}