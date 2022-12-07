using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;

namespace BMS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Year.Attributes.Add("readonly", "readonly");
            name.Attributes.Add("readonly", "readonly");
            email.Attributes.Add("readonly", "readonly");
            contact.Attributes.Add("readonly", "readonly");
           

            lb1.Text = "<font color=black>" + "Welcome : " + "</font>" + "<font color=blue>" + Session["FirstName"] + "</font>";
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT FullName,Email,Number FROM UserM WHERE Email = '" + Session["FirstName"].ToString() + "'"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            name.Text = sdr["FullName"].ToString();
                            email.Text = sdr["Email"].ToString();
                            contact.Text = sdr["Number"].ToString();
                          

                        }
                        con.Close();
                    }
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
                cmd.Parameters.AddWithValue("Email", email.Text);
                cmd.Parameters.AddWithValue("Latitude", lat.Text);
                cmd.Parameters.AddWithValue("Longitude", lng.Text);
                cmd.Parameters.AddWithValue("Landmark", landmark.Text);
                cmd.Parameters.AddWithValue("IncidentReport", repor.Value);
                cmd.Parameters.AddWithValue("Contact", contact.Text);
                cmd.Parameters.AddWithValue("Place", place.Value);
                cmd.Parameters.AddWithValue("Time", time.Text);
                cmd.Parameters.AddWithValue("Date", Year.Text);
                cmd.Parameters.AddWithValue("Barangay", Barangay.Text);
                con.Open();
                int k = cmd.ExecuteNonQuery();
                if (k != 0)
                {

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Thank You!', 'Your Report sent Successfully!', 'success')", true);

                    name.Text = "";
                    lat.Text = "";
                    lng.Text = "";
                    landmark.Text = "";
                    repor.Value = "";
                    contact.Text = "";
                    place.Value = "";
                    time.Text = "";
                    Year.Text = "";
                }
                con.Close();
      
            }

        }

    }
}