using _.Models;
namespace _.Services;

public interface IPointageChefProjetService
{
    Task<IEnumerable<Pointage>> GetAllAsync();
    Task<Pointage> GetByIdAsync(int id);
    Task AddAsync(Pointage pointage);
    Task UpdateAsync(Pointage pointage);
    Task DeleteAsync(int id);
}