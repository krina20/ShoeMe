<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="DeleteProduct.aspx.cs" Inherits="DeleteProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
        <div class="form">
        <asp:Label ID="Label_DeleteProduct" runat="server" Text="Delete Product" CssClass="message"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AutoGenerateSelectButton="True">
            </asp:GridView>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Code: ">  </asp:Label>
        <asp:Label ID="Label_prodCode" runat="server" Text="" ForeColor="#4CAF50"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Name: ">  </asp:Label>
             <asp:Label ID="Label_name" runat="server" Text="" ForeColor="#4CAF50"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Image: ">  </asp:Label>
            <asp:Label ID="Label_image" runat="server" Text="" ForeColor="#4CAF50"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Size: ">  </asp:Label>
            <asp:Label ID="Label_size" runat="server" Text="" ForeColor="#4CAF50"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Details: ">  </asp:Label>
            <asp:Label ID="Label_details" runat="server" Text="" ForeColor="#4CAF50"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Category: ">  </asp:Label>
            <asp:Label ID="Label_category" runat="server" Text="" ForeColor="#4CAF50"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Gender: ">  </asp:Label>
            <asp:Label ID="Label_gender" runat="server" Text="" ForeColor="#4CAF50"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Price: ">  </asp:Label>
            <asp:Label ID="Label_price" runat="server" Text="" ForeColor="#4CAF50"></asp:Label>
            <br />
            <br />
        <asp:Button ID="Button_delete" runat="server" Text="Delete Product" style="border-radius:10px;" BackColor="#4CAF50" ForeColor="#FFFFFFF" OnClick="Button_delete_Click1" />
            <br />
            <asp:Label ID="lblans" runat="server" Text="" ForeColor="white">  </asp:Label>
            </div>
          
</asp:Content>