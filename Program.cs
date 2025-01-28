using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.EntityFrameworkCore;
using _.Models;
using _.Repositories;
using _.Services;

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// Add services and repos to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

//REPOSITORIES
builder.Services.AddScoped<IRepository<Project>, Repository<Project>>();
builder.Services.AddScoped<IRepository<ProjectEmployee>, Repository<ProjectEmployee>>();
builder.Services.AddScoped<IRepository<TrackedProjects>, Repository<TrackedProjects>>();
builder.Services.AddScoped<IRepository<ProjectEmployee>, Repository<ProjectEmployee>>();
builder.Services.AddScoped<IRepository<ReunionParticipant>, Repository<ReunionParticipant>>();
builder.Services.AddScoped<IRepository<Feedback>, Repository<Feedback>>();
builder.Services.AddScoped<IRepository<Pointage>, Repository<Pointage>>();

//SERVICES
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IProjectService, ProjectService>();
builder.Services.AddScoped<IPointageService, PointageService>();



// Add DbContext and Identity services

builder.Services.AddScoped(typeof(IRepository<Feedback>), typeof(Repository<Feedback>));
builder.Services.AddScoped<IFeedbackService, FeedbackService>();

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));
builder.Services.AddDefaultIdentity<ApplicationUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<ApplicationDbContext>();
builder.Services.AddTransient<IEmailSender, EmailSender>();
builder.Services.Configure<AuthMessageSenderOptions>(builder.Configuration);
builder.Services.Configure<IdentityOptions>(options =>{
    // Password settings.
    options.Password.RequireDigit = true;
    options.Password.RequireLowercase = true;
    options.Password.RequiredLength = 6;
    options.Password.RequiredUniqueChars = 1;
    // Lockout settings.
    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5);
    options.Lockout.AllowedForNewUsers = true;
    // User settings.
    options.User.AllowedUserNameCharacters =
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._@+";
    options.User.RequireUniqueEmail = false;
});
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

app.UseAuthentication();
app.UseAuthorization();


app.MapRazorPages();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
