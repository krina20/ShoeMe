using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["Email"] != null && Request.Cookies["UserPassword"] != null)
            {
                TextBox_email.Text = Request.Cookies["Email"].Value;
                TextBox_password.Attributes["value"] = Request.Cookies["UserPassword"].Value;
            }
        }
    }
    protected void login_btn_Click(object sender, EventArgs e)
    {
        //string mainconn = ConfigurationManager.ConnectionStrings["ShoeMe"].ConnectionString;
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));

        SqlConnection con = new SqlConnection(mainconn);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from UserReg where Email=@Email and UserPassword=@UserPassword",con);
        cmd.Parameters.AddWithValue("Email", TextBox_email.Text);
        cmd.Parameters.AddWithValue("UserPassword", TextBox_password.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        
        cmd.ExecuteNonQuery();
        con.Close();
        if (dt.Rows.Count > 0)
        {
            Session["cust"] = TextBox_email.Text;

            Response.Write("<script language='javascript'>window.alert('Welcome to ShoeMe');window.location='Home.aspx';</script>");
            Session.RemoveAll();
        }
        else if (dt.Rows.Count == 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Enter email and password first');", true);
        }
        else
        {
            Response.Write("<script language='javascript'>window.alert('Email or Password is wrong.');window.location='LoginPage.aspx';</script>");
        }

    }
}