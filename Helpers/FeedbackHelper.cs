namespace _.Helpers;

using _.Models;

public static class FeedbackHelper
{
    // Helper method to get positive and negative feedback counts for the current week
    public static (List<int> PositiveFeedbacks, List<int> NegativeFeedbacks) GetFeedbackCountsForCurrentWeek(
        IEnumerable<Feedback> feedbacks)
    {
        // Get the current week's start and end dates
        var (startOfWeek, endOfWeek) = GetThisWeekDateRange();

        // Filter feedbacks for the current week and group by day of the week
        var feedbackData = feedbacks
            .Where(f => f.Date >= startOfWeek && f.Date < endOfWeek)
            .GroupBy(f => f.Date.Value.DayOfWeek)
            .Select(g => new
            {
                Day = g.Key,
                PositiveFeedbacks = g.Count(f => f.Rating == 1),
                NegativeFeedbacks = g.Count(f => f.Rating == 0)
            })
            .OrderBy(g => g.Day)
            .ToList();

        // Fill missing days with zero values (if no feedback for a specific day)
        var daysOfWeek = Enum.GetValues(typeof(DayOfWeek)).Cast<DayOfWeek>().ToList();
        
        // Get positive and negative feedbacks for each day
        var positiveFeedbacks = daysOfWeek.Select(day =>
        {
            var feedback = feedbackData.FirstOrDefault(f => (int)f.Day == (int)day);
            return feedback?.PositiveFeedbacks ?? 0;  // Return 0 if no feedback for that day
        }).ToList();

        var negativeFeedbacks = daysOfWeek.Select(day =>
        {
            var feedback = feedbackData.FirstOrDefault(f => (int)f.Day == (int)day);
            return feedback?.NegativeFeedbacks ?? 0;  // Return 0 if no feedback for that day
        }).ToList();

        return (positiveFeedbacks, negativeFeedbacks);
    }

    // Function to get the date range for the current week (Monday to Sunday)
    public static (DateTime startOfWeek, DateTime endOfWeek) GetThisWeekDateRange()
    {
        var startOfWeek = StartOfWeek(DateTime.Now, DayOfWeek.Monday);  // Start of the current week
        var endOfWeek = startOfWeek.AddDays(7);  // End of the current week (Sunday night)
        return (startOfWeek, endOfWeek);
    }

    // Function to get the start of the week (given a reference date and a start day)
    private static DateTime StartOfWeek(DateTime date, DayOfWeek startOfWeek)
    {
        var diff = date.DayOfWeek - startOfWeek;
        if (diff < 0)
        {
            diff += 7; // Adjust for the case where the current day is earlier in the week than the start day
        }
        return date.AddDays(-diff).Date;
    }

    // Method to calculate the percentage of positive and negative feedbacks
    public static (double positivePercentage, double negativePercentage) GetFeedbackPercentages(IEnumerable<Feedback> feedbacks)
    {
        // Calculate total positive and negative feedbacks
        var totalPositive = feedbacks.Count(f => f.Rating == 1);
        var totalNegative = feedbacks.Count(f => f.Rating == 0);
        var totalFeedbacks = feedbacks.Count();

        // Calculate percentages
        var positivePercentage = totalFeedbacks > 0 ? (totalPositive / (double)totalFeedbacks) * 100 : 0;
        var negativePercentage = totalFeedbacks > 0 ? (totalNegative / (double)totalFeedbacks) * 100 : 0;

        return (positivePercentage, negativePercentage);
    }


}