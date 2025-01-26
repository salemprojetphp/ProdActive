using _.Models;
using Microsoft.AspNetCore.Mvc;

namespace Project_ERP.Controllers;

public class FeedbackController : Controller
{
    public ActionResult Index()
    {
        return View();
    }
}
