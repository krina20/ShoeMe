<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
 
    <div class="login-page">
        <div class="form">
            <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl="~/Project_images/admin.png" />
            <br />
                <asp:TextBox ID="TextBox_username" runat="server" placeholder="UserName" AutoComplete="off"></asp:TextBox>
                
                <asp:TextBox ID="TextBox_password" runat="server" placeholder="Password" TextMode="Password" MaxLength="10" AutoComplete="off"></asp:TextBox>

            <br />
                <asp:Button ID="login_btn" runat="server" Text="LOGIN" CssClass="button1" style="vertical-align:middle" OnClick="login_btn_Click">
                </asp:Button>      
            <br />
                
      
        </div>
    </div>

    </form>
</body>
</html>