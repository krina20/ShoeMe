<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
        <div class="form">
             <asp:Label ID="lblans" runat="server" ForeColor="#FFFFFFF"></asp:Label>
            <p>
                    <a href="CustomerChild.aspx" style="font-size:16px;color:black">
                        Continue Shopping
                    </a>
                
                    No. of Products in your cart :<asp:Label ID="Label1" runat="server" ForeColor="#e6f7d2"></asp:Label>
                    <a href="cart.aspx" style="font-size:16px;color:black">
                        Show Cart
                    </a>
        </p>
            
        <asp:Label ID="Label_cart" runat="server" Text="Cart" CssClass="message"></asp:Label>
        <br />
        <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#4CAF50" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="sno" HeaderText="S.No">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="Product Name">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Size" HeaderText="Size" >
                    <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="Price">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="images" HeaderText="Image" ControlStyle-Height="200">
<ControlStyle Height="200px"></ControlStyle>

                        <ItemStyle HorizontalAlign="Center"/>
                    </asp:ImageField>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="totalprice" HeaderText="Total Amount">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField SelectText="Modify" ShowSelectButton="True" />
                    <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
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
            <asp:Button ID="Button_checkout" runat="server" Text="CHECKOUT" CssClass="button1" OnClick="Button_checkout_Click"/>
      </div>
</asp:Content>

