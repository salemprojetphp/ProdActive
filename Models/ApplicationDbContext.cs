using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace _.Models;
// This DbContext class is derived from IdentityDbContext to include Identity tables
public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
{
    public DbSet<Feedback>? Feedbacks { get; set; }
    public DbSet<ReunionParticipant>? ReunionParticipants { get; set; }
    public DbSet<ProjectEmployee>? ProjectEmployees { get; set; }
    public DbSet<ApplicationUser>? ApplicationUsers { get; set; }
    public DbSet<Reunion>? Reunions { get; set; }
    public DbSet<Project>? Projects { get; set; }
    public DbSet<Pointage>? Pointages { get; set; }
    public DbSet<Conge>? Conges { get; set; }
    public DbSet<Tache>? Tasks { get; set; }     

    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ProjectEmployee>()
            .HasKey(pe => new { pe.ProjectId, pe.EmployeeId });
        
        modelBuilder.Entity<ProjectEmployee>()
            .HasOne(pe => pe.Project)
            .WithMany(p => p.ProjectEmployees)
            .HasForeignKey(pe => pe.ProjectId);

        modelBuilder.Entity<ProjectEmployee>()
            .HasOne(pe => pe.Employee)
            .WithMany(e => e.ProjectEmployees)
            .HasForeignKey(pe => pe.EmployeeId);
        
        modelBuilder.Entity<ReunionParticipant>()
            .HasKey(rp => new { rp.ReunionId, rp.EmployeeId });
        
        modelBuilder.Entity<ReunionParticipant>()
            .HasOne(rp => rp.Reunion)
            .WithMany(r => r.ReunionParticipants)
            .HasForeignKey(rp => rp.ReunionId);
        
        modelBuilder.Entity<ReunionParticipant>()
            .HasOne(rp => rp.Employee)
            .WithMany(e => e.ReunionParticipants)
            .HasForeignKey(rp => rp.EmployeeId);

        base.OnModelCreating(modelBuilder);
    }
}
