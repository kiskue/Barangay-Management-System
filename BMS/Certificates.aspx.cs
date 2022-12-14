using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

namespace BMS
{
    public partial class Certificates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGridView();
            }
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
          
            Year.Attributes.Add("readonly", "readonly");
            Name.Attributes.Add("readonly", "readonly");
            Email.Attributes.Add("readonly", "readonly");
            Number.Attributes.Add("readonly", "readonly");
            Address.Attributes.Add("readonly", "readonly");
           
            lb1.Text = "<font color=black>" + "Welcome : " + "</font>" + "<font color=blue>" + Session["FirstName"] + "</font>";
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT FullName,Email,Address,Number FROM UserM WHERE Email = '" + Session["FirstName"].ToString() + "'"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            Name.Text = sdr["FullName"].ToString();
                            Email.Text = sdr["Email"].ToString();
                            Number.Text = sdr["Number"].ToString();
                            Address.Text = sdr["Address"].ToString();

                        }
                        con.Close();
                    }
                }
            }
        }
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
           

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand commandToCheckEmail = new SqlCommand("select Email from Brg_Clearance where Email='" + Email.Text + "'", con);
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
                    cmd.Parameters.AddWithValue("@FullName", Name.Text);
                    cmd.Parameters.AddWithValue("@Email", Email.Text);
                    cmd.Parameters.AddWithValue("@Number", Number.Text);
                    cmd.Parameters.AddWithValue("@Address", Address.Text);
                    cmd.Parameters.AddWithValue("@Purpose", Purpose.Text);
                    cmd.Parameters.AddWithValue("@Date", Year.Text);
                    cmd.Parameters.AddWithValue("@Indigency", indigency.Text);
                    cmd.Parameters.AddWithValue("@Pending", pending.Text);

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
                        Address.Text = "";
                        Purpose.Text = "";
                        Year.Text = "";

                    }
                    con.Close();
                    BindGridView();
                }
            }
        }
        private void BindGridView()
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