<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="CustomerChild.aspx.cs" Inherits="CustomerChild" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 44px;
        }
        .auto-style3 {
            height: 48px;
        }
        .auto-style4 {
            height: 58px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

     <div class="form">
         <asp:ImageButton ID="ImageButton2" runat="server" ImageAlign="Right" CssClass="imageButton" ImageUrl="~/Project_images/cart.png" Width="68px" Height="49px" OnClick="ImageButton2_Click"/>      
         <asp:Label ID="lblans" runat="server" ForeColor="#FFFFFFF"></asp:Label>        
         <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" Width="714px" OnItemCommand="DataList1_ItemCommand">
             <ItemTemplate>
                 <table class="auto-style1">
                     <tr>
                         <td class="auto-style2">
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style3">
                             <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("images") %>' width="100" Height="100" CommandName="ViewDetails" CommandArgument='<%# Eval("prod_code") %>'/>
                         </td>
                         
                     </tr>
                 </table>
             </ItemTemplate>
         </asp:DataList>
           
         <br />
         <br />
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoeMeDBConnectionString %>" SelectCommand="SELECT * FROM [ProductTbl]"></asp:SqlDataSource>
    </div>
</asp:Content>

