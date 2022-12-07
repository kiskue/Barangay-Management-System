<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarangayCertificate1.aspx.cs" Inherits="BMS.BarangayCertificate1" %>


<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>


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

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  
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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />

<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>

<script type="text/javascript">
    $(function () {
        $("[id*=gvCustomers]").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
            "paging": false,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true
        });
    })
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
<body id="page-top" >
    <form id="form1" runat="server">
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Admin1.aspx">
                    <div class="sidebar-brand-icon ">
                       <img src="hagonoy.jpg"  width="40"  height="40" />
                    </div>
                    <div class="sidebar-brand-text mx-3">Barangay Hagonoy<sup></sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="Admin1.aspx">
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
                            <a class="collapse-item" href="BarangayCertificate1.aspx">Barangay Clearance</a>
                            <a class="collapse-item" href="BarangayIndigency1.aspx">Barangay Indigency</a>
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
                            <a class="collapse-item" href="BarangayBusiness1.aspx">Business Permits</a>
                            <a class="collapse-item" href="BuildingPermit.aspx">Building permits</a>
                           
                        </div>
                    </div>
                   
                    
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                
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
                    </div>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                                <div class="container py-4">
                              
                                <div class="card">
                                    <div class="card-header bg-danger">
                                        <h6 class="card-title text-uppercase text-white">BARANGAY CERTIFICATES</h6>
                                    </div>

                                    <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px;">
                                  

                   
                      
                <asp:ScriptManager runat="server" />

    <ContentTemplate >
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false" class="table table-condensed " 
            ClientIDMode="Static">
            <Columns >
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                  <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Number" HeaderText="Number" />
                <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
                <asp:BoundField DataField="Date" HeaderText="Year" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate >
                        <asp:Button ID="btnEdit" Text="Select" runat="server" OnClick="Edit" CssClass="btn btn-primary justify-content-around"/>
                        <asp:Button ID="btnDelete" Text="Delete" runat="server" CssClass="btn btn-danger justify-content-around" 
                            OnClick="Delete" OnClientClick="return confirm('Are you sure you want to delete?')" />
               
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
         <hr />
        <table align="center">
            <tr>
                <td>ID</td>
                <td><asp:Label ID="lblId" runat="server" CssClass="form-control" /></td>
            </tr>
            <tr>
                <td>Name</td>
                <td> <asp:Textbox runat="server" type="text" class="form-control" placeholder="Name"  id="Name" /></td>
            </tr>
            <tr>
                <td>Email</td>
                <td> 
                                                
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="Name"  id="Email" />

                                           </td>
            </tr>
              <tr>
                <td>Number</td>
                <td> <asp:Textbox runat="server" type="text" class="form-control" placeholder="Contact Number"  id="Number" /></td>
            </tr>
             
              <tr>
                <td>Purpose</td>
                <td><asp:Textbox runat="server" type="text" class="form-control" placeholder="Purpose" id="Purpose" /></td>
            </tr>
              <tr>
                <td>Year</td>
                <td><asp:Textbox runat="server" class="form-control" type="text" id="Year"   /></td>
            </tr>
            <tr>
                
                <td> <asp:Textbox runat="server" class="form-control" type="text" value="Barangay Clearance" id="indigency" hidden="true"  /></td>
            </tr>
            <tr>
                
                <td> <asp:Textbox runat="server" class="form-control" type="text" value="Claimed" id="claimed" hidden="true"  /></td>
            </tr>
            <tr>
                <td style="margin-right:15px;"></td>
                <td>
                   <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
<asp:Button ID="btnGenerate" runat="server" Text="Generate" OnClick="btnGenerate_Click" />

<br />
<asp:GridView runat="server" ID="gvQRCode" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound">
    <Columns>
        <asp:TemplateField HeaderText="QRCODE">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                          <asp:Button Text="Print" ID="Button3" CssClass="btn btn-primary " runat="server" Onclick="btnselect_Click"  />
                    <asp:Button ID="btnSave" Text="Update" runat="server" OnClick="Save" CssClass="btn btn-success" />
                    <asp:Button Text="Done" ID="Button1" CssClass="btn btn-primary " runat="server"  onclick="btndone" OnClientClick="return confirm('Are you sure you want to Mark Claimed this request?')"/>
                </td>
            </tr>
        </table>

    </ContentTemplate>
         

                        <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px; margin-top:20px">
                         <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="600px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="800px" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" />
                           
                            <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                                <Report FileName="CrystalReport1.rpt">
                                </Report>
                            </CR:CrystalReportSource>
                             </div>
                    
            </div>

        </div>

            
    </div>
                                </div>
     

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




