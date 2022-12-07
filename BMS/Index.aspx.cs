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
        string strConnString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        string str, UserName, Password;
        SqlCommand com;
        SqlDataAdapter sqlda;
        DataTable dt;
        int RowCount;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "Select * from Role";
            com = new SqlCommand(str);
            sqlda = new SqlDataAdapter(com.CommandText, con);
            dt = new DataTable();
            sqlda.Fill(dt);
            RowCount = dt.Rows.Count;
            for (int i = 0; i < RowCount; i++)
            {
                UserName = dt.Rows[i]["UserName"].ToString();
                Password = dt.Rows[i]["Password"].ToString();
                if (UserName == txtUsername.Text && Password == txtPassword.Text)
                {
                    Session["UserName"] = UserName;
                    if (dt.Rows[i]["Role"].ToString() == "SuperAdmin")
                        Response.Redirect("dashboard.aspx");
                    else if (dt.Rows[i]["Role"].ToString() == "Admin1")
                        Response.Redirect("Admin1.aspx");
                    else if (dt.Rows[i]["Role"].ToString() == "Admin2")
                        Response.Redirect("Admin2.aspx");
                }
                else
                {
                    lblError.Text = "Invalid User Name or Password! Please try again!";
                }
            }
        }


    }
}