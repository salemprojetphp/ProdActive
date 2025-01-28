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
public class AttendanceEntry
{
    public DateTime Date { get; set; }
    public int TransactionType { get; set; } // 1 = Entry, 0 = Pause, 2 = Resume, -1 = Exit
}

