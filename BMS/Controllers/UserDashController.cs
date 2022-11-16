using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Mvc;
using System.Web.Security;
using BMS.Models;

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
        public ActionResult Certificates()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Certificates(Certificate certificate)
        {
            if (ModelState.IsValid)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("AddCertificates", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
     
                    cmd.Parameters.AddWithValue("@Name", certificate.Name);
                    cmd.Parameters.AddWithValue("@Email", certificate.Email);
                    cmd.Parameters.AddWithValue("@Number", certificate.Number);
                    cmd.Parameters.AddWithValue("@StreetNum", certificate.StreetNum);
                    cmd.Parameters.AddWithValue("@Purok", certificate.Purok);
                    cmd.Parameters.AddWithValue("@Purpose", certificate.Purpose);
                    cmd.Parameters.AddWithValue("@Day", certificate.Day);
                    cmd.Parameters.AddWithValue("@Month", certificate.Month);
                    cmd.Parameters.AddWithValue("@Year", certificate.Year);
                    cmd.ExecuteNonQuery();

                    TempData["pesan"] = "Data has been save successfuly!!";
                }
            }
            else
            {

            }
            return RedirectToAction("Certificates");
        }
    }
}