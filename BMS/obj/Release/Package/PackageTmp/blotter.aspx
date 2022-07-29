<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blotter.aspx.cs" Inherits="BMS.blotter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Barangay Certification</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
 <link href="~/Content/bootstrap.min.css" rel="stylesheet" />  
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <style>
        .bg-logo {
            background-image: url(hagonoy.jpg);
        }

        #map {
            height: 500px;
            width: 1200px;
        }
    </style>
</head>
<body id="page-top" >
    <form id="form2" runat="server">
     <div id="wrapper">

                    
                                 
                                <!-- Card Body -->
                                <div class="card-body" >
                               <Form method="post">
    
    
        <div class="container py-4">   
            <h5 class="text-center">Blotter</h5>  
            <div class="card">  
                <div class="card-header bg-danger">  
                    <h6 class="card-title text-uppercase text-white">Blotter</h6>  
                </div>  
                <div class="card-body">  
  
                    <!--ganyan muna-->
                    <div class="container py-4">  
                          
                            <div class="modal-body">  
    <div class="row">  
    
                    <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group">  
       
            <tr>
                <td align="left">
               Date Today :

                <p>
                <asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox>
                </p>
                </div>  
             
                           </div> 

         <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group">  
                  <tr>
                <td align="center">
              Name of Complainant :

                <p>
                <asp:TextBox ID="TextBox2" runat="server" Width="250px"></asp:TextBox>
                </p>
                     </div>  
                </div> 

              
         <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                      <tr>
                <td align="right">
               Age :

                <p>
                <asp:TextBox ID="TextBox3" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>
                    </div>
               
                     <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                      <tr>
                <td align="left">
               Nationality :

                <p>
                <asp:TextBox ID="TextBox4" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>
                         </div>
               
                     <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="center">
               Civil Status :

                <p>
                <asp:TextBox ID="TextBox5" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>
                         </div>


                     <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="right">
               House No# :

                <p>
                <asp:TextBox ID="TextBox6" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>
                         </div>


                     <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="left">
               Street :

                <p>
                <asp:TextBox ID="TextBox7" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>
                         </div>


                     <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="center">
               Barangay/Subdivision :

                <p>
                <asp:TextBox ID="TextBox8" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>
                         </div>


                     <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="right">
               District/Municipality :

                <p>
                <asp:TextBox ID="TextBox9" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>

                    </div>

        <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="right">
               City/Province :

                <p>
                <asp:TextBox ID="TextBox10" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>
            </div>

            <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="right">
               Complaint :

                <p>
                <asp:TextBox ID="TextBox11" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>

                    </div>


          

        <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="right">
               Offender :

                <p>
                <asp:TextBox ID="TextBox12" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>

                    </div>

          <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="right">
               Date when :

                <p>
                <asp:TextBox ID="TextBox13" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>

                    </div>


        <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="right">
               Witness 1 :

                <p>
                <asp:TextBox ID="TextBox14" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>

                    </div>


        <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="right">
               Witness 2 :

                <p>
                <asp:TextBox ID="TextBox15" runat="server" Width="250px"></asp:TextBox>
                </p>
                    </div>

                    </div>


          <div class="col-sm-4 col-md-4 col-xs-12">  
                     <div class="form-group"> 
                     <tr>
                <td align="right">
               Narrative :

                <p>
                <asp:TextBox ID="TextBox16" runat="server" Width="700px" Height="200px" Font-Bold></asp:TextBox>
                </p>
                    </div>

                    </div>

                <br />
         <div class="modal-footer"> 
                    <asp:Button ID="Butoon2" runat="server" Text="Submit" Width="200px" Height="50px" class="btn btn-primary rounded-0" OnClick="Butoon2_Click1"/>
          
            </div>
     <br />
                  <br />
                    <br />
                    <br />
                    <br />
                     <br />
                    <br />
                </td>
                </td>
                </td>
                </td>
                </td>
                </td>
                </td>
                </tr>
                            </tr>

                                    </tr>
                </tr>
                </tr>
                </tr>

            </tr>
             <tr>
            <td colspan="2" style="background-image:url(Images/header.jpg); height:30px"></td>
            </tr>  
            </table> 
    </div>
    </div>
                  

                      
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        
                         
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

                <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>
 
    <!-- Page level custom scripts -->
   </form>
    </form>
</body>
</html>
