<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addresident.aspx.cs" Inherits="BMS.addresident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>
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
<<body id="page-top" >
    <form id="form2" runat="server">
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
                <a class="nav-link" href="dashboard.aspx">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
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
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Residents</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Resident of Barangay:</h6>
                        <a class="collapse-item" href="addresidents.aspx">Add Residents</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Certificates</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Certificates:</h6>
                        <a class="collapse-item" href="barangaycertificates.aspx">Barangay Clearance</a>
                    
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
       

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="Command.aspx">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Command Center</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Blotter</span></a>
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
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
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

                        
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
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

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                       
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                      
                    </div>
                    <!-- Content Row -->

                    <div class="row">
                          <div class="card shadow mb-5">
                                <!-- Card Header - Dropdown -->
                                 
                                <!-- Card Body -->
                                <div class="card-body">
                               <Form method="post">
    
        <div class="container py-4">   
            <h5 class="text-center">HOW TO CREATE GOOGLE MAP AND ADD LOCATION DYNAMICALLY USING ASP.NET MVC 5</h5>  
            <div class="card">  
                <div class="card-header bg-danger">  
                    <h6 class="card-title text-uppercase text-white">Google Map Location</h6>  
                </div>  
                <div class="card-body">  
  
                    <div class="modal fade" id="map">  
                        <div class="modal-dialog modal-lg">  
                            <div class="modal-content">  
                                <div class="modal-header">  
                                    <h4 class="modal-title">Add New Location</h4>  
                                    <button type="button" class="close" data-dismiss="modal">×</button>  
                                </div>  
                                <div class="modal-body">  
                                    <div class="row">  
                                        <div class="col-sm-4 col-md-4 col-xs-12">  
                                            <div class="form-group">  
                                                <label>City Name:</label>                                                
                                               <input asp-for="CityName" class="form-control"/>
                                            </div>  
                                        </div>  
                                        <div class="col-sm-4 col-md-4 col-xs-12">  
                                            <div class="form-group">  
                                                <label>Latitude:</label>  
                                               <input asp-for="Latitude" class="form-control"/>
                                            </div>  
                                        </div>  
                                        <div class="col-sm-4 col-md-4 col-xs-12">  
                                            <div class="form-group">  
                                                <label>Longitude:</label>  
                                               <input asp-for="Longitude" class="form-control"/>
                                        </div>  
                                    </div>  
                                    <div class="row">  
                                        <div class="col-sm-12 col-md-12 col-xs-12">  
                                            <div class="form-group">  
                                                <label>Description:</label>  
                                                <textarea name="Description" rows="5" class="form-control"></textarea>  
                                            </div>  
                                        </div>  
                                    </div>                                    
                                </div>  
                                <div class="modal-footer">  
                                    <button type="button" class="btn btn-danger rounded-0" data-dismiss="modal">Close</button>  
                                    <button class="btn btn-primary rounded-0">Submit</button>  
                            </div>  
                            </div>  
                        </div>  
                    </div>  
                    <div id="map" class="card" style="width: 100%; height: 400px">  
                    </div>  
                </div>  
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
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
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
    <script>
        var markers = (ViewBag.Markers);  
        window.onload = function () {  
            var mapOptions = {  
                center: { lat: 14.5119, lng: 121.0694 },  
                zoom: 4,  
                mapTypeId: google.maps.MapTypeId.ROADMAP  
            };  
            var infoWindow = new google.maps.InfoWindow();  
            var map = new google.maps.Map(document.getElementById("map"), mapOptions);  
            for (i = 0; i < markers.length; i++) {  
                var data = markers[i]  
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);  
                var marker = new google.maps.Marker({  
                    position: myLatlng,  
                    map: map,  
                    title: data.title  
                });  
                (function (marker, data) {  
                    google.maps.event.addListener(marker, "click", function (e) {  
                        infoWindow.setContent(data.description);  
                        infoWindow.open(map, marker);  
                    });  
                })(marker, data);  
            }  
        }
    
    </script>
         <script src="~/scripts/jquery-3.3.1.min.js"></script>  
 <script src="~/scripts/bootstrap.min.js"></script>  
 <script src="~/scripts/jquery.validate.min.js"></script>  
<script src="~/scripts/jquery.validate.unobtrusive.min.js"></script>  
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuVyZWwqTq86AJctzNQmhb2hmUt5M7tQE&callback=initMap"></script>
    </form>
    </form>
</body>
</html>
