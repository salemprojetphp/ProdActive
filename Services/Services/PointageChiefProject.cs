namespace _.Services;
using _.Models;
using _.Repositories;
using Microsoft.EntityFrameworkCore;

public class PointageChefProjetService : IPointageChefProjetService
{
    private readonly IRepository<Pointage> _repository;

    public PointageChefProjetService(IRepository<Pointage> repository)
    {
        _repository = repository;
    }

    public async Task<IEnumerable<Pointage>> GetAllAsync()
    {
        return await _repository.Query()
            .OfType<Pointage>()
            .Include(p => p.Employee)
            .ToListAsync();
    }

    public async Task<Pointage> GetByIdAsync(int id)
    {
        return await _repository.GetByIdAsync(id);
    }

    public async Task AddAsync(Pointage pointage)
    {
        await _repository.AddAsync(pointage);
    }

    public async Task UpdateAsync(Pointage pointage)
    {
        await _repository.UpdateAsync(pointage);
    }

    public async Task DeleteAsync(int id)
    {
        await _repository.DeleteAsync(id);
    }
}