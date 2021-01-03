<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function display(event) {
            var output = document.getElementById('ContentPlaceHolder1_Image1');
            output.src = URL.createObjectURL(event.target.files[0]);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
     <div class="form">
         <asp:Label ID="Label_UpdateProduct" runat="server" Text="Update Product" CssClass="message"></asp:Label>
            <br />
         <br />
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AutoGenerateSelectButton="True">
            </asp:GridView>
            <br />
    
    <br />
    <asp:Label ID="Label1" runat="server" Text="Product Code: ">  </asp:Label>
    <asp:Label ID="Label_prodCode" runat="server" Text="" ForeColor="#4CAF50"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="TextBox_name" runat="server" placeholder="Product Name" AutoComplete="off" ForeColor="#4CAF50"></asp:TextBox>
    <br />
    <br />
   <%--<asp:FileUpload ID="FileUpload1" runat="server" onchange="display(event);" accept=".jpg,.jpeg,.gif"/>--%>
    <br />
    <asp:Image ID="Image1" runat="server" Height="125px" Width="125px" />
    <br />
    <br />
    <asp:TextBox ID="TextBox_size" runat="server" placeholder="Product Size" AutoComplete="off" ForeColor="#4CAF50"></asp:TextBox> 
    <br />
    <br />
    <asp:TextBox ID="TextBox_details" runat="server" placeholder="Product Details" AutoComplete="off" ForeColor="#4CAF50"></asp:TextBox>
    <br />
    <br />
   <asp:DropDownList ID="DropDownList_category" runat="server" placeholder="Product Category" required="" CssClass="DropDownList">
        <asp:ListItem Value="Sport Shoes ">Sport Shoes</asp:ListItem>
        <asp:ListItem>Casual Shoes</asp:ListItem>
        <asp:ListItem>Formal Shoes</asp:ListItem>
        <asp:ListItem>Sandals &amp; Floaters</asp:ListItem>
        <asp:ListItem>Socks</asp:ListItem>
        <asp:ListItem>Flats</asp:ListItem>
        <asp:ListItem>Heels</asp:ListItem>
        <asp:ListItem>Boots</asp:ListItem>
    </asp:DropDownList>
    <br />
         <br />
         <asp:RadioButtonList ID="RadioButtonList1" runat="server" ValidationGroup="gender" RepeatDirection="Horizontal"  RepeatLayout="Flow" CssClass="radio">
             <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
             <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
         </asp:RadioButtonList>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <%--<asp:TextBox ID="TextBox_quantity" runat="server" placeholder="Quantity" AutoComplete="off" ForeColor="#4CAF50"></asp:TextBox>--%>
    <br />
    <br />
    <asp:TextBox ID="TextBox_price" runat="server" placeholder="Price" AutoComplete="off" ForeColor="#4CAF50"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button_update" runat="server" Text="Update Product" BackColor="#4CAF50" ForeColor="#FFFFFFF" OnClick="Button_update_Click" />
    <br />
    <asp:Label ID="lblans" runat="server" Text="Label" ForeColor="#FFFFFF"></asp:Label>
         </div>
</asp:Content>

