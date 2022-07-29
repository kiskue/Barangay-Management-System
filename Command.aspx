<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Command.aspx.cs" Inherits="BMS.Command" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="padding:15px">


        <table class="nav-justified">
            <tr>
                <td style="font-size: x-large; font-weight: bold; color: #FF0000; width: 326px; height: 52px;">Mini Command Center</td>
                <td style="width: 858px; height: 52px;"></td>
            </tr>
            <tr>
                <td style="width: 326px">&nbsp;</td>
                <td style="width: 858px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 326px; font-size: medium;">
                    ID</td>
                <td style="width: 858px">
                    <asp:TextBox ID="TextBox6" runat="server" Font-Size="Medium" Width="288px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 326px">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Fullname"></asp:Label>
                </td>
                <td style="width: 858px">
                    <asp:TextBox ID="TextBox1" runat="server" Font-Size="Medium" Width="288px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 326px">
                    <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Contact"></asp:Label>
                </td>
                <td style="width: 858px">
                    <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium" Width="288px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 326px">
                    <asp:Label ID="Label9" runat="server" Font-Size="Medium" Text="Concern"></asp:Label>
                </td>
                <td style="width: 858px">
                    <asp:TextBox ID="TextBox3" runat="server" Font-Size="Medium" Width="288px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 326px">
                    <asp:Label ID="Label8" runat="server" Font-Size="Medium" Text="Location"></asp:Label>
                </td>
                <td style="width: 858px">
                    <asp:TextBox ID="TextBox4" runat="server" Font-Size="Medium" Width="288px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 326px">
                    <asp:Label ID="Label7" runat="server" Font-Size="Medium" Text="Date"></asp:Label>
                </td>
                <td style="width: 858px">
                    <asp:TextBox ID="TextBox5" runat="server" Font-Size="Medium" Width="288px"  Type="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 326px; height: 31px;">
                    <asp:Label ID="Label10" runat="server" Font-Size="Medium" Text="Status"></asp:Label>
                </td>
                <td style="width: 858px; height: 31px;">
                    <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="Medium" Width="296px">
                        <asp:ListItem>ONGOING</asp:ListItem>
                        <asp:ListItem>DONE</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 326px">&nbsp;</td>
                <td style="width: 858px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 326px">&nbsp;</td>
                <td style="width: 858px">
                    <asp:Button ID="Button1" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Height="35px" OnClick="Button1_Click" Text="Insert" Width="100px" />
                    <asp:Button ID="Button2" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Height="35px" OnClick="Button2_Click" Text="Update" Width="100px" />
                    <asp:Button ID="Button3" runat="server" BackColor="Black" ForeColor="White" Height="35px" OnClick="Button3_Click" Text="Delete" Width="100px" />
                </td>
            </tr>
            <tr>
                <td style="width: 326px">&nbsp;</td>
                <td style="width: 858px">&nbsp;</td>
            </tr>
             <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server"  Width="1160px" AutoGenerateColumns="False" DataKeyNames="EmpId">
                        <Columns>
                            <asp:BoundField DataField="EmpID" HeaderText="EmpId" ReadOnly="True" SortExpression="EmpId" />
                            <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName" />
                            <asp:BoundField DataField="EmpConcern" HeaderText="EmpConcern" SortExpression="EmpConcern" />
                            <asp:BoundField DataField="EmpContact" HeaderText="EmpContact" SortExpression="EmpContact" />
                            <asp:BoundField DataField="EmpLocation" HeaderText="EmpLocation" SortExpression="EmpLocation" />
                            <asp:BoundField DataField="EmpDate" HeaderText="EmpDate" SortExpression="EmpDate" />
                            <asp:BoundField DataField="EmpStatus" HeaderText="EmpStatus" SortExpression="EmpStatus" />
                        </Columns>
                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS%>" SelectCommand="SELECT [EmpID], [Name], [Concern], [Contact], [Location], [Date], [Status] FROM [Command]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 326px">&nbsp;</td>
                <td style="width: 858px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 326px">&nbsp;</td>
                <td style="width: 858px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 326px">&nbsp;</td>
                <td style="width: 858px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 326px">&nbsp;</td>
                <td style="width: 858px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 326px">&nbsp;</td>
                <td style="width: 858px">&nbsp;</td>
            </tr>
        </table>


    </div>
</asp:Content>
