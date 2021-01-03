<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminUser.aspx.cs" Inherits="AdminUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> ShoeMe</title>

    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
         
    <div class="login-page">
        <div class="form">
           
                <p class="message" style="font-size:20px;">
                    Login as...</p>
                    <br />
            <br />
                <br />
            <asp:Button ID="Admin_btn" runat="server" Text="Admin" CssClass="button1" OnClick="Admin_btn_Click" Width="83px" />
                    <br />
                    
               
            <asp:Button ID="User_btn" runat="server" Text="User" CssClass="button1" OnClick="User_btn_Click" Width="83px" />

        </div>
    </div>

    </form>
</body>
</html>
