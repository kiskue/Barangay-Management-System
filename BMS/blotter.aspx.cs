using System;
using QRCoder;
using System.IO;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using CrystalDecisions.CrystalReports.Engine;
namespace BMS
{
    public partial class blotter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGridView();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {


            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
              
                    SqlCommand cmd = new SqlCommand("AddBlotter", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FullName", Name.Text);
                    cmd.Parameters.AddWithValue("@Email", Email.Text);
                    cmd.Parameters.AddWithValue("@Number", Number.Text);
           

                    con.Open();
                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
           "swal('Thank you!', 'Blotter save successfully!', 'success')", true);


                    Name.Text = "";
                        Email.Text = "";
                        Number.Text = "";
                      
                        Year.Text = "";

                    }
                    con.Close();
                BindGridView();


            }

        }
        protected void Edit(object sender, EventArgs e)
        {
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;

            lblId.Text = row.Cells[0].Text.Trim();
            Name.Text = row.Cells[1].Text.Trim();
            Email.Text = row.Cells[2].Text.Trim();
            Address.Text = row.Cells[3].Text.Trim();

            Number.Text = row.Cells[4].Text.Trim();
            
         

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
        protected void btnselect_Click(object sender, EventArgs e)
        {

            ReportDocument reportdocument = new ReportDocument();
            reportdocument.Load(Server.MapPath("CrystalReport5.rpt"));
            reportdocument.SetDatabaseLogon("", "", "DESKTOP-TIH3JDS", "login");
            reportdocument.SetParameterValue("Email", Email.Text);

            CrystalReportViewer1.ReportSource = reportdocument;
            BindGridView();
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
        protected void Delete(object sender, EventArgs e)
        {
            GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
            string ID = row.Cells[0].Text.Trim();
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete From Blotter WHERE FID = @FID", con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@FID", ID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            BindGridView();
        }
        private void BindGridView()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT FID,FullName,Email,Number,Address,PlaceIncident,Incident,Narative,Purok,Witness1,Witness2,Witness3,Date FROM Blotter", con))
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
    }
}
    

