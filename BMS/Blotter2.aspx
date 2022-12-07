<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blotter2.aspx.cs" Inherits="BMS.Blotter2" %>

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
  
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>
     <script type="text/javascript" src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuVyZWwqTq86AJctzNQmhb2hmUt5M7tQE"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />

<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>


<script>
    $(document).ready(function () {
        $(".swal-button").click(function () {
            //location.reload(); 
            window.location = 'blotter.aspx';
        });
    });
</script>
       <style>
body {
width: 100%;
margin: 5px;
}

.table-condensed tr th {
border: 0px solid #de241b;
color: white;
background-color: #de241b;
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
                                    </div>
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
                                </div>
                            </li>

                            <!-- Nav Item - Alerts -->

                      <%--  --%>
                    </nav>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        
                    <div class="col-ml-2 col-md-15 col-xs-20">
                     
                             
                                <div class="card">
                                    <div class="card-header bg-danger">
                                        <h6 class="card-title text-uppercase text-white">Blotter</h6>
                                    </div>

                                    <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px;" >
                                         
                               <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px;">
                                      <div class="col-lg-4 col-lg-offset-4">
                                            <div class="form-group">
                                                <label>FullName:</label>
                                                <asp:Label ID="lblId" runat="server" CssClass="form-control" hidden="true"/>
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
                                                <label>HOA</label>
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
                                                <label>Incident Report:</label>
                                                <asp:Textbox runat="server" type="text" class="form-control" placeholder="Incident Report" id="Incident" />
                                            </div>
                                        </div>
                                     
                                            <div class="col-lg-4 col-lg-offset-4">
                                            <div class="form-group">
                                                <label> Witness1</label>
                                                  <asp:Textbox runat="server" type="text" class="form-control" placeholder="Witness1" id="Witness1" />
                         
                                            </div>
                                        </div>
                                     <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label> Witness2</label>
                                                  <asp:Textbox runat="server" type="text" class="form-control" placeholder="Witness2" id="Witness2" />
                         
                                            </div>
                                        </div>
                                    <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label> Witness3</label>
                                                  <asp:Textbox runat="server" type="text" class="form-control" placeholder="Witness3" id="Witness3" />
                         
                                            </div>
                                        </div>
                                         <div class="col-lg-4 col-lg-offset-4">
                                            <div class="form-group">
                                                <label>Narative:</label>
                                                 <textarea runat="server" type="text" class="form-control" placeholder="Place of Incident" id="narative" ></textarea>

                                 
                                            </div>
                                        </div>
                                   <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Place of Incident:</label>
                                                <asp:Textbox runat="server" type="text" class="form-control" placeholder="Place of Incident" id="PlaceIncident" />
                                            </div>
                                        </div>
                                      <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Date of Incident:</label>
                                                <asp:Textbox runat="server" class="form-control" type="date" id="Year"   />
                                            </div>
                                        </div>
                                    <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
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
                                                 </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                      <asp:Button Text="Print" ID="Button3" CssClass="btn btn-success " runat="server" Onclick="btnselect_Click"  />
                                    <asp:Button Text="Save" ID="Button2" CssClass="btn btn-primary btn-user btn-block" style="width:100px;" runat="server" onclick="btnSave_Click" />
                                    
                                  </div>
                                     
                                    <asp:ScriptManager runat="server" />

    <ContentTemplate >
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false" class="table table-condensed " 
            ClientIDMode="Static">
            <Columns >
                <asp:BoundField DataField="FID" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                  <asp:BoundField DataField="Email" HeaderText="Email" />
                 <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="Number" HeaderText="Number" />
                  <asp:TemplateField HeaderText="Action">
                    <ItemTemplate >
                        <asp:Button ID="btnEdit" Text="Select" runat="server" onclick="Edit" CssClass="btn btn-primary justify-content-around"/>
                        <asp:Button ID="btnDelete" Text="Delete" runat="server" CssClass="btn btn-danger justify-content-around" 
                            OnClick="Delete" OnClientClick="return confirm('Are you sure you want to delete?')" />
               
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                                          

                          </div>
                          <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px; margin-top:20px">
                         <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="1104px" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" />
                           
                           
                              <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                                  <Report FileName="CrystalReport5.rpt">
                                  </Report>
                              </CR:CrystalReportSource>
                           
                           
                             </div>
                          </div>
                                  </div>
                          </div>
                          </div>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->5
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
    