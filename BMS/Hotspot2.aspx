<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hotspot2.aspx.cs" Inherits="BMS.Hotspot2" %>

<%@ Register Assembly="System.Web.DataVisualization,Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">  
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
        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                draggable: true,
                map: map,
                title: data.title

            });
            (function (markers, data) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(data.description);
                    infoWindow.open(map, marker);
                    var pos = map.getZoom();
                    map.setZoom(19);
                    map.setCenter(marker.getPosition());
                    window.setTimeout(function() {map.setZoom(pos);},10000);
                });
            
            })(markers, data);
        }
    }
</script>

</head>
<body id="page-top" >
    <form id="form1" runat="server">
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Admin2.aspx">
                    <div class="sidebar-brand-icon ">
                       <img src="hagonoy.jpg"  width="40"  height="40" />
                    </div>
                    <div class="sidebar-brand-text mx-3">Barangay Hagonoy<sup></sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="Admin2.aspx">
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
                   
                <!-- Divider -->
                <hr class="sidebar-divider">
                
                <li class="nav-item">
                    <a class="nav-link" href="Hotspot.aspx">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Hotspot Area</span>
                    </a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="Blotter2.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Blotter</span>
                    </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="Blotter2.aspx">
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
                <div class="row">

                           <div class="col-xl-7 col-md-8 mb-10" style=" height:130px; margin-left:15px;">
                                <div class="card border-left-success shadow h-180 py-2">
                                    <div class="card-body" style="justify-content:center;">
                                        <asp:Chart ID="PieChartMonthToDate" BorderlineDashStyle="Solid"
    Visible="true" ImageType="Png" runat="server" Height="350px" Width="600px" PaletteCustomColors="128, 255, 128; 255, 128, 0">
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
                            
                   
                         <div class="col-xl-2 col-md-6 mb-4" style="margin-right:20px;height:100px;margin-left:35px;">
                              <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                   Dreamland
                                                </div>
                                                <asp:Label ID="Label1" runat="server" />
                                            </div>
                                            <div class="col-auto">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 col-md-4 mb-4" style="height:100px;">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    SeaBrezz
                                                </div>
                                                <asp:Label ID="Label2" runat="server" />
                                            </div>
                                            <div class="col-auto">
                                              
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="col-xl-2 col-md-6 mb-12" style="margin-right:20px;height:100px;margin-left:810px;">
                              <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                   Pag-asa
                                                </div>
                                                <asp:Label ID="Label3" runat="server" />
                                            </div>
                                            <div class="col-auto">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 col-md-4 mb-4" style="height:100px;">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Creekland
                                                </div>
                                                <asp:Label ID="Label4" runat="server" />
                                            </div>
                                            <div class="col-auto">
                                              
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </div>
                            </div>
                        <div class="row" style="justify-content:center;margin-top:190px;">

                        <!-- Content Row -->
                        <div class="card shadow mb-5 ml-10">
                            <!-- Card Header - Dropdown -->
                            <!-- Card Body -->
                            <div class="card-body">


<br class="col-xl-3 col-md-6 mb-4"/>
Search :
 <select runat="server" id="report" name="Place" required="Please fill up"  style="height:33px;">
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
<asp:Button ID="btnSearch" runat="server" text="Search" OnClick="btnSearch_Click" CssClass="btn btn-info p-1 "/>
 <br /> 
<br />
<div id="dvMap" style="width: 1200px; height: 500px">
    
<script type="text/javascript">
    var markers = [
        <asp:Repeater ID="rptMarkers" runat="server">
            <ItemTemplate>
                {
                    "title": '<%# Eval("Date") %>',
        "lat": '<%# Eval("Latitude") %>',
        "lng": '<%# Eval("Longitude") %>',
         "description": '<%# Eval("IncidentReport") %>'
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

