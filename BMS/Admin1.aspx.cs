using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;
namespace BMS
{
    public partial class Admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select IncidentReport, count(ID) Total from Report where  Barangay = 'Hagonoy' group by IncidentReport", conn))
                    {
                        Series series = PieChartMonthToDate.Series["Series1"];
                        conn.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            series.Points.AddXY(rdr["IncidentReport"].ToString(), rdr["Total".ToString()]);
                            PieChartMonthToDate.Series["Series1"].Label = "#PERCENT{P2}";
                            PieChartMonthToDate.Series["Series1"].LegendText = "#VALX";
                            PieChartMonthToDate.Legends[0].LegendStyle = LegendStyle.Column;
                            PieChartMonthToDate.Legends[0].Docking = Docking.Right;
                            PieChartMonthToDate.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                        }
                        rdr.Close();
                    }
                }
            }
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select Religion, count(ID) Total from GoogleMap where  Barangay = 'Hagonoy' group by Religion", conn))
                    {
                        Series series = Chart1.Series["Series1"];
                        conn.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            series.Points.AddXY(rdr["Religion"].ToString(), rdr["Total".ToString()]);
                            Chart1.Series["Series1"].Label = "#PERCENT{P2}";
                            Chart1.Series["Series1"].LegendText = "#VALX";
                            Chart1.Legends[0].LegendStyle = LegendStyle.Column;
                            Chart1.Legends[0].Docking = Docking.Right;
                            Chart1.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                        }
                        rdr.Close();
                    }
                }
            }
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select Status, count(ID) Total from GoogleMap where  Barangay = 'Hagonoy' group by Status", conn))
                    {
                        Series series = Chart2.Series["Series1"];
                        conn.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();
                        while (rdr.Read())
                        {
                            series.Points.AddXY(rdr["Status"].ToString(), rdr["Total".ToString()]);
                            Chart2.Series["Series1"].Label = "#PERCENT{P2}";
                            Chart2.Series["Series1"].LegendText = "#VALX";
                            Chart2.Legends[0].LegendStyle = LegendStyle.Column;
                            Chart2.Legends[0].Docking = Docking.Right;
                            Chart2.Legends[0].Alignment = System.Drawing.StringAlignment.Center;
                        }
                        rdr.Close();
                    }
                }
            }

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
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) As Count FROM Report", con))
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