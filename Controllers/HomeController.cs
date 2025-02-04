using System.Diagnostics;
using System.Security.Claims;
using _.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Project_ERP.Models;
using _.Services;

namespace _.Controllers;
[Authorize]
public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly ProductivityML _productivityML;
    private readonly ITacheService _tacheService;
    private readonly UserManager<ApplicationUser> _userManager;

    public HomeController(ILogger<HomeController> logger, ProductivityML productivityML, 
                          UserManager<ApplicationUser> userManager, ITacheService tacheService)
    {
        _productivityML = productivityML;
        _logger = logger;
        _userManager = userManager;
        _tacheService = tacheService;
    }

    public async Task<IActionResult> Index()
    {
        // Get the user
        var user = await _userManager.GetUserAsync(User);

        // Get the productivity data
        var productivityData = _productivityML.GetProductivityData(user)
            .ToDictionary(kvp => kvp.Key, kvp => kvp.Value.ToString());
        float score = await _productivityML.GetProductivityScore(productivityData);

        // Get the user's tasks
        var tasks = await _tacheService.GetAllTachesAsync(user.Id);
        
        // Pass both score and tasks to the view
        var model = new HomeViewModel
        {
            Score = score,
            Tasks = tasks
        };

        // Pass the user's Id to the view
        ViewData["UserUsername"] = user.UserName;
        // The user is logged in
        return View(model);
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
