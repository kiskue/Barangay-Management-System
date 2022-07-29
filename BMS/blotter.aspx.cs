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
    public partial class blotter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Butoon2_Click1(object sender, EventArgs e)
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
            var textInput10 = TextBox10.Text;
            var textInput11 = TextBox11.Text;
            var textInput12 = TextBox12.Text;
            var textInput13 = TextBox13.Text;
            var textInput14 = TextBox14.Text;



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
            document.Add(new Paragraph("                                                             BLOTTER OF BARANGAY HAGONOY                                                                                    "));
            document.Add(new Paragraph("                           Gutierrez, Renato O " + " " + textInput + "                                      "));
            document.Add(new Paragraph("                            Punong Barangay                                                                                                                                                                           "));
            document.Add(new Paragraph("                                                             OFFICE OF THE BARANGAY HAGONOY                                                                                "));
            document.Add(new Paragraph(textInput2));
            document.Add(new Paragraph("Complainant  " + "" + "For: " + "" + textInput11));

            document.Add(new Paragraph(textInput13 + "" + textInput12));
            document.Add(new Paragraph(textInput14 + "" + "                                                                                      Offender"));

            document.Add(new Paragraph("Witness"));

            document.Add(new Paragraph("______________________________________________________________________________________________________________________________________________________________________                                                                                                                                          "));
            document.Add(new Paragraph("                                                             COMPLAINT                                                                                  "));
            document.Add(new Paragraph("                                        COMPLAINANT respectfully state:                                                                           "));
            document.Add(new Paragraph("1." + "" + textInput2 + "" + ", " + textInput3 + "" + "," + textInput4 + "" + textInput5 + "" + " and a resident of " + textInput6 + "" + textInput7 + "" + textInput8 + "" + textInput9 + "" + textInput10));
            document.Add(new Paragraph("2. The Witnesses are: "));
            document.Add(new Paragraph("(a)" + "" + textInput13 + ", " + textInput3 + "," + textInput4 + "" + textInput5 + " and a resident of " + textInput6 + "" + textInput7 + "" + textInput8 + "" + textInput9 + "" + textInput10));
            document.Add(new Paragraph("(b) " + "" + textInput14 + ", " + textInput3 + "," + textInput4 + "" + textInput5 + " and a resident of " + textInput6 + "" + textInput7 + "" + textInput8 + "" + textInput9 + "" + textInput10));
            document.Add(new Paragraph("Narrative Report: "));
            document.Add(new Paragraph("(a) On " + textInput9 + "" + "around " + "" + textInput + "" + textInput2 + "" + textInput13));
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

    }
}
    

