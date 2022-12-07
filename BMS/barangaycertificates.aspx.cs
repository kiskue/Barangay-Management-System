using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Web.UI.WebControls;
using QRCoder;
using System.IO;
using System.Drawing;

namespace BMS
{
    public partial class barangaycertificates : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGridView();
            }
        
        }

        private void BindGridView()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ID,FullName,Email,Number,Address,Purpose,Date FROM Brg_Clearance", con))
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
            Name.Text = row.Cells[1].Text.Trim();
            Email.Text = row.Cells[2].Text.Trim();
            Number.Text = row.Cells[3].Text.Trim();
           
            Purpose.Text = row.Cells[4].Text.Trim();
            Year.Text = row.Cells[5].Text.Trim();
        }

        protected void Delete(object sender, EventArgs e)
        {
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            string ID = row.Cells[0].Text.Trim();
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete From Brg_Clearance WHERE ID = @ID", con))
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
                    using (SqlCommand cmd = new SqlCommand("UPDATE Brg_Clearance SET Name = @Name, Email = @Email, Number=@Number, Purpose=@Purpose, Year=@Year WHERE ID = @ID", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@ID", lblId.Text.Trim());
                        cmd.Parameters.AddWithValue("@Name", Name.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", Email.Text.Trim());
                        cmd.Parameters.AddWithValue("@Number", Number.Text.Trim());
                       
                        cmd.Parameters.AddWithValue("@Purpose", Purpose.Text.Trim());
                        cmd.Parameters.AddWithValue("@Year", Year.Text.Trim());
                        con.Open();
                        cmd.ExecuteNonQuery();

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Thank You!', 'Updated Successfully!', 'success')", true);

                        con.Close();
                    }
                }

                lblId.Text = string.Empty;
                Name.Text = string.Empty;
                Email.Text = string.Empty;
                Number.Text = string.Empty;
               
                Purpose.Text = string.Empty;
                Year.Text = string.Empty;

                BindGridView();
            }

        protected void btndone(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("AddAllDone", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FullName", Name.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", claimed.Text.Trim());
                cmd.Parameters.AddWithValue("@Date", Year.Text.Trim());
                cmd.Parameters.AddWithValue("@Type", indigency.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();



                con.Close();

            }

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete From Brg_Clearance WHERE Email = @Email", con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Email", Email.Text);
                    con.Open();
                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
              "swal('Done!', 'Thank you!', 'success')", true);
                    }
                    con.Close();
                }

            }
            lblId.Text = string.Empty;
            Name.Text = string.Empty;
            Email.Text = string.Empty;
            Number.Text = string.Empty;
            Purpose.Text = string.Empty;
           
            Year.Text = string.Empty;

            BindGridView();
        }
        protected void btnselect_Click(object sender, EventArgs e)
        {

            ReportDocument reportdocument = new ReportDocument();
            reportdocument.Load(Server.MapPath("CrystalReport1.rpt"));
            reportdocument.SetDatabaseLogon("", "", "DESKTOP-TIH3JDS", "login");    
            reportdocument.SetParameterValue("Email", Email.Text);
     
            CrystalReportViewer1.ReportSource = reportdocument;
             BindGridView();
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            string code = txtCode.Text;
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);
            System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
            imgBarCode.Height = 150;
            imgBarCode.Width = 150;
            using (Bitmap bitMap = qrCode.GetGraphic(20))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();
                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("UPDATE QRCODE SET qrcode = @qrcode WHERE qrid = 1", con);

                    cmd.Parameters.AddWithValue("@qrcode", byteImage);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    txtCode.Text = string.Empty; 


                    cmd = new SqlCommand("SELECT qrcode FROM QRCODE", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvQRCode.DataSource = dt;
                    gvQRCode.DataBind();
                }
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["qrcode"]);
                (e.Row.FindControl("Image1") as System.Web.UI.WebControls.Image).ImageUrl = imageUrl;
            }
        }
    }
    
}