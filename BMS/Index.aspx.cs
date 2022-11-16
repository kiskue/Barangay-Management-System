using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace BMS
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
       
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(1) FROM Users WHERE Username=@Username AND Password=@Password", con);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text.Trim());
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count == 1)
                {
                    Session["Username"] = txtUsername.Text.Trim();
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    lblError.Text = "Invalid Username or Password";
                }
                if (txtUsername.Text.Trim() == "" || txtpassword.Text.Trim() == "")
                {
                    this.lblError.Text = "Please Enter Username and Password";
                }
                else
                {
                    this.lblError.Text = "Invalid Username or Password";

                    var username = txtUsername.Text.Trim();
                    var password = txtpassword.Text.Trim();


                }

            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            string constring = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
             
                SqlCommand cmd = new SqlCommand("AddNewReport", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Name", name.Text);
                cmd.Parameters.AddWithValue("Latitude", lat.Text);
                cmd.Parameters.AddWithValue("Longitude", lng.Text);
                cmd.Parameters.AddWithValue("Landmark", landmark.Text);
                cmd.Parameters.AddWithValue("IncidentReport", report.Text);
                cmd.Parameters.AddWithValue("Contact", contact.Text);
                cmd.Parameters.AddWithValue("Place", place.Value);
                cmd.Parameters.AddWithValue("Time", time.Text);
                cmd.Parameters.AddWithValue("Date", date.Text);
                con.Open();
                int k = cmd.ExecuteNonQuery();
                if (k != 0)
                {

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Thank You!', 'Your Report sent Successfully!', 'success')",true);

                    name.Text = "";
                    lat.Text = "";
                    lng.Text = "";
                    landmark.Text = "";
                    report.Text = "";
                    contact.Text = "";
                    place.Value = "";
                    time.Text = "";
                    date.Text = "";
                }
                con.Close();
               
            }
            
        }
       
    }
}