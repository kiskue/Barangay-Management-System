<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Indigency.aspx.cs" Inherits="BMS.Indigency" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width" />
    <title>Location</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuVyZWwqTq86AJctzNQmhb2hmUt5M7tQE&libraries=places&v=weekly"></script>
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

    <script>
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
                    <a class="nav-link" href="/UserDash/Index">
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
                    <!-- End of Content Wrapper -->

                    <div class="col-ml-2 col-md-15 col-xs-20">
                     
                            <div class="container py-4">
                             
                                <div class="card">
                                    <div class="card-header bg-primary">
                                        <h6 class="card-title text-uppercase text-white">BARANGAY INDIGENCY</h6>
                                    </div>

                                    <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px;">
                                      <div class="col-lg-4 col-lg-offset-4">
                                            <div class="form-group">
                                                <label>FullName:</label>
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="FullName"  id="Name" />

                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Email:</label>
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="Email"  id="Email" />

                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Contact Number:</label>
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="Contact Number"  id="Number" />
                                            </div>
                                        </div>
                                     <div class="col-lg-4 col-lg-offset-4">
                                            <div class="form-group">
                                                 <label>Address:</label>
                                              <asp:Textbox runat="server" type="text" class="form-control" placeholder="Complete Address"  id="Address" />
                                               
                                            </div>
                                        </div>
                               
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Sex:</label>
                                                <select runat="server" id="Sex" name="Place" required="Please fill up"  class="form-control">
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        
                                    </select>
                                          </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Status:</label>
                                                <select runat="server" id="Status" name="Place" required="Please fill up"  class="form-control">
                                        <option value="Single">Single</option>
                                        <option value="Married">Married</option>
                                        <option value="Widowed">Widowed</option>
                                        <option value="separated">separated</option>

                                    </select>
                                            </div>
                                        </div>
                                           
                                       <div class="col-lg-4 col-lg-offset-4">
                                            <div class="form-group">
                                                <label>Date of Request:</label>
                                                <asp:Textbox runat="server" class="form-control" type="text" id="Year"   />
                                            </div>
                                        </div>
                                         <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                          
                                                <asp:Textbox runat="server" class="form-control" type="text" value="Barangay Indigency" id="indigency" hidden="true"  />
                                            </div>
                                        </div>
                                         <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                          
                                                <asp:Textbox runat="server" class="form-control" type="text" value="Pending......" id="pending" hidden="true"  />
                                            </div>
                                        </div>
                                            
                                       
                                        
                                     
                                    </div>
                                </div>
                                <div class="modal-footer">
                                   
                                    <asp:Button Text="submit" ID="Button2" CssClass="btn btn-primary btn-user btn-block" style="width:100px;" runat="server" onclick=" btnSave_Click" />

                                </div>




                            <!-- Display geolocation data -->
                             
                    <div class="container py-4">
                                    
                                    <div class="card">
                                        <div class="card-header bg-primary">
                                            <h6 class="card-title text-uppercase text-white">Requested Certificates</h6>
                                      
                                    </div> 
                                    </div>

           
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" class="table table-condensed " 
            ClientIDMode="Static">
            <Columns >
            
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                 <asp:BoundField DataField="Indigency" HeaderText="Type" />
                <asp:BoundField DataField="Date" HeaderText="Date Requested" />
                <asp:BoundField DataField="Pending" HeaderText="Status" />
            </Columns>
        </asp:GridView>

                       
                        </div>
                      
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
                        <a class="btn btn-primary" href="/Register/Login">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        
    </form>
</body>
</html>


