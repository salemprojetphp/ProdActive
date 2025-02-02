namespace _.Models
{
    public class AttendanceDashboardViewModel
    {
        public Dictionary<string, int> LeaveFrequency { get; set; } // Key: Username, Value: Leave Count
        public Dictionary<string, double> AvgWorkingHours { get; set; } // Key: Username, Value: Avg Working Hours
        public Dictionary<string, double> AttendanceRate { get; set; } // Key: Username, Value: Attendance Rate
        public Dictionary<string, int> LateArrivals { get; set; } // Key: Username, Value: Late Arrival Count
        public Dictionary<string, double> LeaveUtilizationRate { get; set; } // Key: Username, Value: Leave Utilization Rate
        public Dictionary<string, int> PendingLeaveRequests { get; set; } // Key: Status (e.g., "0"), Value: Pending Requests Count
        public Dictionary<string, int> AcceptedLeaveRequests { get; set; } // Key: Status (e.g., "1"), Value: Accepted Requests Count
        public Dictionary<string, int> RejectedLeaveRequests { get; set; } // Key: Status (e.g., "-1"), Value: Rejected Requests Count
    }
}
