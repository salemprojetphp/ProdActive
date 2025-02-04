using _.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace _.Services
{
    public interface IPointageService
    {
        // Get all pointages
        Task<IEnumerable<Pointage>> GetAllAsync();

        Task<IEnumerable<Pointage>> GetAllByEmployeeId(string employeeId);

        // Get pointage by its ID
        Task<Pointage> GetByIdAsync(int id);

        // Add a new pointage
        Task AddAsync(Pointage pointage);

        // Update an existing pointage
        Task UpdateAsync(Pointage pointage);

        // Delete a pointage by its ID
        Task DeleteAsync(int id);
    }
}
