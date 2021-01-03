using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Feedback : System.Web.UI.Page
{       
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_send_Click(object sender, EventArgs e)
    {
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);

        string name = TextBox_name.Text.Trim();
        string feedback = TextBox_feedback.Text.Trim();

        SqlCommand cmd = new SqlCommand("spFeedback", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@feedback", feedback);

        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();
        Response.Write("<script language='javascript'>window.alert('Thank you for your feedback');window.location='Home.aspx';</script>");

                
    }
}