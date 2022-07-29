using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BMS
{
    public partial class Command : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetRecord();
            }
        }
        SqlConnection connection = new SqlConnection("data source=DESKTOP-TIH3JDS; database=login; Trusted_Connection=True;");

        public object DropDownList1 { get; private set; }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int EmpId = int.Parse(TextBox6.Text);
            string EmpName = TextBox1.Text, EmpContact = TextBox2.Text, EmpConcern = TextBox3.Text, EmpLocation = TextBox4.Text, EmpStatus = DropDownList2.SelectedValue;
            DateTime EmpDate = DateTime.Parse(TextBox5.Text);
            connection.Open();
            SqlCommand command = new SqlCommand("Insert into Command values ('" + EmpId + "','" + EmpName + "','" + EmpContact + "','" + EmpConcern + "','" + EmpLocation + "','" + EmpDate + "','" + EmpStatus + "')", connection);
            command.ExecuteNonQuery();
            connection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully saved');", true);
            GetRecord();
        }

        void GetRecord()
        {
            SqlCommand command = new SqlCommand("Select *from Command", connection);
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int EmpId = int.Parse(TextBox6.Text);
            string EmpName = TextBox1.Text, EmpContact = TextBox2.Text, EmpConcern = TextBox3.Text, EmpLocation = TextBox4.Text, EmpStatus = DropDownList2.SelectedValue;
            DateTime EmpDate = DateTime.Parse(TextBox5.Text);
            connection.Open();
            SqlCommand command = new SqlCommand("Update Command set EmpName = '" + EmpName + "', EmpContact ='" + EmpContact + "', EmpConcern ='" + EmpConcern + "',EmpLocation = '" + EmpLocation + "',EmpDate = '" + EmpDate + "',EmpStatus ='" + EmpStatus + "'where EmpId = '" + EmpId + "'", connection);
            command.ExecuteNonQuery();
            connection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Updated');", true);
            GetRecord();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int EmpId = int.Parse(TextBox6.Text);
            connection.Open();
            SqlCommand command = new SqlCommand("Delete Command where EmpId = '" + EmpId + "'", connection);
            command.ExecuteNonQuery();
            connection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Deleted');", true);
            GetRecord();
        }
    }
}
