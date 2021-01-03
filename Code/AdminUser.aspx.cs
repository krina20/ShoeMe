using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
    protected void Admin_btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminLogin.aspx");
    }
    protected void User_btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }
}