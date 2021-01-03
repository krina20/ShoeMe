<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUpPage.aspx.cs" Inherits="SignUpPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> ShoeMe</title>
    <style type="text/css">
        .rfv {
            padding-left:10px;
        color:#B50128;
        font-size:12px;
        font-family: Verdana, Tahoma, Arial;
        font-weight:bold;
        }
    </style>
    <%--<script src="https://apis.google.com/js/platform.js" async defer></script>--%>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    
           <div class="login-page">
                <div class="form">
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl="~/Project_images/signup.png" />
                <br />
                        <br />
                        <asp:TextBox ID="TextBox_name" runat="server" placeholder="Name" ForeColor="#7c7a7a" autocomplete="off"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_name" CssClass="rfv" ErrorMessage="Enter a Name"></asp:RequiredFieldValidator>
                        
                        <asp:TextBox ID="TextBox_email" runat="server" placeholder="Email ID" autocomplete="off" ForeColor="#7c7a7a"></asp:TextBox>  
                    <br />
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="TextBox_email" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_email" CssClass="rfv" ErrorMessage="Enter an Email ID"></asp:RequiredFieldValidator>
                    
                        <asp:TextBox ID="TextBox_contact" runat="server" placeholder="Contact Number" autocomplete="off" ForeColor="#7c7a7a"></asp:TextBox>
                    <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_contact" CssClass="rfv" ErrorMessage="Enter Contact Number"></asp:RequiredFieldValidator>

                        <br />
                        <asp:RadioButton ID="RadioButton_male" runat="server" Text="male" ForeColor="#7c7a7a" GroupName="gender"/>
                        &nbsp;&nbsp;
                    
                        <asp:RadioButton ID="RadioButton_female" runat="server" Text="female" ForeColor="#7c7a7a" GroupName="gender"/>
                    
                        <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password" MaxLength="10" placeholder="Password" ForeColor="#7c7a7a"></asp:TextBox>
                    <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password length must be between 5 to 10 characters" ControlToValidate="TextBox_password" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]{5,10}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox_password" CssClass="rfv" ErrorMessage="Enter a Password"></asp:RequiredFieldValidator>
                        
                        <asp:TextBox ID="TextBox_confpassword" runat="server" TextMode="Password" MaxLength="10" autocomplete="off" placeholder="Confirm Password" ForeColor="#7c7a7a"></asp:TextBox>
                    <br />    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_confpassword" CssClass="rfv" ErrorMessage="Confirm Passsword"></asp:RequiredFieldValidator>
                    <br />

                        <asp:Button ID="Button_create" runat="server" Text="CREATE" BackColor="#4CAF50" style="border-radius:10px;" ForeColor="#FFFFFFF" OnClick="Button_create_Click"/>
                        <br />    
                        <p class="message">
                            Already registered? 
                            <a href="LoginPage.aspx" style="color:black">
                                Log in
                            </a>
                        </p>
                    </div>
               </div>
    </form>
</body>
</html>
