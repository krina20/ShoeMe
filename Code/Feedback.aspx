<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

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
    <table class="auto-style1" border="1">
        <tr>
            <td class="auto-style1">
                Feed Back From</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="style6">
                    <tr>
                        <td class="auto-style2">
                            Name :</td>
                        <td>
                            <asp:TextBox ID="TextBox_name" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox_name" ErrorMessage="Please enter feedbackour name" ForeColor="#FF3300" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            Feedback :</td>
                        <td>
                            <asp:TextBox ID="TextBox_feedback" runat="server" CssClass="txt" Height="90px" 
                                TextMode="MultiLine" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBox_feedback" ErrorMessage="Please enter feedback" ForeColor="#FF3300" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button_send" runat="server" CssClass="button1" Text="Send Feedback" Width="154px" OnClick="Button_send_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
   </div>
</asp:Content>