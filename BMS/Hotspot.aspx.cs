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
                LoadRecord();
            }
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
                if (!IsPostBack)
            {
                GetChartData();
                GetChartTypes();
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
            if (!string.IsNullOrEmpty(date.Text))
            {
                DataTable dt = this.GetData("select * from Report where Date = '" + date.Text + "'");
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
        private void GetChartTypes()
        {
            foreach (int chartType in Enum.GetValues(typeof(SeriesChartType)))
            {
                ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType), chartType), chartType.ToString());
                ddlChart.Items.Add(li);
            }
        }

        private void GetChartData()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("GetReport", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                // Retrieve the Series to which we want to add DataPoints  
                Series series = Chart1.Series["Series1"];
                // Loop thru each Student record  
                while (rdr.Read())
                {
                    // Add X and Y values using AddXY() method  
                    series.Points.AddXY(rdr["place"].ToString(),
                    rdr["Date"]);
                }
            }
        }

        protected void ddlChart_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Call Get ChartData() method when the user select a different chart type  
            GetChartData();
            this.Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ddlChart.SelectedValue);
        }
        void LoadRecord()
        {
            string constring = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                SqlCommand comm = new SqlCommand("select * from Report", con);
                SqlDataAdapter d = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}
