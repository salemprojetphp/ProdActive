using _.Models;
using Microsoft.EntityFrameworkCore;

namespace _.Repositories;

public class Repository<T> : IRepository<T> where T : class
{
    private readonly ApplicationDbContext _context;
    private readonly DbSet<T> _dbSet;

    public Repository(ApplicationDbContext context)
    {
        _context = context;
        _dbSet = _context.Set<T>();
    }

    public IQueryable<T> GetAll() => _dbSet.AsQueryable();

    public IQueryable<T> GetAll() => _dbSet.AsQueryable();

    public async Task<IEnumerable<T>> GetAllAsync()
    {
        return await _dbSet.ToListAsync();
    }

    public async Task<T> GetByIdAsync(int id)
    {
        var entity = await _dbSet.FindAsync(id);
        if (entity == null)
        {
            throw new KeyNotFoundException($"Entity with id {id} not found.");
        }
        return entity;
    }

    public async Task AddAsync(T entity)
    {
        await _dbSet.AddAsync(entity);
        await _context.SaveChangesAsync();
    }

    public async Task AddRangeAsync(List<T> entities)
    {
        await _dbSet.AddRangeAsync(entities);
        await _context.SaveChangesAsync();
    }

    public async Task UpdateAsync(T entity)
    {
        _dbSet.Update(entity);
        await _context.SaveChangesAsync();
    }

    public async Task DeleteAsync(int id)
    {
        var entity = await GetByIdAsync(id);
        if (entity != null)
        {
            _dbSet.Remove(entity);
            await _context.SaveChangesAsync();
        }
    }

    public async Task<bool> DeleteEntityAsync(T entity)
    {
        if (entity != null)
        {
            _dbSet.Remove(entity);
            await _context.SaveChangesAsync();
            return true;
        }
        return false;
    }

    System.Threading.Tasks.Task IRepository<T>.AddAsync(T entity)
    {
        throw new NotImplementedException();
    }

    System.Threading.Tasks.Task IRepository<T>.UpdateAsync(T entity)
    {
        throw new NotImplementedException();
    }

    System.Threading.Tasks.Task IRepository<T>.DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    
}
