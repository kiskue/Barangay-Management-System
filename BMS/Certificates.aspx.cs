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
    public partial class Certificates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
            lb1.Text = "<font color=black>" + "Welcome : " + "</font>" + "<font color=blue>" + Session["FirstName"] + "</font>";
        }
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
           

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                con.Open();
                SqlCommand commandToCheckEmail = new SqlCommand("select Email from Brg_Clearance where Email='" +Email.Text +"'", con);
                string pid = (string)commandToCheckEmail.ExecuteScalar();
                con.Close();
                if (pid == Email.Text)
                {

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Sorry!', 'One request only at a time!', 'error')", true);
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("AddCertificates", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", Name.Text);
                    cmd.Parameters.AddWithValue("@Email", Email.Text);
                    cmd.Parameters.AddWithValue("@Number", Number.Text);
                    cmd.Parameters.AddWithValue("@StreetNum", StreetNum.Text);
                    cmd.Parameters.AddWithValue("@Purok", Purok.Text);
                    cmd.Parameters.AddWithValue("@Purpose", Purpose.Text);
                    cmd.Parameters.AddWithValue("@Year", Year.Text);
                    cmd.Parameters.AddWithValue("@Day", Day.Value);
                    cmd.Parameters.AddWithValue("@Month", Month.Value);
                    con.Open();
                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Thank You!', 'Your Request sent Successfully!', 'success')", true);

                        Name.Text = "";
                        Email.Text = "";
                        Email.Text = "";
                        Number.Text = "";
                        StreetNum.Text = "";
                        Purok.Text = "";
                        Purpose.Text = "";
                        Year.Text = "";
                        Day.Value = "";
                        Month.Value = "";
                    }
                    con.Close();
                    LoadRecord();
                    Response.Redirect(Request.Path);
                }
                
            }

        }
        void LoadRecord()
        {
            string constring = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                SqlCommand comm = new SqlCommand("select * from Brg_Clearance where Email='" + Session["FirstName"].ToString() + "'", con);
                SqlDataAdapter d = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
       
    }
}