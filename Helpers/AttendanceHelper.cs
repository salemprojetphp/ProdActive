namespace _.Helpers;

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using _.Models;

public static class DateTimeExtensions
{
    // Extension method to get the start of the week (Monday)
    public static DateTime StartOfWeek(this DateTime dateTime, DayOfWeek startOfWeek)
    {
        var diff = dateTime.DayOfWeek - startOfWeek;
        if (diff < 0)
        {
            diff += 7;
        }
        return dateTime.AddDays(-diff).Date;
    }

    // Get the start and end dates of this week
    public static (DateTime startOfWeek, DateTime endOfWeek) GetThisWeekDateRange()
    {
        var startOfWeek = StartOfWeek(DateTime.Now, DayOfWeek.Monday);
        var endOfWeek = startOfWeek.AddDays(7); // end of the week (Sunday night)
        return (startOfWeek, endOfWeek);
    }

    // General method to process attendance data to calculate working hours and pause hours
    public static (List<TimeSpan> workingHours, List<TimeSpan> pauseHours) ProcessAttendanceData(
    List<AttendanceEntry> entries, 
    List<string> daysOfWeek)
    {
        var workingHours = new List<TimeSpan> { TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero };
        var pauseHours = new List<TimeSpan> { TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero };

        // Loop through each day of the week and calculate working/pause hours
        foreach (var day in daysOfWeek)
        {
            var dailyEntries = entries
                .Where(entry => entry.Date.DayOfWeek.ToString().Substring(0, 3) == day)
                .OrderBy(entry => entry.Date)
                .ToList();

            DateTime? entryTime = null;
            DateTime? exitTime = null;
            DateTime? pauseStartTime = null;

            foreach (var entry in dailyEntries)
            {
                switch (entry.TransactionType)
                {
                    case 1: // Entry
                        entryTime = entryTime ?? entry.Date; // Only set if not already set
                        break;
                    case 0: // Pause
                        pauseStartTime = entry.Date;
                        break;
                    case 2: // Resume
                        if (pauseStartTime.HasValue)
                        {
                            pauseHours[daysOfWeek.IndexOf(day)] += entry.Date - pauseStartTime.Value;
                            pauseStartTime = null; // Reset after processing
                        }
                        break;
                    case -1: // Exit
                        exitTime = entry.Date;
                        break;
                }
            }

            // Calculate working hours for the day
            if (entryTime.HasValue && exitTime.HasValue)
            {
                var totalWorked = exitTime.Value - entryTime.Value;
                var pauses = pauseHours[daysOfWeek.IndexOf(day)];
                workingHours[daysOfWeek.IndexOf(day)] += totalWorked - pauses; // Subtract pauses from total work
            }
        }

        return (workingHours, pauseHours);
    }

    public static (List<TimeSpan> workingHours, List<TimeSpan> pauseHours) ProcessAttendanceDataProjectChief(
    List<AttendanceEntry> entries, 
    List<string> daysOfWeek)
    {
        var workingHours = new List<TimeSpan> { TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero };
        var pauseHours = new List<TimeSpan> { TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero, TimeSpan.Zero };

        Console.WriteLine("Days of the week: " + string.Join(", ", daysOfWeek));
        Console.WriteLine("Entries Count: " + entries.Count);

        // Loop through each day of the week and calculate working/pause hours
        foreach (var day in daysOfWeek)
        {
            // Filter entries for the current day
            var dailyEntries = entries
                .Where(entry => entry.Date.ToString("ddd") == day)  // Check if the day matches
                .OrderBy(entry => entry.Date)
                .ToList();

            // If no entries are found for this day, log and skip
            if (dailyEntries.Count == 0)
            {
                continue;
            }

            DateTime? entryTime = null;
            DateTime? exitTime = null;
            DateTime? pauseStartTime = null;

            foreach (var entry in dailyEntries)
            {
                switch (entry.TransactionType)
                {
                    case 1: // Entry
                        entryTime = entryTime ?? entry.Date; // Only set if not already set
                        break;
                    case 0: // Pause
                        pauseStartTime = entry.Date;
                        break;
                    case 2: // Resume
                        if (pauseStartTime.HasValue)
                        {
                            pauseHours[daysOfWeek.IndexOf(day)] += entry.Date - pauseStartTime.Value;
                            pauseStartTime = null; // Reset after processing
                        }
                        break;
                    case -1: // Exit
                        exitTime = entry.Date;
                        break;
                }
            }

            // Calculate working hours for the day
            if (entryTime.HasValue && exitTime.HasValue)
            {
                var totalWorked = exitTime.Value - entryTime.Value;
                var pauses = pauseHours[daysOfWeek.IndexOf(day)];
                workingHours[daysOfWeek.IndexOf(day)] += totalWorked - pauses; // Subtract pauses from total work
            }
            else
            {
                Console.WriteLine($"Skipping day {day} for employee due to missing entry or exit time.");
            }
        }

        // Log accumulated working hours
        Console.WriteLine("Total accumulated working hours (by day):");
        for (int i = 0; i < daysOfWeek.Count; i++)
        {
            Console.WriteLine($"{daysOfWeek[i]}: {workingHours[i]}");
        }

        return (workingHours, pauseHours);
    }
}


public static class AttendanceHelper{
    public static Dictionary<string, int> GetLeaveFrequency(IEnumerable<Conge> conges)
    {
        var leaveFrequency = conges
            .Where(c => c.DateDebut != null && c.DateDebut >= DateTime.Now.AddMonths(-1)) // Last month
            .GroupBy(c => c.EmployeeId)
            .Select(g => new
            {
                EmployeeId = g.Key,
                LeaveCount = g.Count()
            })
            .ToList();

        return leaveFrequency.ToDictionary(lf => lf.EmployeeId.ToString(), lf => lf.LeaveCount);
    }

    public static Dictionary<string, double> GetAvgWorkingHours(IEnumerable<Pointage> pointages)
    {
        var workingHours = pointages
            .Where(p => p.Date >= DateTime.Now.AddMonths(-2)) // Last 2 months
            .OrderBy(p => p.Date) // Ensure transactions are in order
            .GroupBy(p => new { p.EmployeeId, p.Date.Date }) // Group by Employee and Date
            .Select(g => new
            {
                EmployeeId = g.Key.EmployeeId,
                Date = g.Key.Date,
                WorkingHours = g.Any(p => p.TransactionType == 1) && g.Any(p => p.TransactionType == -1)
                    ? (g.Where(p => p.TransactionType == -1).Max(p => p.Date) - 
                    g.Where(p => p.TransactionType == 1).Min(p => p.Date)).TotalHours
                    : 0 // If missing entry or exit, assume 0 hours
            })
            .GroupBy(p => p.EmployeeId)
            .Select(g => new
            {
                EmployeeId = g.Key,
                AvgWorkingHours = g.Average(p => p.WorkingHours)
            })
            .ToList();

        return workingHours.ToDictionary(wh => wh.EmployeeId.ToString(), wh => wh.AvgWorkingHours);
    }

    public static Dictionary<string, double> GetAttendanceRate(IEnumerable<Pointage> pointages)
    {
        var attendanceRate = pointages
            .Where(p => p.Date >= DateTime.Now.AddMonths(-1)) // Last month
            .GroupBy(p => new { p.EmployeeId, p.Date.Date })
            .Select(g => new
            {
                EmployeeId = g.Key.EmployeeId,
                Date = g.Key.Date,
                Present = g.Any(p => p.TransactionType == 1) // Simplified logic
            })
            .GroupBy(p => p.EmployeeId)
            .Select(g => new
            {
                EmployeeId = g.Key,
                AttendanceRate = (double)g.Count(p => p.Present) / g.Select(p => p.Date).Distinct().Count() * 100
            })
            .ToList();

        return attendanceRate.ToDictionary(ar => ar.EmployeeId.ToString(), ar => ar.AttendanceRate);
    }

    public static Dictionary<string, int> GetLateArrivals(IEnumerable<Pointage> pointages)
    {
        var lateArrivals = pointages
            .Where(p => p.Date >= DateTime.Now.AddMonths(-1) && p.TransactionType == 1) // Last month, entry points
            .GroupBy(p => p.EmployeeId)
            .Select(g => new
            {
                EmployeeId = g.Key,
                LateCount = g.Count(p => p.Date.Hour >= 9) // Count late arrivals (after 9 AM)
            })
            .ToList();

        return lateArrivals.ToDictionary(la => la.EmployeeId.ToString(), la => la.LateCount);
    }

    public static Dictionary<string, double> GetLeaveUtilizationRate(IEnumerable<Conge> conges)
    {
        var leaveUtilizationRate = conges
            .Where(c => c.DateDebut >= DateTime.Now.AddMonths(-1)) // Last month
            .GroupBy(c => c.EmployeeId)
            .Select(g => new
            {
                EmployeeId = g.Key,
                TotalLeaveTaken = g.Count(),
                TotalLeaveAllocated = 20 
            })
            .Select(l => new
            {
                l.EmployeeId,
                LeaveUtilizationRate = (double)l.TotalLeaveTaken / l.TotalLeaveAllocated * 100
            })
            .ToList();

        return leaveUtilizationRate.ToDictionary(lr => lr.EmployeeId.ToString(), lr => lr.LeaveUtilizationRate);
    }

    public static Dictionary<string, int> GetPendingLeaveRequests(IEnumerable<Conge> conges)
    {
        var pendingLeaveRequests = conges
            .Where(c => c.Status == 0) // Pending status (Status = 0)
            .GroupBy(c => c.Status)
            .Select(g => new
            {
                Status = g.Key,
                PendingCount = g.Count()
            })
            .ToList();

        return pendingLeaveRequests.ToDictionary(p => p.Status.ToString(), p => p.PendingCount);
    }

    public static Dictionary<string, int> GetAcceptedLeaveRequests(IEnumerable<Conge> conges)
    {
        var acceptedLeaveRequests = conges
            .Where(c => c.Status == 1) // Accepted status
            .GroupBy(c => c.Status)
            .Select(g => new
            {
                Status = g.Key,
                PendingCount = g.Count()
            })
            .ToList();

        return acceptedLeaveRequests.ToDictionary(p => p.Status.ToString(), p => p.PendingCount);
    }

    public static Dictionary<string, int> GetRejectedLeaveRequests(IEnumerable<Conge> conges)
    {
        var rejectedLeaveRequests = conges
            .Where(c => c.Status == -1) // Rejected status
            .GroupBy(c => c.Status)
            .Select(g => new
            {
                Status = g.Key,
                PendingCount = g.Count()
            })
            .ToList();

        return rejectedLeaveRequests.ToDictionary(p => p.Status.ToString(), p => p.PendingCount);
    }

}

public class AttendanceEntry
{
    public DateTime Date { get; set; }
    public int TransactionType { get; set; } // 1 = Entry, 0 = Pause, 2 = Resume, -1 = Exit
}