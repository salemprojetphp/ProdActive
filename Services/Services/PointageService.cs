using _.Models;
using _.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace _.Services
{
    public class PointageService : IPointageService
    {
        private readonly IRepository<Pointage> _repository;

        public PointageService(IRepository<Pointage> repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<Pointage>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
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
}
