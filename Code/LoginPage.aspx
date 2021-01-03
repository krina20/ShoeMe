<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

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
            <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl="~/Project_images/user.png" />
            <br />
            <br />
                <asp:TextBox ID="TextBox_email" runat="server" placeholder="Email Id"></asp:TextBox>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="TextBox_email" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter username first." ControlToValidate="TextBox_email" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br/>
                <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password" MaxLength="10" placeholder="Password" autocomplete="off"></asp:TextBox>
                    <br/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password length must be between 5 to 10 characters" ControlToValidate="TextBox_password" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]{5,10}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter password first." ControlToValidate="TextBox_password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br/>
                <asp:Button ID="login_btn" runat="server" Text="Login" BackColor="#4CAF50" ForeColor="#FFFFFF" style="border-radius:10px;" OnClick="login_btn_Click"/>
                <br />    
              
                <br/>

            <p class="message">
                    <a href="ForgotPassword.aspx" style="font-size:16px;color:black">
                        Forgot Password?
                    </a>
                </p>
      
                <p class="message">
                    Not Registered?
                    <a href="SignUpPage.aspx" style="font-size:16px;color:black">
                        Create an account
                    </a>
                </p>
      
        </div>
    </div>

    </form>
</body>
</html>
