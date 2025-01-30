using _.Models;
using _.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace _.Services
{
    public class FeedbackService : IFeedbackService
    {
        private readonly IRepository<Feedback> _feedbackRepository;
        private readonly SentimentAnalysisService _sentimentAnalysisService;

        public FeedbackService(IRepository<Feedback> feedbackRepository, SentimentAnalysisService sentimentAnalysisService)
        {
            _feedbackRepository = feedbackRepository;
            _sentimentAnalysisService = sentimentAnalysisService;
        }

        public async Task<IEnumerable<Feedback>> GetAllFeedbackAsync()
        {
            return await _feedbackRepository.GetAllAsync();
        }

        public async Task<Feedback> GetFeedbackByIdAsync(int id)
        {
            return await _feedbackRepository.GetByIdAsync(id);
        }

        public async Task AddFeedbackAsync(Feedback feedback)
        {
            var rating= await _sentimentAnalysisService.GetSentimentRating(feedback.Message);
            feedback.Rating = rating;
            await _feedbackRepository.AddAsync(feedback);
        }

        public async Task UpdateFeedbackAsync(Feedback feedback)
        {
            await _feedbackRepository.UpdateAsync(feedback);
        }

        public async Task DeleteFeedbackAsync(int id)
        {
            await _feedbackRepository.DeleteAsync(id);
        }
    }
}
