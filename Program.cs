using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using _.Models;
using _.Repositories;
using _.Services;

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// Add services and repos to the container.
builder.Services.AddControllersWithViews();

//REPOSITORIES
builder.Services.AddScoped<IRepository<Project>, Repository<Project>>();
builder.Services.AddScoped<IRepository<ProjectEmployee>, Repository<ProjectEmployee>>();
builder.Services.AddScoped<IRepository<TrackedProjects>, Repository<TrackedProjects>>();
builder.Services.AddScoped<IRepository<ProjectEmployee>, Repository<ProjectEmployee>>();
builder.Services.AddScoped<IRepository<ReunionParticipant>, Repository<ReunionParticipant>>();

//SERVICES
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IProjectService, ProjectService>();



// Add DbContext and Identity services

builder.Services.AddScoped(typeof(IRepository<Feedback>), typeof(Repository<Feedback>));
builder.Services.AddScoped<IFeedbackService, FeedbackService>();

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));
builder.Services.AddIdentity<ApplicationUser, IdentityRole>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<ApplicationDbContext>()
    .AddDefaultTokenProviders();

// add mapping of the services 

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
