using _.Models;
using _.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

public class NotificationController : Controller
{
    private readonly NotificationService _notificationService;
    private readonly UserManager<ApplicationUser> _userManager;

    public NotificationController(NotificationService notificationService, UserManager<ApplicationUser> userManager)
    {
        _notificationService = notificationService;
        _userManager = userManager;
    }

    // Get unread notifications for the current user
    public async Task<IActionResult> GetNotifications()
    {
        var userId = _userManager.GetUserId(User);
        var notifications = await _notificationService.GetUnreadNotificationsAsync(userId);
        return Json(notifications);
    }

    // Mark a notification as read
    public async Task<IActionResult> MarkAsRead(int notificationId)
    {
        await _notificationService.MarkAsReadAsync(notificationId);
        return Ok();
    }
}
