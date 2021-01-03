using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button_sendMail_Click(object sender, EventArgs e)
    {
        //string mainconn = ConfigurationManager.ConnectionStrings["ShoeMe"].ConnectionString;
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);
        string query = "select Email,UserPassword from UserReg where Email=@Email";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@Email", TextBox_email.Text);
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            string username = sdr["Email"].ToString();
            string password = sdr["UserPassword"].ToString();

            MailMessage mm = new MailMessage("krinashah.1203@gmail.com", TextBox_email.Text);
            mm.Subject = "Password of ShoeMe.com";
            mm.Body = string.Format("Hey <h3>{0}</h3>,<br/> Your password is <h3>{1}</h3>.", username, password);
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;

            NetworkCredential nc = new NetworkCredential();
            nc.UserName = "krinashah.1203@gmail.com";
            nc.Password = "krina123123";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = nc;
            smtp.Port = 587; //587 is a port number for gmail IDs, port is an interger number.
            smtp.Send(mm);
            lblmsg.Text = "Your password has been sent to " + TextBox_email.Text;
            lblmsg.ForeColor = Color.Green;
        }
        else
        {
            lblmsg.Text = TextBox_email.Text + " is not stored in our database.";
            lblmsg.ForeColor = Color.Red;
        }
    }
}