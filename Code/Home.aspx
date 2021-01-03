<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <div class="form">
    <marquee behaviour ="repeat" direction="left">
            <b>
                WELCOME TO SHOEME!     
            EXPECT THE UNEXPECTED!!!!!!!
                </b></marquee>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="Label_timer" runat="server" BackColor="#FFF666"></asp:Label>
                            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                            <br />
                            <asp:Image ID="Image1" runat="server" width="200"/>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        </div>
</asp:Content>