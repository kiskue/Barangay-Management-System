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
    public partial class BarangayOfficials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT PunongB,member1,comitte1,comitte2,member2,comitte3,comitte4,member3,comitte5,comitte6,member4,comitte7,comitte8,member5,comitte9,comitte10,member6,comitte11,comitte12,member7,comitte13,comitte14,member8,comitte15,comitte16,Secretary,Treasurer,Administrator FROM brng_officials WHERE BRNG = 1111"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            punongb.Text = sdr["Punongb"].ToString();
                            Textbox1.Text = sdr["member1"].ToString();
                            Textbox2.Text = sdr["comitte1"].ToString();
                            Textbox3.Text = sdr["comitte2"].ToString();
                            Textbox4.Text = sdr["member2"].ToString();
                            Textbox5.Text = sdr["comitte3"].ToString();
                            Textbox6.Text = sdr["comitte4"].ToString();
                            Textbox7.Text = sdr["member3"].ToString();
                            Textbox8.Text = sdr["comitte5"].ToString();
                            Textbox9.Text = sdr["comitte6"].ToString();
                            Textbox10.Text = sdr["member4"].ToString();
                            Textbox11.Text = sdr["comitte7"].ToString();
                            Textbox12.Text = sdr["comitte8"].ToString();
                            Textbox13.Text = sdr["member5"].ToString();
                            Textbox14.Text = sdr["comitte9"].ToString();
                            Textbox15.Text = sdr["comitte10"].ToString();
                            Textbox16.Text = sdr["member6"].ToString();
                            Textbox17.Text = sdr["comitte11"].ToString();
                            Textbox18.Text = sdr["comitte12"].ToString();
                            Textbox19.Text = sdr["member7"].ToString();
                            Textbox20.Text = sdr["comitte13"].ToString();
                            Textbox21.Text = sdr["comitte14"].ToString();
                            Textbox22.Text = sdr["member8"].ToString();
                            Textbox23.Text = sdr["comitte15"].ToString();
                            Textbox24.Text = sdr["comitte16"].ToString();
                            Textbox25.Text = sdr["Secretary"].ToString();
                            Textbox26.Text = sdr["Treasurer"].ToString();
                            Textbox27.Text = sdr["Administrator"].ToString();
                        }
                        con.Close();
                    }
                }
            }
        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                string BRNG = lblSID.Text;

                SqlCommand cmd = new SqlCommand("update brng_officials Set PunongB=@PunongB,member1=@member1,comitte1=@comitte1,comitte2=@comitte2,member2=@member2,comitte3=@comitte3,comitte4=@comitte4,member3=@member3,comitte5=@comitte5,comitte6=@comitte6,member4=@member4,comitte7=@comitte7,comitte8=@comitte8,member5=@member5,comitte9=@comitte9,comitte10=@comitte10,member6=@member6,comitte11=@comitte11,comitte12=@comitte12,member7=@member7,comitte13=@comitte13,comitte14=@comitte14,member8=@member8,comitte15=@comitte15,comitte16=@comitte16,Secretary=@Secretary,Treasurer=@Treasurer,Administrator=@Administrator WHERE BRNG = 1111", con);
                cmd.Parameters.AddWithValue("@PBRNG", BRNG);
                cmd.Parameters.AddWithValue("@PunongB", punongb.Text);
                cmd.Parameters.AddWithValue("@member1", Textbox1.Text);
                cmd.Parameters.AddWithValue("@comitte1", Textbox2.Text);
                cmd.Parameters.AddWithValue("@comitte2", Textbox3.Text);
                cmd.Parameters.AddWithValue("@member2", Textbox4.Text);
                cmd.Parameters.AddWithValue("@comitte3", Textbox5.Text);
                cmd.Parameters.AddWithValue("@comitte4", Textbox6.Text);
                cmd.Parameters.AddWithValue("@member3", Textbox7.Text);
                cmd.Parameters.AddWithValue("@comitte5", Textbox8.Text);
                cmd.Parameters.AddWithValue("@comitte6", Textbox9.Text);
                cmd.Parameters.AddWithValue("@member4", Textbox10.Text);
                cmd.Parameters.AddWithValue("@comitte7", Textbox11.Text);
                cmd.Parameters.AddWithValue("@comitte8", Textbox12.Text);
                cmd.Parameters.AddWithValue("@member5", Textbox13.Text);
                cmd.Parameters.AddWithValue("@comitte9", Textbox14.Text);
                cmd.Parameters.AddWithValue("@comitte10", Textbox15.Text);
                cmd.Parameters.AddWithValue("@member6", Textbox16.Text);
                cmd.Parameters.AddWithValue("@comitte11", Textbox17.Text);
                cmd.Parameters.AddWithValue("@comitte12", Textbox18.Text);
                cmd.Parameters.AddWithValue("@member7", Textbox19.Text);
                cmd.Parameters.AddWithValue("@comitte13", Textbox20.Text);
                cmd.Parameters.AddWithValue("@comitte14", Textbox21.Text);
                cmd.Parameters.AddWithValue("@member8", Textbox22.Text);
                cmd.Parameters.AddWithValue("@comitte15", Textbox23.Text);
                cmd.Parameters.AddWithValue("@comitte16", Textbox24.Text);
                cmd.Parameters.AddWithValue("@Secretary", Textbox25.Text);
                cmd.Parameters.AddWithValue("@Treasurer", Textbox26.Text);
                cmd.Parameters.AddWithValue("@Administrator", Textbox27.Text);
                con.Open();
                int k = cmd.ExecuteNonQuery();
                if (k != 0)
                {

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Successfuly Updated!', 'Barangay Officials Updated Successfully!', 'success')", true);


                }
                con.Close();

            }
        }

      
    }
}