namespace _.Helpers
{
    using System;
    using System.Linq;
    using _.Models;

    public static class ProjectOverviewHelper
    {
        // Calculates project completion percentage
        public static double CalculateProjectCompletionPercentage(IEnumerable<Tache> tasks)
        {
            var totalTasks = tasks.Count();
            var completedTasks = tasks.Count(t => (t.Status == 1));
            return totalTasks > 0 ? (double)completedTasks / totalTasks * 100 : 0;
        }

        // Calculates remaining days for the project based on its end date
        public static int CalculateRemainingDays(Project project)
        {
            var projectEndDate = project.DateFin;
            if (projectEndDate.HasValue)
            {
                return (projectEndDate.Value - DateTime.Now).Days;
            }
            return 0;
        }

        // Calculates punctuality rate based on attendance data
        public static double CalculatePunctualityRate(IEnumerable<Pointage> pointages)
        {
            var referenceTime = new TimeSpan(8, 30, 0);
            var totalAttendances = pointages.Count(p => p.TransactionType == 1);
            var punctualAttendances = pointages.Count(p => p.TransactionType == 1 && p.Date.TimeOfDay <= referenceTime);
            return totalAttendances > 0 ? (double)punctualAttendances / totalAttendances * 100 : 0;
        }

        // Calculates average break duration from Pointages
        public static TimeSpan CalculateAverageBreakDuration(IEnumerable<Pointage> pointages)
        {
            var pauseStartTimes = new List<DateTime>(); // To track pause start times
            var pauseDurations = new List<TimeSpan>(); // To store the durations of pauses

            DateTime? pauseStartTime = null;

            foreach (var pointage in pointages)
            {
                switch (pointage.TransactionType)
                {
                    case 0: // Pause
                        pauseStartTime = pointage.Date;
                        break;
                    case 2: // Resume
                        if (pauseStartTime.HasValue)
                        {
                            // Calculate the pause duration
                            pauseDurations.Add(pointage.Date - pauseStartTime.Value);
                            pauseStartTime = null; // Reset after processing
                        }
                        break;
                }
            }

            // Calculate average break duration
            var totalBreakMinutes = pauseDurations.Sum(pd => pd.TotalMinutes);
            var breakCount = pauseDurations.Count;

            return breakCount > 0 ? TimeSpan.FromMinutes(totalBreakMinutes / breakCount) : TimeSpan.Zero;
        }
    }
}
