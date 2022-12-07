<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="BMS.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" type="text/css" href="style.css"/>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title></title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"/>
<link href="~/css/sb-admin-2.min.css" rel="stylesheet"/>

<!-- Bootstrap core JavaScript-->
<script src="~/vendor/jquery/jquery.min.js"></script>
<script src="~/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="~/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="~/js/sb-admin-2.min.js"></script>
</head>
<body> <input type="checkbox" id="menu"/>
      <nav> <label>Risk Hotspot</label>
          <ul>
              <li><a href="#">Logout</a></li>
          </ul> <label for="menu" class="menu-bar"> <i class="fa fa-bars"></i> </label>
      </nav>
      <div class="side-menu">
          <center> <img src="hagonoy.jpg"> <br><br>
                                    @if (Session["FirstName"] != null)
                                    {
                                        <p class="menu-top-active">Welcome @Session["FirstName"].ToString()</p>
                                    }
          </center> <br> 
          <a href="#"><i class="fa fa-user"></i><span>Blotter</span></a> 
          <a href="Certificates.aspx`"><i class="fa fa-envelope"></i><span>Certificates</span></a> 
          <a href="#"><i class="fa fa-cog"></i><span>Setting</span></a>
          <a href="~/Certificates.aspx" class="Logout"><span>Logout</span></a>
          
                        @if (Request.IsAuthenticated)
                        {
                            <a href='@Url.Action("Login", "Register")' onclick='navigate(this.href);'>
                                <input style="float: right;" type="button" class="btn btn-primary" value='Logout' />
                            </a>
                        }

      </div>
      <div class="data"> </div>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

* {
    padding: 0;
    margin: 0;
    text-decoration: none;
    list-style: none;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
}

.data {
    background: url(hagonoy-removebg-preview.jpg);
    height: 100vh;
    margin-left: 250px;
    background-size: cover;
    background-repeat: no-repeat;
   
    
}

nav {
    background: #1D2951;
    line-height: 80px;
    position: fixed;
    width: 100%;
    opacity: 1000;
}

label {
    line-height: 80px;
    font-size: 30px;
    color: white;
    font-weight: 200;
    margin-left: 50px;
    cursor: pointer;
}

nav ul {
    float: right;
    margin-right: 20px;
}

nav ul li {
    line-height: 80px;
    margin: 0 10px;
}

nav ul li a {
    color: white;
    font-size: 20px;
    padding: 6px 15px;
    font-weight: 600;
    background-color: rgb(55, 34, 246);
    border-radius: 3px;
}

nav ul li a:hover {
    background-color: rgb(49, 27, 214);
    color: white;
    transition: 0.5s;
}

.side-menu {
    position: fixed;
    background: #1D2951;
    width: 250px;
    height: 100%;
    margin-top: 80px;
}

.side-menu center img {
    height: 120px;
    width: 120px;
    border-radius: 50%;
    margin-top: 30px;
    border: 3px solid white;
}

.side-menu center h2 {
    color: white;
}

.side-menu a {
    display: block;
    line-height: 60px;
    transition: 0.5s;
}

.side-menu a:hover {
    background: rgb(20, 54, 165);
    padding-left: 20px;
}

.side-menu span {
    font-size: 20px;
    margin-left: 10px;
    color: white;
}

.side-menu i {
    font-size: 20px;
    margin-left: 20px;
    color: white;
}

nav .menu-bar {
    float: right;
    margin-top: 20px;
    display: none;
    margin-right: 20px;
}

#menu {
    display: none;
}

.side-menu .Logout {
    display: none;
}

@media (max-width:850px) {
    .side-menu a span {
        display: none;
    }

    .side-menu center {
        display: none;
    }

    .side-menu {
        width: 100px;
    }

    .side-menu a i {
        display: block;
        line-height: 80px;
        text-align: center;
        margin-left: 0;
        font-size: 35px;
    }

    .data {
        margin-left: 100px;
    }
}

@media (max-width:650px) {
    .data {
        display: none;
    }

    nav ul {
        display: none;
    }

    .side-menu {
        width: 100%;
        text-align: center;
        left: 100%;
        background-color: #4c516d;
        transition: all 0.5s;
    }

    .side-menu a i {
        display: none;
    }

    .side-menu a span {
        display: block;
    }

    .side-menu .Logout {
        display: block;
    }

    nav .menu-bar {
        display: block;
    }
}

#menu:checked~.side-menu {
    left: 0;
}
    </style>
    <form id="form1" runat="server">
    <div>
      <div class="col-ml-2 col-md-15 col-xs-20">
                     
                            <div class="container py-3">
                                <h5 class="text-center">Report Incident</h5>
                                <div class="card">
                                    <div class="card-header bg-danger">
                                        <h6 class="card-title text-uppercase text-white">BARANGAY HAGONOY</h6>
                                    </div>

                                    <div class="form-row justify-content-center" style="padding:15px 15px 15px 15px;">
                                      <div class="col-lg-4 col-lg-offset-4">
                                            <div class="form-group">
                                                <label>Name:</label>
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="Name"  id="Name" />

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
                                                <label>House No. / Street:</label>
                                                 <asp:Textbox runat="server" type="text" class="form-control" placeholder="House No. and Street"  id="StreetNum" />
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Purok:</label>
                                              <asp:Textbox runat="server" type="text" class="form-control" placeholder="Purok"  id="Purok" />
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Purpose:</label>
                                                <asp:Textbox runat="server" type="text" class="form-control" placeholder="Purpose" id="Purpose" />
                                            </div>
                                        </div>
                                      <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label>Year:</label>
                                                <asp:Textbox runat="server" type="month" id="Year"  />
                                            </div>
                                        </div>
                                            
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label for="place">Choose a Day:</label>
                                                <select runat="server" id="Day" required="Please fill up">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                    <option value="13">13</option>
                                                    <option value="14">14</option>
                                                    <option value="15">15</option>
                                                    <option value="16">16</option>
                                                    <option value="17">17</option>
                                                    <option value="18">18</option>
                                                    <option value="19">19</option>
                                                    <option value="20">20</option>
                                                    <option value="21">21</option>
                                                    <option value="22">22</option>
                                                    <option value="23">23</option>
                                                    <option value="24">24</option>
                                                    <option value="25">25</option>
                                                    <option value="26">26</option>
                                                    <option value="27">27</option>
                                                    <option value="28">28</option>
                                                    <option value="29">29</option>
                                                    <option value="30">30</option>
                                                    <option value="31">31</option>
                                                </select>
                                           </div>
                                        </div>
                                        <div class="col-sm-4 col-md-3 col-xs-12">
                                            <div class="form-group">
                                                <label for="place">Choose a Month:</label>
                                                <select runat="server" id="Month" required="Please fill up">
                                                    <option value="January">January</option>
                                                    <option value="Febraury">February</option>
                                                    <option value="March">March</option>
                                                    <option value="April">April</option>
                                                    <option value="May">May</option>
                                                    <option value="June">June</option>
                                                    <option value="July">July</option>
                                                    <option value="August">August</option>
                                                    <option value="September">September</option>
                                                    <option value="October">October</option>
                                                    <option value="November">November</option>
                                                    <option value="December">December</option>

                                                </select>
                                         </div>
                                        </div>
                                     
                                    </div>
                                </div>
                                <div class="modal-footer">
                                   
                                    <asp:Button Text="submit" ID="Button2" CssClass="btn btn-primary btn-user btn-block" style="width:100px;" runat="server"   />

                                </div>




                            </div>
                            <!-- Display geolocation data -->

                         <div class="col-ml-2 col-md-15 col-xs-20">
                     
                            <div class="container py-4">
                    <div class="card ">
                           
                        <div class="form-row justify-content-center "  style="padding:15px 15px 15px 15px; margin-top:20px">
                         <asp:GridView ID="GridView1" runat="server"  UseAccessibleHeader="true" CssClass="table table-condensed table-hover "  Width="1200px"  >

                          

                         </asp:GridView>

                        </div>
                         </div>
                        
                    </div>
                </div>
            </div>

        </div>

    </div>
    </form>
</body>
</html>

