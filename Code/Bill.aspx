<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 32px;
        }
        .auto-style2 {
            height: 50px;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            height: 22px;
            text-align: left;
        }
        .auto-style5 {
            height: 90px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
        <div class="form">
     Order ID : <asp:Label ID="Label2" runat="server"></asp:Label>
     <br />
     <br />
    <asp:Button ID="Button_dwnld" runat="server" Text="Download Invoice" OnClick="Button_dwnld_Click" CssClass="button1"/>
            <asp:Panel ID="Panel1" runat="server">
     <table class="auto-style1" border="1">
         <tr>
             <td class="auto-style2">INVOICE</td>
         </tr>
         <tr>
             <td class="auto-style3">Order ID:&nbsp;
                 <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                 Order Date : <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
             </td>
         </tr>
         <tr>
             <td class="auto-style5">
                 <table class="auto-style1" border="1">
                     <tr>
                         <td class="auto-style4">Buyer Address:
                             <br /><asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                         </td>
                         <td class="auto-style4">Seller Address:
                             <br />
                             <asp:Label ID="Label6" runat="server" Text="ShoeMe Co.,Ahmedabad"></asp:Label>
                         </td>
                     </tr>
                 </table>
             </td>
         </tr>
         <tr>
             <td class="auto-style2">
                 <asp:GridView ID="GridView1" runat="server" Width="675px" AutoGenerateColumns="False">
                     <Columns>
                         <asp:BoundField DataField="sno" HeaderText="S.No.">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="name" HeaderText="Product Name">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Size" HeaderText="Size" />
                         <asp:BoundField DataField="quantity" HeaderText="Quantity">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="price" HeaderText="Price">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="totalprice" HeaderText="Total Amount">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                     </Columns>
                 </asp:GridView>
             </td>
         </tr>
         <tr>
             <td class="auto-style2">Grand Total :&nbsp;
                 <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
             </td>
         </tr>
         <tr>
             <td class="auto-style4">Disclaimer : This is computer generated invoice and does not required signature.</td>
         </tr>
     </table>
                </asp:Panel>
            </div>
</asp:Content>

