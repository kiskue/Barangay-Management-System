using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace BMS
{
    public partial class barangaycertificates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnShow_OnClick(object sender, EventArgs e)
        {



            var textInput = TextBox1.Text;
            var textInput2 = TextBox2.Text;
            var textInput3 = TextBox3.Text;
            var textInput4 = TextBox4.Text;
            var textInput5 = TextBox5.Text;
            var textInput6 = TextBox6.Text;
            var textInput7 = TextBox7.Text;
            var textInput8 = TextBox8.Text;
            var textInput9 = TextBox9.Text;


            //server folder path which is stored your PDF documents
            string path = Server.MapPath("PDF-Files");
            string filename = path + "/Doc1.pdf";

            //Create new PDF document 
            Document document = new Document(PageSize.A4, 20f, 20f, 20f, 20f);

            PdfWriter.GetInstance(document, new FileStream(filename, FileMode.Create));


            document.Open();
            document.Add(new Paragraph("                                                             Republic of the Philippines"));
            document.Add(new Paragraph("                                                              Province of Metro Manila"));
            document.Add(new Paragraph("                                                             Municipality of Taguig City"));
            document.Add(new Paragraph("                                                                  Barangay Hagonoy"));

            document.Add(new Paragraph("______________________________________________________________________________________________________________________________________________________________________                                                                                                                                          "));
            document.Add(new Paragraph(""));
            document.Add(new Paragraph("                                                             CERTIFICATE OF RESIDENCY                                                                                     "));
            document.Add(new Paragraph("TO WHOM IT MAY CONCERN:                                                                                                                                                                            "));
            document.Add(new Paragraph("This is to certify that " + textInput + " " + textInput2 + "" + textInput3 + "" + " is a bonafide resident of this barangay with postal address of " + textInput4 + "" + textInput5 + "" + textInput6 + "" + " Taguig City.                                                                                                                     "));
            document.Add(new Paragraph("This further certifies that " + textInput + "" + textInput2 + "" + textInput3 + "" + " is residing at the above mentioned address since" + textInput7 + " up to the present.                                                                                                                                                    "));
            document.Add(new Paragraph("This certification is issued upon request for " + textInput8 + "" + ".                                                                            "));
            document.Add(new Paragraph("Given this " + textInput9 + "" + ".                                                                                                                                                    "));
            document.Add(new Paragraph("                                                                  Gutierrez, Renato O                                                                                       "));
            document.Add(new Paragraph("                                                                    Punong Barangay                                                                                               "));

            //Paragraph parag = new Paragraph(te)
            //var textInput = 

            //document.Add(new Paragraph(TextBoxControlBuilder.CreateBuilderFromType(String.)));
            document.Close();

            ShowPdf(filename);
        }

        public void ShowPdf(string filename)
        {
            //Clears all content output from Buffer Stream
            Response.ClearContent();
            //Clears all headers from Buffer Stream
            Response.ClearHeaders();
            //Adds an HTTP header to the output stream
            Response.AddHeader("Content-Disposition", "inline;filename=" + filename);
            //Gets or Sets the HTTP MIME type of the output stream
            Response.ContentType = "application/pdf";
            //Writes the content of the specified file directory to an HTTP response output stream as a file block
            Response.WriteFile(filename);
            //sends all currently buffered output to the client
            Response.Flush();
            //Clears all content output from Buffer Stream
            Response.Clear();
        }
        protected void Button1_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }
    }
}
