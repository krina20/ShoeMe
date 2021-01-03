using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    if (Request.Cookies["Email"] != null && Request.Cookies["Pwd"] != null)
        //    {
        //        TextBox_username.Text = Request.Cookies["username"].Value;
        //        TextBox_password.Attributes["value"] = Request.Cookies["password"].Value;
        //    }
        //}
    }
    protected void login_btn_Click(object sender, EventArgs e)
    {
        //string mainconn = ConfigurationManager.ConnectionStrings["ShoeMe"].ConnectionString;
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);
        SqlCommand cmd = new SqlCommand("select * from  AdminTbl where username=@username and password=@password", con);
        cmd.Parameters.AddWithValue("username", TextBox_username.Text);
        cmd.Parameters.AddWithValue("password", TextBox_password.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        if (dt.Rows.Count > 0)
        {
            Session["id"] = TextBox_username.Text;
            Response.Redirect("AdminChild.aspx");
            Session.RemoveAll();
        }
        else if (dt.Rows.Count == 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Enter username and password first');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Uswrname and Password do not match');", true);
        }
    }
}