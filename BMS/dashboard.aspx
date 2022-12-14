<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="BMS.dashboard" %>

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

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet"/>
     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

<script type="text/javascript">
  
    window.onload = function () {
        var mapOptions = {
            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),    
            zoom: 15,
            panControl: true,
            zoomControl: true,
            mapTypeControl: true,
            scaleControl: true,
            streetViewControl: true,
            overviewMapControl: true,
            rotateControl: true,
            mapTypeId: google.maps.MapTypeId.ROADMAP

        };

        var googleMarkers = [];


        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: data.title
            });



            // add the new marker to the googleMarkers array
            googleMarkers.push(marker);



            (function (marker, data) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(data.description);
                    infoWindow.open(map, marker);
                });
            })(marker, data);
        }


        // now all the markers have been created, make a new MarkerClusterer:
        var mcOptions = { gridSize: 50, maxZoom: 15 };
        var markerCluster = new MarkerClusterer(map, googleMarkers, {
            imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
        });

        // An array with the coordinates of the boundaries of Bucaramanga, extracted manually from the GADM database
        // An array with the coordinates of the boundaries of Bucaramanga, extracted manually from the GADM database
        var BucaramangaDelimiters = [


            { lat: 14.509781, lng: 121.085137 },
            { lat: 14.515536, lng: 121.078571 },
            { lat: 14.517260, lng: 121.075116 },
            { lat: 14.517916, lng: 121.075462 },
            { lat: 14.519324, lng: 121.075746 },
            { lat: 14.520188, lng: 121.075870 },
            { lat: 14.520629, lng: 121.075689 },
            { lat: 14.520507, lng: 121.073692 },
            { lat: 14.519885, lng: 121.073865 },
            { lat: 14.518866, lng: 121.073649 },
            { lat: 14.517906, lng: 121.073224 },
            { lat: 14.516531, lng: 121.072413 },
            { lat: 14.515321, lng: 121.071646 },
            { lat: 14.515757, lng: 121.070890 },
            { lat: 14.515480, lng: 121.070627 },
            { lat: 14.513517, lng: 121.064944 },
            { lat: 14.513689, lng: 121.064476 },
            { lat: 14.513878, lng: 121.064027 },
            { lat: 14.514004, lng: 121.063763 },
            { lat: 14.514121, lng: 121.063565 },
            { lat: 14.514342, lng: 121.063339 },
            { lat: 14.515050, lng: 121.062782 },
            { lat: 14.515398, lng: 121.063201 },
            { lat: 14.515773, lng: 121.063587 },
            { lat: 14.516277, lng: 121.064585 },
            { lat: 14.516469, lng: 121.064709 },
            { lat: 14.516566, lng: 121.063517 },
            { lat: 14.516841, lng: 121.063409 },
            { lat: 14.517081, lng: 121.062623 },
            { lat: 14.517482, lng: 121.062459 },
            { lat: 14.517571, lng: 121.061704 },
            { lat: 14.517608, lng: 121.061235 },
            { lat: 14.517274, lng: 121.061192 },
            { lat: 14.516948, lng: 121.061163 },
            { lat: 14.516570, lng: 121.061127 },
            { lat: 14.516361, lng: 121.061102 },
            { lat: 14.515952, lng: 121.061026 },
            { lat: 14.515352, lng: 121.060974 },
            { lat: 14.515077, lng: 121.060964 },
            { lat: 14.514322, lng: 121.060942 },
            { lat: 14.513982, lng: 121.060897 },
            { lat: 14.513432, lng: 121.060842 },
            { lat: 14.512202, lng: 121.060687 },
            { lat: 14.511783, lng: 121.061291 },
            { lat: 14.511391, lng: 121.061598 },
            { lat: 14.511009, lng: 121.062832 },
            { lat: 14.510802, lng: 121.063277 },
            { lat: 14.509317, lng: 121.064633 },
            { lat: 14.508893, lng: 121.065169 },
            { lat: 14.507693, lng: 121.067502 },
            { lat: 14.507542, lng: 121.067698 },
            { lat: 14.506934, lng: 121.068718 },
            { lat: 14.506652, lng: 121.069343 },
            { lat: 14.507233, lng: 121.069643 },
            { lat: 14.507380, lng: 121.070029 },
            { lat: 14.512264, lng: 121.073828 },
            { lat: 14.512315, lng: 121.075814 },
            { lat: 14.511867, lng: 121.076325 },
            { lat: 14.511637, lng: 121.076467 },
            { lat: 14.510517, lng: 121.076399 },
            { lat: 14.509525, lng: 121.076565 },
            { lat: 14.508634, lng: 121.077771 },
            { lat: 14.508478, lng: 121.078243 },
            { lat: 14.507731, lng: 121.080120 },
            { lat: 14.507689, lng: 121.080882 },
            { lat: 14.507066, lng: 121.081451 },
            { lat: 14.507164, lng: 121.082512 },
            { lat: 14.507767, lng: 121.082587 },
            { lat: 14.508343, lng: 121.082299 },
            { lat: 14.508878, lng: 121.083306 },
            { lat: 14.509750, lng: 121.085087 },

        ];
        // Construct the polygon.
        var BucaramangaPolygon = new google.maps.Polygon({
            paths: BucaramangaDelimiters,
            strokeColor: '#21130d',
            strokeOpacity: 0.8,
            strokeWeight: 3,
            fillColor: '#dddeda',
            fillOpacity: 0.35,

        });

        // Draw the polygon on the desired map instance
        BucaramangaPolygon.setMap(map);

    }

</script>

</head>
<body id="page-top" >
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
                                                   aria-describedby="basic-addon2"/>
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
                        <div class="row">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Residents
                                                </div>
                                                <asp:Label ID="lblRows" runat="server" />
                                            </div>
                                            <div class="col-auto">
                                                <img src="residen.png"  width="40"  height="40" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Male
                                                </div>
                                                <asp:Label ID="Label1" runat="server" />
                                            </div>
                                            <div class="col-auto">
                                               <img src="male.png"  width="30"  height="30" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                           <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Female
                                                </div>
                                                <asp:Label ID="Label2" runat="server" />
                                            </div>
                                            <div class="col-auto">
                                               <img src="female.png"  width="40"  height="40" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Voters
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                                 <asp:Label ID="Label3" runat="server" />
                                            </div>
                                            <div class="col-auto">
                                               <img src="incident.png"  width="40"  height="40" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="col-xl-4 col-md-10 mb-4" >
                                <div class="card border-left-primary shadow h-100 py-" width="350px" >
                                    <div class="card-body"  >
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Violence and Incident Report
                                                </div>
                                                <asp:Chart ID="PieChartMonthToDate"  BorderlineDashStyle="Solid"
    Visible="true" ImageType="Png" runat="server" Height="350px" Width="350px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
    <Titles>
        <asp:Title TextStyle="Frame">
        </asp:Title>
    </Titles>
    <Legends>
        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
            LegendStyle="Column">
        </asp:Legend>
    </Legends>
    <Series>
        <asp:Series Name="Series1" ChartType="Pie" YValuesPerPoint="2">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea IsSameFontSizeForAllAxes="true" BorderWidth="0" Name="ChartArea1">
            <Area3DStyle Enable3D="true" />
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="col-xl-4 col-md-10 mb-4" >
                                <div class="card border-left-primary shadow h-100 py-" width="350px" >
                                    <div class="card-body"  >
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                   Religion Chart
                                                </div>
                    <asp:Chart ID="Chart1"  BorderlineDashStyle="Solid"
    Visible="true" ImageType="Png" runat="server" Height="350px" Width="350px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
    <Titles>
        <asp:Title TextStyle="Frame">
        </asp:Title>
    </Titles>
    <Legends>
        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
            LegendStyle="Column">
        </asp:Legend>
    </Legends>
    <Series>
        <asp:Series Name="Series1" ChartType="Pie" YValuesPerPoint="2">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea IsSameFontSizeForAllAxes="true" BorderWidth="0" Name="ChartArea1">
            <Area3DStyle Enable3D="true" />
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>

                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <div class="col-xl-4 col-md-10 mb-4" >
                                <div class="card border-left-primary shadow h-100 py-" width="350px" >
                                    <div class="card-body"  >
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                   Status Chart
                                                </div>
                    <asp:Chart ID="Chart2"  BorderlineDashStyle="Solid"
    Visible="true" ImageType="Png" runat="server" Height="350px" Width="350px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
    <Titles>
        <asp:Title TextStyle="Frame">
        </asp:Title>
    </Titles>
    <Legends>
        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
            LegendStyle="Column">
        </asp:Legend>
    </Legends>
    <Series>
        <asp:Series Name="Series1" ChartType="Pie" YValuesPerPoint="2">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea IsSameFontSizeForAllAxes="true" BorderWidth="0" Name="ChartArea1">
            <Area3DStyle Enable3D="true" />
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>

                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                                   
                        
                        <div class="row">

                   
                        <!-- Content Row -->
                        <div class="card shadow mb-5" style="margin-left:20px;">
                            <!-- Card Header - Dropdown -->
                            <!-- Card Body -->
                                        <div class="card-header bg-danger">
                                            <h6 class="card-title text-uppercase text-white">Search Residents on the Map</h6>
                                      
                                    </div> 

<div>
<br/>
<label style="margin-left:15px;">Search :</label>
<asp:TextBox ID="txtSearch" runat="server" placeholder="Search Location..."></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" text="Search" OnClick="btnSearch_Click" CssClass="btn btn-info p-1 "/>
    </div>
 <br /> 


<div id="dvMap" style="width: 1250px; height: 500px">
    </div>
<script type="text/javascript">
    var markers = [
         <asp:Repeater ID="rptMarkers" runat="server">
     <ItemTemplate>
    {
        
        "title": '<%# Eval("ResidenceName") %>',
        "lat": '<%# Eval("Latitude") %>',
        "lng": '<%# Eval("Longitude") %>',
        "description": '<%# Eval("Address") %>'
    }
    </ItemTemplate>
<SeparatorTemplate>
    ,
</SeparatorTemplate>
</asp:Repeater>
];
</script>
   <!-- Content Row -->
                      
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->
                <!-- Footer -->
                
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
