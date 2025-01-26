using _.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace _.Services
{
    public interface IFeedbackService
    {
        Task<IEnumerable<Feedback>> GetAllFeedbackAsync();
        Task<Feedback> GetFeedbackByIdAsync(int id);
        Task AddFeedbackAsync(Feedback feedback);
        Task UpdateFeedbackAsync(Feedback feedback);
        Task DeleteFeedbackAsync(int id);
    }
}
