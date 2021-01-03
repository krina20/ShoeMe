<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShoeMe.com</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="form">
    <p class="message"> Enter your email ID:
        <asp:TextBox ID="TextBox_email" runat="server" ForeColor="#4CAF50" style="border-radius:10px;"></asp:TextBox>
        <asp:Button ID="Button_sendMail" runat="server" Text="Send Mail" BackColor="#4CAF50" ForeColor="#FFFFFFF" style="border-radius:10px;" OnClick="Button_sendMail_Click"/>
        <br />
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
       </p>
        <p class="message">
                 <a href="LoginPage.aspx" style="color:black">
                        BACK
                 </a>
        </p> 
    </div>
    </form>
</body>
</html>
