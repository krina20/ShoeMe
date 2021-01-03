<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
        <div class="form">
   <asp:Label ID="lblans" runat="server" ForeColor="#FFFFFFF"></asp:Label>
    <table class="auto-style1">
        <tr>
            <td>Order ID</td>
            <td>
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Order Date</td>
            <td>
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#4CAF50" BorderStyle="Double" BorderWidth="3px" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="S.No." />
            <asp:BoundField DataField="name" HeaderText="Product Name" />
            <asp:BoundField DataField="Size" HeaderText="Size" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:ImageField DataImageUrlField="images" HeaderText="Image" ControlStyle-Height="200" ControlStyle-Width="200">
                <ControlStyle Height="200px" Width="200px" />
            </asp:ImageField>
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="totalprice" HeaderText="Total Amount" />
        </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#4CAF50" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Enter your Address</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox_address" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter address first." ControlToValidate="TextBox_address" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Mobile Number</td>
                    <td>
                        <asp:TextBox ID="TextBox_mobno" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter mobile number first." ControlToValidate="TextBox_mobno" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <br />
            <br />

            <asp:Button ID="Button_placeorder" runat="server" Text="PLACE ORDER" CssClass="button1" OnClick="Button_placeorder_Click"/>
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" Width="350px"/>
            </div>
</asp:Content>