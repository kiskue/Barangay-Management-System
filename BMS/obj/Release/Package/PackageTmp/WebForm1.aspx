<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BMS.WebForm1" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>Barangay Hagonnoy</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet"/>
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
     </script>


    <style>
        .bg-image {
            background-image: url(hagonoy.jpg);
            background-position: center;
            background-size: cover;
        }
        .bg-background{
            background-image: url(background.jfif);
            background-size: cover;
        }
    </style>
</head>
<body class="bg-background">
    <form id="form1" runat="server">
        <div class="container">
                    <div class="col-ml-2 col-md-15 col-xs-20">
           
                <div class="container py-4">
                  
                    <div class="card">
                        <div class="card-header bg-danger">
                            <h6 class="card-title text-uppercase text-white">BARANGAY HAGONOY INCIDENT REPORT</h6>
                        </div>

                        <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px;">
                         
                                
                            <div class="col-lg-4 col-lg-offset-4">
                                <div class="form-group">
                                    <label>Name:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="Recidence Name" name="Name" ID="name" />
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label>Latitude:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="lat" name="Latitude" id="lat" />

                                </div>
                            </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label>Longitude:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="lng" name="Longitude" id="lng" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-lg-offset-4">
                                <div class="form-group">
                                    <label>Landmark:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="Address" name="Landmark" id="landmark" />
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label>Incident Report:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="Occupation" name="IncidentReport" id="report" />
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label>Contact Number:</label>
                                    <asp:Textbox runat="server" type="text" class="form-control" placeholder="Contact Number" name="Contact" id="contact" />
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label for="place">Choose a Place:</label>
                                    <select runat="server" id="place" name="Place">
                                        <option value="Dreamlad">Dreamland</option>
                                        <option value="Pag-asa">Pag-asa</option>
                                        <option value="SeaBrezz">SeaBrezz</option>
                                        <option value="Creekland">Creekland</option>
                                    </select>

                                </div>
                            </div>

                            <div class="col-sm-4 col-md-3 col-xs-12">
                                <div class="form-group">
                                    <label for="appt">Select a time:</label>
                                    <asp:Textbox runat="server" type="time" id="time" name="Time" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-lg-offset-4">
                                <div class="form-group">
                                    <label for="birthday">Date:</label>
                                    <asp:Textbox runat="server" type="date" id="date" name="Date" />
                                </div>
                            </div>
                            <p>Click the button to get your coordinates.</p>

                            <button onclick="getLocation()" class="btn btn-info " style="margin-left:10px; height:30px; font-size:12px;">CLICK</button>

                        </div>
                    </div>
                    <div class="modal-footer">
                         <asp:Label ID="Lbl1" runat="server" Text=""></asp:Label>

                 <asp:Button Text="submit" ID="Button2" CssClass="btn btn-primary btn-user btn-block" style="width:100px;" runat="server"   />


                       
                    </div>




                </div>

        </div>
        </div>
                       
                
            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-7 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-image">
                                  
                                </div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Have a Great Day!</h1>
                                        </div>
                                        <div class="user" style="margin-top:40px;">
                                            <div class="form-group">

                                                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control form-control-user"
                                                    placeholder="Enter Username..." />
                                               
                                            </div>
                                            <div class="form-group">

                                                <asp:TextBox runat="server" ID="txtpassword" TextMode="Password" CssClass="form-control form-control-user"
                                                    placeholder="Enter Password..." />
                                               
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck"/>
                                                    <label class="custom-control-label" for="customCheck">
                                                        Remember
                                                    Me</label>
                                                </div>
                                            </div>
                                            
                                            <asp:Button Text="login" ID="btnlogin" CssClass="btn btn-primary btn-user btn-block" runat="server" />
                                            
                                            <br />
                                            <asp:Label Text="" ID="lblError" ForeColor="Red" Font-Bold="false" runat="server" />

                                            <br />
                                            
                                        </div>
                                        <hr/>
                                       
                                        <div class="text-center">
                                            <a class="small" href="/Register">Create an Account!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

 

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
  </form>
</body>
</html>
