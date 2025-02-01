using System.Diagnostics;
using System.Security.Claims;
using _.Models;
using Microsoft.AspNetCore.Mvc;
using Project_ERP.Models;

namespace _.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly ProductivityML _productivityML;
    private readonly ApplicationDbContext _db;
    public HomeController(ILogger<HomeController> logger, ProductivityML productivityML, ApplicationDbContext db)
    {
        _productivityML = productivityML;
        _logger = logger;
        _db = db;
    }

    public async Task<IActionResult> Index()
    {

        if (User.Identity != null && User.Identity.IsAuthenticated)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var user = _db.ApplicationUsers.Find(userId);
            var productivityData = _productivityML.GetProductivityData(user)
                .ToDictionary(kvp => kvp.Key, kvp => kvp.Value.ToString());
            float score = await _productivityML.GetProductivityScore(productivityData);
            // The user is logged in
            return View(score);
        }
        else{
            return Redirect("/Identity/Account/Login");
        }

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
