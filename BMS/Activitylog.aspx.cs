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
    public partial class Activitylog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
            lb1.Text = "<font color=black>" + "Welcome : " + "</font>" + "<font color=blue>" + Session["FirstName"] + "</font>";
        }
        private void BindGridView()
        {
            string constring = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
          
      
            using (SqlConnection con = new SqlConnection(constring))
            {
                SqlCommand comm = new SqlCommand("select * from AllDone where Email='" + Session["FirstName"].ToString() + "'", con);
                SqlDataAdapter d = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}