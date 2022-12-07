using System;
using System.Collections.Generic;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BMS
{
    public partial class ManageRoles : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGridView();
            }
            lb1.Text = "<b><font color=black>" + "Welcome : " + "</font>" + "<b><font color=blue>" + Session["Username"] + "</font>";
        }
        private void BindGridView()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ID,UserName,Password,Role FROM Role", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.Text;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvCustomers.DataSource = dt;
                        gvCustomers.DataBind();
                    }
                }
            }
        }
        protected void Edit(object sender, EventArgs e)
        {
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            lblId.Text = row.Cells[0].Text.Trim();
            txt_UserName.Text = row.Cells[1].Text.Trim();
            txt_Password.Text = row.Cells[1].Text.Trim();
            rbtRole.Text = row.Cells[2].Text.Trim();
          
        }

        protected void Delete(object sender, EventArgs e)
        {
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            string ID = row.Cells[0].Text.Trim();
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete From Role WHERE ID = @ID", con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@ID", ID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            BindGridView();
        }

        protected void Save(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Role SET UserName = @UserName, Password = @Password, Role=@Role WHERE ID = @ID", con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@ID", lblId.Text.Trim());
                    cmd.Parameters.AddWithValue("@UserName", txt_UserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txt_Password.Text.Trim());
                    cmd.Parameters.AddWithValue("@Role", rbtRole.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Thank You!', 'Updated Successfully!', 'success')", true);

                    con.Close();
                }
            }

            lblId.Text = string.Empty;
            txt_UserName.Text = string.Empty;
            txt_Password.Text = string.Empty;
            rbtRole.Text = string.Empty;
        
            

            BindGridView();
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand com = new SqlCommand("AddRole", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@UserName", txt_UserName.Text);
                com.Parameters.AddWithValue("@Password", txt_Password.Text);
                com.Parameters.AddWithValue("@Role", rbtRole.SelectedValue);
                con.Open();
                int k = com.ExecuteNonQuery();
                if (k != 0)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Thankyou','Register Sucessfully','success');window.location.href='ManageRoles.aspx';", true);
                    con.Close();


                    clear();
                }
                else
                {
                   
                }
                
            }
            
        }
        private void clear()
        {
            txt_UserName.Text = "";
            rbtRole.ClearSelection();
        }
    }
}