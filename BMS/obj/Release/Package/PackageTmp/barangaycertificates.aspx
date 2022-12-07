<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="barangaycertificates.aspx.cs" Inherits="BMS.barangaycertificates" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>


<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">`
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width" />
    <title>Location</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuVyZWwqTq86AJctzNQmhb2hmUt5M7tQE&callback=initMap&v=weekly"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="scripts/jquery-3.6.0.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/jquery.validate.min.js"></script>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
    <script src="scripts/jquery.validate.unobtrusive.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="bootstrap.min.css" rel="stylesheet" />
<style>
body {
width: 100%;
margin: 5px;
}

.table-condensed tr th {
border: 0px solid #6e7bd9;
color: white;
background-color: #6e7bd9;
}

.table-condensed, .table-condensed tr td {
border: 0px solid #000;
}

tr:nth-child(even) {
background: #f8f7ff
}

tr:nth-child(odd) {
background: #fff;
}
</style>

</head>
<body id="page-top">
       <form id="form1" runat="server">
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard.aspx">
                    <div class="sidebar-brand-icon ">
                       <img src="hagonoy.jpg"  width="40"  height="40" />
                    </div>
                    <div class="sidebar-brand-text mx-3">Barangay Hagonoy<sup></sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="dashboard.aspx">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-address-book"></i>
                        <span>Residents</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Resident of Barangay:</h6>
                            <a class="collapse-item" href="/Home/Location">Residents</a>
                     
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                       aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-file"></i>
                        <span>Certificates</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Certificates:</h6>
                            <a class="collapse-item" href="barangaycertificates.aspx">Barangay Clearance</a>
                            <a class="collapse-item" href="barangaycertificates.aspx">Barangay Indigency</a>
                            <a class="collapse-item" href="utilities-animation.html">CEDULA</a>
                        </div>
                    </div>
                   
                    
                </li>
              
                 <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilitie"
                       aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-file"></i>
                        <span>Permits</span>
                    </a>
                    <div id="collapseUtilitie" class="collapse" aria-labelledby="headingUtilities"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Permits:</h6>
                            <a class="collapse-item" href="barangaycertificates.aspx">Business Permits</a>
                            <a class="collapse-item" href="barangaycertificates.aspx">Building permits</a>
                           
                        </div>
                    </div>
                   
                    
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">

                   <li class="nav-item">
                    <a class="nav-link" href="BarangayOfficials.aspx">
                        <i class="fas fa-fw fa-sort-amount-up-alt"></i>
                        <span>Sanguniang Barangay</span>
                    </a>
                </li>

                
                <li class="nav-item">
                    <a class="nav-link" href="Hotspot.aspx">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Hotspot Area</span>
                    </a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="blotter.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Blotter</span>
                    </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="blotter.aspx">
                        <i class="fas fa-fw fa-calendar"></i>
                        <span>Calendar</span>
                    </a>
                </li>
              
              
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

                <!-- Sidebar Message -->


            </ul>

            <!-- End of Sidebar -->
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <!-- Nav Item - Alerts -->
                            <!-- Nav Item - User Information -->
                    

                        </ul>

                    </nav>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                    </div>
                    <!-- End of Content Wrapper -->

                    <div class="col-ml-2 col-md-15 col-xs-20">
                     
                            <div class="container py-4">
                                <h5 class="text-center">Report Incident</h5>
                                <div class="card">
                                    <div class="card-header bg-danger">
                                        <h6 class="card-title text-uppercase text-white">BARANGAY HAGONOY</h6>
                                    </div>

                                    <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px;">
                                      <div class="col-lg-4 col-lg-offset-4">
                                            <div class="form-group">
                                                <label>Name:</label>
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="Name"  id="Name" />
                                                <asp:Label ID="IDL" runat="server" Visible="false"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Email:</label>
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="Email"  id="Email" />
                                                 
                                            </div>
                                        </div>
                                        <asp:Button Text="Select" ID="Button1" CssClass="btn btn-primary btn-user btn-block" style="width:70px; height:35px; margin-top:33px;" runat="server" Onclick="btnselect_Click"  />
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Contact Number:</label>
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="Contact Number"  id="Number" />
                                            </div>
                                        </div>
                                      <div class="col-lg-4 col-lg-offset-4">
                                            <div class="form-group">
                                                <label>House No. / Street:</label>
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="House No. and Street"  id="StreetNum" />
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Purok:</label>
                                              <asp:Textbox runat="server" type="text" class="form-control" placeholder="Purok"  id="Purok" />
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Purpose:</label>
                                                <asp:Textbox runat="server" type="text" class="form-control" placeholder="Purpose" id="Purpose" />
                                            </div>
                                        </div>
                                      <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Year:</label>
                                                <asp:Textbox runat="server" type="month" id="Year"  />
                                            </div>
                                        </div>
                                            
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label for="place">Choose a Day:</label>
                                                <select runat="server" id="Day" required="Please fill up">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                    <option value="13">13</option>
                                                    <option value="14">14</option>
                                                    <option value="15">15</option>
                                                    <option value="16">16</option>
                                                    <option value="17">17</option>
                                                    <option value="18">18</option>
                                                    <option value="19">19</option>
                                                    <option value="20">20</option>
                                                    <option value="21">21</option>
                                                    <option value="22">22</option>
                                                    <option value="23">23</option>
                                                    <option value="24">24</option>
                                                    <option value="25">25</option>
                                                    <option value="26">26</option>
                                                    <option value="27">27</option>
                                                    <option value="28">28</option>
                                                    <option value="29">29</option>
                                                    <option value="30">30</option>
                                                    <option value="31">31</option>
                                                </select>
                                           </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label for="place">Choose a Month:</label>
                                                <select runat="server" id="Month" required="Please fill up">
                                                    <option value="January">January</option>
                                                    <option value="Febraury">February</option>
                                                    <option value="March">March</option>
                                                    <option value="April">April</option>
                                                    <option value="May">May</option>
                                                    <option value="June">June</option>
                                                    <option value="July">July</option>
                                                    <option value="August">August</option>
                                                    <option value="September">September</option>
                                                    <option value="October">October</option>
                                                    <option value="November">November</option>
                                                    <option value="December">December</option>

                                                </select>
                                         </div>
                                        </div>
                                     
                                    </div>
                                </div>
                                                                     <div class="card-body">  
                    <asp:Button Text="submit" ID="Button2" CssClass="btn btn-primary btn-user btn-block" style="width:100px; float:right;" runat="server" Onclick="btnSave_Click"  />
                   
  
               
                        </div>
                      
                            

                
                             <div class="col-ml-2 col-md-15 col-xs-20">
                     
                            <div class="container py-4">
                    <div class="card">
                           
                        <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px; margin-top:20px">
                         <asp:GridView ID="GridView1" runat="server"  UseAccessibleHeader="true" CssClass="table table-condensed table-hover " Width="1200px"  >



                         </asp:GridView>

                        </div>
                         </div>
                        
                    </div>
                </div>
                        <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px; margin-top:20px">
                         <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="600px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="800px" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" />
                           
                            <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                                <Report FileName="CrystalReport1.rpt">
                                </Report>
                            </CR:CrystalReportSource>
                             </div>
                    
            </div>

        </div>

            
     
                     
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->

        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" type="button" data-dismiss="modal">Cancel</button>



                    </div>
                </div>
            </div>
        </div>
        
    </form>
</body>
</html>


