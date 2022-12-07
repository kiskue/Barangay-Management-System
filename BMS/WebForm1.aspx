<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BMS.WebForm1" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>Barangay Hagonnoy</title>

     <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet"/>
     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>
     <script type="text/javascript" src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuVyZWwqTq86AJctzNQmhb2hmUt5M7tQE"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     <script>


         function getLocation() {
             if (navigator.geolocation) {
                 navigator.geolocation.getCurrentPosition(showPosition);
             } else {
                 x.innerHTML = "Geolocation is not supported by this browser.";
             }
         }

         function showPosition(position) {
             document.getElementById("lat").value = position.coords.latitude;
             document.getElementById("lng").value = position.coords.longitude;
         }

        
            
         function join(t, a, s) {
             function format(m) {
                 let f = new Intl.DateTimeFormat('en', m);
                 return f.format(t);
             }
             return a.map(format).join(s);
         }

         let a = [{ day: 'numeric' }, { month: 'long' }, { year: 'numeric' }];
         let s = join(new Date, a, '-');
         window.onload = function () {
             document.getElementById("Year").value = s;
         }

     </script>
    <script>
        var now = new Date();
        now.setMinutes(now.getMinutes() - now.getTimezoneOffset());
        document.getElementById("time").value = now.toISOString().slice(0, 16);
                
    </script>
</head>
<body id="page-top">
    <form id="form1" runat="server">
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard.aspx">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-bg-logo"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Barangay Hagonoy<sup></sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="/Home/Dashboard">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Home</span>
                    </a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Request
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-file"></i>
                        <span>Permits</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Resident of Barangay:</h6>
                            <a class="collapse-item" href="Business.aspx">Business</a>
                            <a class="collapse-item" href="Building.aspx">Building</a>
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
                            <a class="collapse-item" href="Certificates.aspx">Barangay Clearance</a>
                            <a class="collapse-item" href="Indigency.aspx">Barangay Indigency</a>
                            <a class="collapse-item" href="utilities-animation.html">CEDULA</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link" href="WebForm1.aspx">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Report Incident</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserProfile.aspx">
                        <i class="fas fa-fw fa-address-book"></i>
                        <span>Profile</span>
                    </a>
                </li>
                  <li class="nav-item">
                    <a class="nav-link" href="Activitylog.aspx">
                        <i class="fas fa-fw fa-list-alt"></i>
                        <span>Activity log</span>
                    </a>
                </li>
                <!-- Heading -->
                <!-- Divider -->
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
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black;">

                                    <asp:Label ID="lb1" runat="server" Text="Label"></asp:Label>  
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                    </div>

                    <div class="col-ml-2 col-md-15 col-xs-20">
           
                <div class="container py-4">
                  
                    <div class="card">
                        <div class="card-header bg-danger">
                            <h6 class="card-title text-uppercase text-white">BARANGAY HAGONOY INCIDENT REPORT</h6>
                        </div>

                        <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px;">
                         
                                
                            <div class="col-lg-4 col-lg-offset-4">
                                <div class="form-group">
                                    <label>FullName:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="FullName" name="Name" ID="name" required="Please fill up" />
                                </div>
                            </div>
           
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label>Latitude:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="lat" name="Latitude" id="lat" required="Please fill up" />

                                </div>
                            </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label>Longitude:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="lng" name="Longitude" id="lng" required="Please fill up" />
                                </div>
                            </div>
                         <div class="col-lg-4 col-lg-offset-4">
                                <div class="form-group">
                                    <label>Email:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="Email" name="Latitude" id="email" required="Please fill up" />

                                </div>
                            </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label>Landmark:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="Address" name="Landmark" id="landmark" required="Please fill up"/>
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label>Contact Number:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="Contact Number" name="Contact" id="contact" required="Please fill up"/>
                                </div>
                            </div>
                             <div class="col-lg-4 col-lg-offset-4">
                                <div class="form-group">
                                    <label>Incident Report:</label>
                                <select runat="server" id="repor" name="Place" required="Please fill up"  class="form-control">
                                        <option value="Motorcycle Incident">Motorcycle Incident</option>
                                        <option value="Vehicle Incident">Vehicle Incident</option>
                                        <option value="Fire">Fire</option>
                                        <option value="Shooting Incident">Shooting Incident</option>
                                       <option value="Ramble">Ramble</option>
                                       <option value="Stabbed by a knife">Stabbed by a knife</option>
                                       <option value="Robbery">Robbery</option>
                                       <option value="Hold Up">Hold Up</option>
                                       <option value="Murder">Murder</option>
                                     <option value="Fighting">Fighting</option>
                                     <option value="Rape">Rape</option>
                                     <option value="Suicide">Suicide</option>
                                    <option value="Flooding">Flooding</option>
                                    <option value="Late Night Vedioke">Late Night Vedioke</option>
                                    <option value="Missing Person">Missing Person</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Time:</label>
                                                <asp:Textbox runat="server" class="form-control" type="time" id="time"   />
                                            </div>
                                        </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Year:</label>
                                                <asp:Textbox runat="server" class="form-control" type="text" id="Year"   />
                                            </div>
                                        </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label for="place">Choose a Place:</label>
                                    <select runat="server" id="place" name="Place" required="Please fill up"  class="form-control">
                                        <option value="Dreamlad">Dreamland</option>
                                        <option value="Pag-asa">Pag-asa</option>
                                        <option value="SeaBrezz">SeaBrezz</option>
                                        <option value="Creekland">Creekland</option>
                                    </select>

                                </div>
                            </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <asp:Textbox runat="server" type="text" class="form-control"  id="Barangay" value="Hagonoy" hidden="true"/>
                                </div>
                            </div>
                            <p>Click the button to get your coordinates.</p>
                           
                            <button onclick="getLocation()" class="btn btn-info " style="margin-left:10px; height:30px; font-size:12px; ">CLICK</button>

                        </div>
                    </div>
                    <div class="modal-footer">
                         <asp:Label ID="Lbl1" runat="server" Text=""></asp:Label>

                 <asp:Button Text="submit" ID="Button2" CssClass="btn btn-primary btn-user btn-block" style="width:100px;" runat="server"  Onclick="btnSave_Click" />


                       
                    </div>




                </div>

        </div>
        </div>
                       
                
            <!-- Outer Row -->
    
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
                                                 <a class="btn btn-primary" href="/Register/Login">Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

  </form>
</body>
</html>
