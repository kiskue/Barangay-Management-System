using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;
using System.Collections;
using System.Data;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace BMS
{
    public partial class dashboard : System.Web.UI.Page
    {
        public object CityName { get; internal set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            lb1.Text = "<b><font color=black>" + "Welcome : " + "</font>" + "<b><font color=blue>" + Session["Username"] + "</font>";
            if (!this.IsPostBack)
            {
                DataTable dt = this.GetData("select * from GoogleMap");
                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();
            }
            string constring = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) As Count FROM GoogleMap", con))
                {
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    object o = cmd.ExecuteScalar();
                    if (o != null)
                    {
                        lblRows.Text = "" + o.ToString();
                    }
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) As Count FROM GoogleMap Where Sex = 'male'; ", con))
                {
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    object o = cmd.ExecuteScalar();
                    if (o != null)
                    {
                        Label1.Text = "" + o.ToString();
                    }
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) As Count FROM GoogleMap Where Sex = 'female'; ", con))
                {
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    object o = cmd.ExecuteScalar();
                    if (o != null)
                    {
                        Label2.Text = "" + o.ToString();
                    }
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) As Count FROM Command", con))
                {
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    object o = cmd.ExecuteScalar();
                    if (o != null)
                    {
                        Label3.Text = "" + o.ToString();
                    }
                    con.Close();
                }
            }

        }

        private DataTable GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;

                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }

            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                DataTable dt = this.GetData("select * from GoogleMap where ResidenceName = '" + txtSearch.Text + "'");
                if (dt.Rows.Count > 0)
                {
                    rptMarkers.DataSource = dt;
                    rptMarkers.DataBind();
                }
                else
                {
                    Response.Write("<script language='javascript'>alert('No result found by this location')</script>");

                }
            }
        }
    }
}