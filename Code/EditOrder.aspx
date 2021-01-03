<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="EditOrder.aspx.cs" Inherits="EditOrder" %>

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
            <td>S.No.</td>
            <td>
                <asp:Label ID="Label_no" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Name</td>
            <td class="auto-style2">
                <asp:Label ID="Label_name" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Size</td>
            <td>
                <asp:DropDownList ID="DropDownList_size" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_size_SelectedIndexChanged">
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
            <td>Price</td>
            <td>
                <asp:Label ID="Label_price" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Quantity</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Total Price</td>
            <td>
                <asp:Label ID="Label_total" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button_save" runat="server" Text="SAVE" CssClass="button1" OnClick="Button_save_Click"/>
            </td>
        </tr>
    </table>
        </div>
</asp:Content>

