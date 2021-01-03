using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUpPage : System.Web.UI.Page
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
    protected void Button_create_Click(object sender, EventArgs e)
    {
        string name = TextBox_name.Text.Trim();
        string email = TextBox_email.Text.Trim();
        string contact = TextBox_contact.Text.Trim();
        string gender = string.Empty;
        string password = TextBox_password.Text.Trim();

        if (TextBox_password.Text == TextBox_confpassword.Text)
        {
            if (RadioButton_male.Checked)
            {
                gender = "M";
            }
            else if (RadioButton_female.Checked)
            {
                gender = "F";
            }
            //string mainconn = ConfigurationManager.ConnectionStrings["ShoeMe"].ConnectionString;
            string mainconn = DBConnection.DBPath(Server.MapPath("~"));
            SqlConnection con = new SqlConnection(mainconn);

            SqlCommand cmd = new SqlCommand("insert into UserReg(Name,Email,ContactNo,Gender,UserPassword) values (@Name,@Email,@ContactNo,@Gender,@UserPassword)");

            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@ContactNo", contact);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@UserPassword", password);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            TextBox_name.Text = "";
            TextBox_email.Text = "";
            TextBox_contact.Text = "";
            RadioButton_male.Checked = false;
            RadioButton_female.Checked = false;
            TextBox_password.Text = "";
            TextBox_confpassword.Text = "";

            Response.Write("<script language='javascript'>window.alert('Account Created');window.location='Home.aspx';</script>");

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Passwords do not match');", true);
        }
    }
}