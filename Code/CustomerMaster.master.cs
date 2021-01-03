using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["cust"] != null)
        //{
        //    lblans.Text = Session["cust"].ToString();
        //}
        //else
        //{
        //    Response.Redirect("LoginPage.aspx");
        //}

    }

    protected void Button_men_Click(object sender, EventArgs e)
    {
        Response.Redirect("Men.aspx");
    }
    protected void Button_women_Click(object sender, EventArgs e)
    {
        Response.Redirect("Women.aspx");
    }
    protected void Button_Logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("loginpage.aspx");
    }
    protected void Button_children_Click(object sender, EventArgs e)
    {
        Response.Redirect("Children.aspx");
    }
    protected void Button_home_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void Button_products_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerChild.aspx");
    }
    protected void Button_feedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Feedback.aspx");
    }
    protected void Button_signup_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUpPage.aspx");
    }
}
