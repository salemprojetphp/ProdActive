using _.Models;
using Microsoft.EntityFrameworkCore;

namespace _.Services
{
    public class NotificationService
    {
        private readonly ApplicationDbContext _context;

        public NotificationService(ApplicationDbContext context)
        {
            _context = context;
        }

        // Add a notification with project reference
        public async Task AddNotificationAsync(string userId, string message, int? projectId = null)
        {
            var notification = new Notification
            {
                UserId = userId,
                Message = message,
                ProjectId = projectId
            };

            _context.Notifications.Add(notification);
            await _context.SaveChangesAsync();
        }

        // Get unread notifications with project details
        public async Task<List<Notification>> GetUnreadNotificationsAsync(string userId)
        {
            return await _context.Notifications
                .Include(n => n.Project)
                .Where(n => n.UserId == userId && !n.IsRead)
                .OrderByDescending(n => n.CreatedAt)
                .ToListAsync();
        }

        // Mark a notification as read
        public async Task MarkAsReadAsync(int notificationId)
        {
            var notification = await _context.Notifications.FindAsync(notificationId);
            if (notification != null)
            {
                notification.IsRead = true;
                await _context.SaveChangesAsync();
            }
        }
    }
}
