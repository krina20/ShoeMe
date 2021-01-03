using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            Label1.Text = Session["id"].ToString();
        }
        else
        {
            Response.Redirect("AdminChild.aspx");
        }
    }
  
    protected void Button_Add_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProduct.aspx");
    }
    protected void Button_Update_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateProduct.aspx");
    }
    protected void Button_Delete_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeleteProduct.aspx");
    }
    protected void Button_Logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("AdminLogin.aspx");
    }
}
