using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using BMS.Models;
using System.Data.Entity;

namespace BMS.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home

        public ActionResult Index()
        {
           
            return View();
        }
        public ActionResult Dashboard()
        {
            return View();
        }
      
        public ActionResult Location()
        {

            string markers = "[";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("GetMap", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    markers += "{";
                    markers += string.Format("'title': '{0}',", sdr["ResidenceName"]);
                    markers += string.Format("'lat': '{0}',", sdr["Latitude"]);
                    markers += string.Format("'lng': '{0}',", sdr["Longitude"]);
                    markers += string.Format("'description': '{0}'", sdr["Address"]);
                    markers += "},";
                }
            }
            markers += "];";
            ViewBag.Markers = markers;
            return View();
        }
        [HttpPost]
        public ActionResult Location(Location location)
        {
            if (ModelState.IsValid)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("AddNewLocation", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.AddWithValue("@ResidenceName", location.ResidenceName);
                    cmd.Parameters.AddWithValue("@Latitude", location.Latitude);
                    cmd.Parameters.AddWithValue("@Longitude", location.Longitude);
                    cmd.Parameters.AddWithValue("@Address", location.Address);
                    cmd.Parameters.AddWithValue("@Occupation", location.Occupation);
                    cmd.Parameters.AddWithValue("@Contact", location.Contact);
                    cmd.Parameters.AddWithValue("@Birthday", location.Birthday);
                    cmd.Parameters.AddWithValue("@Sex", location.Sex);
                    cmd.Parameters.AddWithValue("@Religion", location.Religion);
                    cmd.Parameters.AddWithValue("@Status", location.Status);
                    cmd.Parameters.AddWithValue("@Other", location.Other);
                    cmd.Parameters.AddWithValue("@NationalId", location.NationalId);
                    cmd.Parameters.AddWithValue("@Voter", location.Voter);
                    cmd.Parameters.AddWithValue("@Barangay", location.Barangay);
                    cmd.ExecuteNonQuery();

                    TempData["pesan"] = "Data has been save successfuly!!";
                
                }
            }
            else
            {
              
            }

            return RedirectToAction("Location");
        }
        public ActionResult Update()
        {
            string markers = "[";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("GetMap", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    markers += "{";
                   
                    markers += string.Format("'title': '{0}',", sdr["ResidenceName"]);
                    markers += string.Format("'lat': '{0}',", sdr["Latitude"]);
                    markers += string.Format("'lng': '{0}',", sdr["Longitude"]);
                    markers += string.Format("'description': '{0}'", sdr["Address"]);
                    markers += "},";
                }
            }
            markers += "];";
            ViewBag.Markers = markers;
            return View();
        }
        [HttpPost]
        public ActionResult Update(Update  Update)
        {
            if (ModelState.IsValid)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("UpdateLocation", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.AddWithValue("@ID", Update.ID);
                    cmd.Parameters.AddWithValue("@ResidenceName", Update.ResidenceName);
                    cmd.Parameters.AddWithValue("@Latitude", Update.Latitude);
                    cmd.Parameters.AddWithValue("@Longitude", Update.Longitude);
                    cmd.Parameters.AddWithValue("@Address", Update.Address);
                    cmd.Parameters.AddWithValue("@Occupation", Update.Occupation);
                    cmd.Parameters.AddWithValue("@Contact", Update.Contact);
                    cmd.Parameters.AddWithValue("@Birthday", Update.Birthday);
                    cmd.Parameters.AddWithValue("@Sex", Update.Sex);
                    cmd.Parameters.AddWithValue("@Religion", Update.Religion);
                    cmd.Parameters.AddWithValue("@Status", Update.Status);
                    cmd.ExecuteNonQuery();
                    
                }
            }
            else
            {

            }
            return RedirectToAction("Location");
        }
        public ActionResult Filter()
        {
            string markers = "[";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("GetMap", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    markers += "{";

                    markers += string.Format("'title': '{0}',", sdr["ResidenceName"]);
                    markers += string.Format("'lat': '{0}',", sdr["Latitude"]);
                    markers += string.Format("'lng': '{0}',", sdr["Longitude"]);
                    markers += string.Format("'description': '{0}'", sdr["Address"]);
                    markers += "},";
                }
            }
            markers += "];";
            ViewBag.Markers = markers;
            return View();
        }
        [HttpPost]
        public ActionResult Filter(Models.Filter Filter)
        {
            if (ModelState.IsValid)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("UpdateLocation", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.AddWithValue("@ID", Filter.ID);
                    cmd.Parameters.AddWithValue("@ResidenceName", Filter.ResidenceName);
                    cmd.Parameters.AddWithValue("@Latitude", Filter.Latitude);
                    cmd.Parameters.AddWithValue("@Longitude", Filter.Longitude);
                    cmd.Parameters.AddWithValue("@FamilyMember", Filter.FamilyMember);
                    cmd.ExecuteNonQuery();

                }
            }
            else
            {

            }
            return RedirectToAction("Location");
        }
       


    }

}
