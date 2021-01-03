<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="ViewDetails.aspx.cs" Inherits="ViewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 242px;
        }
        .auto-style2 {
            width: 394px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <div class="form">
        <asp:Label ID="lblans" runat="server" ForeColor="#FFFFFFF"></asp:Label>
        <p>
                    No of Products in your cart :<asp:Label ID="Label1" runat="server" ForeColor="#4CAF50"></asp:Label>
                    <a href="cart.aspx" style="font-size:16px;color:black">
                        Show Cart
                    </a>
        </p>
            
    <asp:DataList ID="DataList1" runat="server" DataKeyField="prod_code" DataSourceID="SqlDataSource1" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("images") %>' Width="200" height="200"/>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("details") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" Text="Size"></asp:Label>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label4" runat="server" Text="Rs."></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" Text="Quantity"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Add to Cart" CssClass="button1" CommandName="addtocart" CommandArgument='<%# Eval("prod_code") %>'/>
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoeMeDBConnectionString %>" SelectCommand="SELECT * FROM [ProductTbl] WHERE ([prod_code] = @prod_code)">
        <SelectParameters>
            <asp:QueryStringParameter Name="prod_code" QueryStringField="prod_code" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    </div>
</asp:Content>

