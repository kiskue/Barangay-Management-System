using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace BMS
{
    public partial class barangaycertificates : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
           
           
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
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

        void LoadRecord()
        {
            string constring = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                SqlCommand comm = new SqlCommand("select * from Brg_Clearance ", con);
                SqlDataAdapter d = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        protected void btnselect_Click(object sender, EventArgs e)
        {
             ReportDocument reportdocument = new ReportDocument();
                reportdocument.Load(Server.MapPath("CrystalReport1.rpt"));
                reportdocument.SetDatabaseLogon("", "", "DESKTOP-TIH3JDS", "login");
                reportdocument.SetParameterValue("Email", Email.Text);
                CrystalReportViewer1.ReportSource = reportdocument;
            
        }
        protected void btnsend_Click(object sender, EventArgs e)
        {

            WebClient webClient = new WebClient();
            NameValueCollection nameValueCollection = new NameValueCollection();
            nameValueCollection.Add("1", Textbox1.Text);
            nameValueCollection.Add("2", Textbox2.Text);
            nameValueCollection.Add("3", "TR-GERRI770190_N23WN");
            nameValueCollection.Add("passwd", "gerric12345");

            byte[] send = webClient.UploadValues("https://api.itexmo.com/api/broadcast", "POST", nameValueCollection);
            System.Text.UTF8Encoding.UTF8.GetString(send);
           
        }
    }
}