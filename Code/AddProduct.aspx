<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

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
        <asp:Label ID="Label_AddProduct" runat="server" Text="Add Product" CssClass="message"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="TextBox_name" runat="server" placeholder="Product Name" ForeColor="#4CAF50" AutoComplete="off"></asp:TextBox>
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" placeholder="Upload Image" ForeColor="#4CAF50" onchange="display(event);" accept=".jpg, .jpeg, .gif"/>
            <br />
            <asp:Label ID="Label1" runat="server" CssClass="message"></asp:Label>
            <br />
            <br />
        <asp:Image ID="Image1" runat="server" Hight="125px" Width="158px" Height="188px"/>
        
        &nbsp;<br />
        <asp:Label ID="Label_Size" runat="server" Text="Select Size" CssClass="message"></asp:Label>
        <asp:CheckBoxList ID="CheckBoxList_size" runat="server" CssClass="CheckBoxList" CellSpacing="5" RepeatDirection="Horizontal" CellPadding="1" Height="95px" Width="400px">
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
        </asp:CheckBoxList>
        <asp:TextBox ID="TextBox_details" runat="server" placeholder="Product Details" AutoComplete="off" ForeColor="#4CAF50"></asp:TextBox>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList_category" runat="server" placeholder="Product Category" CssClass="DropDownList">
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
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" ValidationGroup="gender" RepeatDirection="Horizontal"  RepeatLayout="Flow" CssClass="radio">
             <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
             <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
         </asp:RadioButtonList>
        <br />
        <br />
        <%--<asp:TextBox ID="TextBox_quantity" runat="server" placeholder="Product Quantity" AutoComplete="off" ForeColor="#4CAF50"></asp:TextBox>
        <br />
        <br />
        --%><asp:TextBox ID="TextBox_price" runat="server" placeholder="Product Price" AutoComplete="off" ForeColor="#4CAF50" ></asp:TextBox>
            <br />
            <br />
        <asp:Button ID="Button_add" runat="server" Text="ADD" CssClass="button2" OnClick="Button_add_Click"/>
            <br />
            <br />
        <asp:Button ID="Button_back" runat="server" Text="BACK" CssClass="button2" OnClick="Button_back_Click1"/>
             <asp:Label ID="lblans" runat="server" ForeColor="#FFFFFFF"></asp:Label>

        </div>

  
</asp:Content>

