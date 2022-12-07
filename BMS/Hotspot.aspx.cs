using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.DataVisualization.Charting;

namespace BMS
{
    public partial class Hotspot : System.Web.UI.Page
    {
        public object Name { get; internal set; }

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

            lb1.Text = "<b><font color=black>" + "Welcome : " + "</font>" + "<b><font color=blue>" + Session["Username"] + "</font>";
        
            string constring = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
               
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) As Count FROM Report Where Place = 'Dreamlad'; ", con))
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
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) As Count FROM Report Where Place = 'SeaBrezz'; ", con))
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
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) As Count FROM Report Where Place = 'Pag-asa'; ", con))
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
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) As Count FROM Report Where Place = 'Creekland'; ", con))
                {
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    object o = cmd.ExecuteScalar();
                    if (o != null)
                    {
                        Label4.Text = "" + o.ToString();
                    }
                    con.Close();
                }
            }
             
            if (!this.IsPostBack)
            {
                DataTable dt = this.GetData("select * from Report");
                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();
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
            if (!string.IsNullOrEmpty(report.Value))
            {
                DataTable dt = this.GetData("select * from Report where IncidentReport = '" + report.Value + "'");
                if (dt.Rows.Count > 0)
                {
                    rptMarkers.DataSource = dt;
                    rptMarkers.DataBind();
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
               "swal('Not Found!', 'No Data Recorded!', 'error')", true);

                }
            }
        }
      
      
    }
}
