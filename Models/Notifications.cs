namespace _.Models
{
    public class Notification
    {
        public int Id { get; set; }
        public string UserId { get; set; }  // The user the notification is for
        public string Message { get; set; }
        public bool IsRead { get; set; } = false;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        // Foreign key relationship to Project
        public int? ProjectId { get; set; }
        public Project Project { get; set; }
    }  
}