<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarangayOfficials.aspx.cs" Inherits="BMS.BarangayOfficials" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"/>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> 
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
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuVyZWwqTq86AJctzNQmhb2hmUt5M7tQE"></script>


</head>
<body id="page-top" >
    <form id="form2" runat="server">
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
                            <a class="collapse-item" href="BarangayIndigency.aspx">Barangay Indigency</a>
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
                            <a class="collapse-item" href="BusinessPermit.aspx">Business Permits</a>
                            <a class="collapse-item" href="BuildingPermit.aspx">Building permits</a>
                           
                        </div>
                    </div>
                   
                    
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                 <li class="nav-item">
                    <a class="nav-link" href="ManageRoles.aspx">
                        <i class="fas fa-fw fa-address-book"></i>
                        <span>Manage Roles</span>
                    </a>
                </li>
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
                            <li class="nav-item dropdown no-arrow d-sm-none">
                            
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Alerts -->

                      <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                     <img class="img-profile rounded-circle"
                                         src="img/undraw_profile.svg" style="padding-right:5px;">
                                     <asp:Label ID="lb1" runat="server" Text="Label"></asp:Label>  
                                   
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                          
                    </nav>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->

                        <!-- Content Row -->
                      
                    <div class="container py-4">
                  
                    <div class="card">
                        <div class="card-header bg-danger">
                            <h6 class="card-title text-uppercase text-white">BARANGAY OFFICIALS</h6>
                        </div>

                        <div class="form-row justify-content-center" style="padding:25px 25px 25px 25px;">
                         
                                
                            <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                    <label>Punong Barangay:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="punongb"  />
                                    <asp:Label ID="lblSID" runat="server" Visible="false"/>
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                 
                                    <asp:Textbox runat="server" type="hidden" />

                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                    
                                    <asp:Textbox runat="server" type="hidden"/>
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                    <label>Sangguniang Barangay Members:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="Textbox1" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                    <label>Chairman of Committe:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Latitude" id="Textbox2" />

                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                      <label style=" visibility:hidden">Chairman of Committe:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Longitude" id="Textbox3"/>
                                </div>
                            </div>
                             <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="Textbox4"/>
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Latitude" id="Textbox5" />

                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                      
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Longitude" id="Textbox6" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="Textbox7" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Latitude" id="Textbox8" />

                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                      
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Longitude" id="Textbox9" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="Textbox10" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Latitude" id="Textbox11" />

                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                      
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Longitude" id="Textbox12" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="Textbox13" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Latitude" id="Textbox14" />

                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                      
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Longitude" id="Textbox15" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="Textbox16" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Latitude" id="Textbox17" />

                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                      
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Longitude" id="Textbox18" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="Textbox19" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Latitude" id="Textbox20" />

                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                      
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Longitude" id="Textbox21" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="Textbox22" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                   
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Latitude" id="Textbox23" />

                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                      
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Longitude" id="Textbox24" />
                                </div>
                            </div>
                              <div class="col-lg-3 col-lg-offset-3 mr-5">
                                <div class="form-group">
                                    <label>Barangay Secretary:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Name" ID="Textbox25" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4 mr-5">
                                <div class="form-group">
                                    <label>Barangay Treasurer:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Latitude" id="Textbox26" />
                                 
                                </div>
                            </div>
                            <div class="col-lg-3 col-lg-offset-4">
                                <div class="form-group">
                                      <label >Barangay Administrator:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control"  name="Longitude" id="Textbox27" />
                                </div>
                            </div>
                              <div  style="margin-left:790px; margin-bottom:15px; ">
                        <asp:Button Text="Update" ID="Button2" CssClass="btn btn-primary btn-user btn-block" style="width:100px;" runat="server" Onclick="btnupdate_Click"  />
                    </div>
                        </div>  
                      
                  </div>


                       
                    </div>




        </div>
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
                        <a class="btn btn-primary" href="index.aspx">Logout</a>
                    </div>
                </div>
            </div>
        </div>
 
                            
</form>
</body>
</html>

  
 
  
