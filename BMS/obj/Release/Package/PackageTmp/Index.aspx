
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BMS.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Barangay Hagonnoy</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
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

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-image">
                                  
                                </div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">MAGANDANG ARAW!</h1>
                                        </div>
                                        <form class="user">
                                            <div class="form-group">

                                                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control form-control-user"
                                                    placeholder="Enter Username..." />
                                               
                                            </div>
                                            <div class="form-group">

                                                <asp:TextBox runat="server" ID="txtpassword" TextMode="Password" CssClass="form-control form-control-user"
                                                    placeholder="Password" />
                                               
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                                    <label class="custom-control-label" for="customCheck">
                                                        Remember
                                                    Me</label>
                                                </div>
                                            </div>
                                            
                                            <asp:Button Text="login" ID="btnlogin" CssClass="btn btn-primary btn-user btn-block" runat="server" Onclick="btnlogin_Click"/>
                                            
                                            <br />
                                            <asp:Label Text="" ID="lblError" ForeColor="Red" Font-Bold="false" runat="server" />

                                            <br />
                                            <br /> 
                                            
                                        </form>
                                        <hr>
                                       
                                        <div class="text-center">
                                            <a class="small" href="register.html">Create an Account!</a>
                                        </div>
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
