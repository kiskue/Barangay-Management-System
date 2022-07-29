using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace BMS.Controllers
{
    public class UserDashController : Controller
    {
        [Authorize]
        // GET: UserDash
        public ActionResult Index()
        {
            return View();
        }
        [Authorize]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Register");
        }
    }
}