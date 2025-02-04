namespace _.Services;

using _.Models;

public interface ITacheService
{
    Task<IEnumerable<Tache>> GetAllTachesAsync(string userId);
}