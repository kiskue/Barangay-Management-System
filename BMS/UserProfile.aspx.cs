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
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                            FirstName.Text = sdr["FullName"].ToString();
                            Email.Text = sdr["Email"].ToString();
                            Number.Text = sdr["Number"].ToString();
                            Address.Text = sdr["Address"].ToString();
                        
                        }
                        con.Close();
                    }
                }
            }
        }
    }
}