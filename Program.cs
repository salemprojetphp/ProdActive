using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.EntityFrameworkCore;
using _.Models;
using _.Repositories;
using _.Services;

var builder = WebApplication.CreateBuilder(args);

// Load the .env variables
DotNetEnv.Env.Load();
var connectionString = Environment.GetEnvironmentVariable("CONNECTION_STRING");

//  Add Database Context
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));

//  Add Identity Services & Register SignInManager
builder.Services.AddDefaultIdentity<ApplicationUser>(options =>
{
    options.SignIn.RequireConfirmedAccount = true;

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
    options.User.RequireUniqueEmail = true;
})
    .AddRoles<IdentityRole>() 
    .AddEntityFrameworkStores<ApplicationDbContext>();

builder.Services.AddScoped<SignInManager<ApplicationUser>>();
builder.Services.AddScoped<UserManager<ApplicationUser>>();
builder.Services.AddScoped<NotificationService>();

// Email Sender Service
builder.Services.AddTransient<IEmailSender, EmailSender>();
builder.Services.Configure<AuthMessageSenderOptions>(builder.Configuration);

builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

// REPOSITORIES
builder.Services.AddScoped<IRepository<Project>, Repository<Project>>();
builder.Services.AddScoped<IRepository<ProjectEmployee>, Repository<ProjectEmployee>>();
builder.Services.AddScoped<IRepository<TrackedProjects>, Repository<TrackedProjects>>();
builder.Services.AddScoped<IRepository<ReunionParticipant>, Repository<ReunionParticipant>>();
builder.Services.AddScoped<IRepository<Feedback>, Repository<Feedback>>();
builder.Services.AddScoped<IRepository<Pointage>, Repository<Pointage>>();
builder.Services.AddScoped<IRepository<Tache>, Repository<Tache>>();
builder.Services.AddScoped<ProductivityML>();

// SERVICES
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IProjectService, ProjectService>();
builder.Services.AddScoped<IPointageService, PointageService>();
builder.Services.AddScoped<ITacheService, TacheService>();




// Add DbContext and Identity services

builder.Services.AddScoped(typeof(IRepository<Feedback>), typeof(Repository<Feedback>));
builder.Services.AddScoped<IFeedbackService, FeedbackService>();

//  Register Sentiment Analysis Service
builder.Services.AddHttpClient<SentimentAnalysisService>(client =>
{
    client.BaseAddress = new Uri("http://localhost:5000/");
    client.DefaultRequestHeaders.Add("Accept", "application/json");
});

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
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
