using _.Models;

namespace _.Repositories;

public interface IRepository<T> where T : class
{
    IQueryable<T> GetAll();
    Task<IEnumerable<T>> GetAllAsync();
    Task<T> GetByIdAsync(int id);
    Task AddAsync(T entity);
    Task AddRangeAsync(List<T> enbtities);
    Task UpdateAsync(T entity);
    Task DeleteAsync(int id);
    IQueryable<T> Query();
    Task<bool> DeleteEntityAsync(T entity);
}
