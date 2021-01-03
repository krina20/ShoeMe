using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            lblans.Text = Session["id"].ToString();
        }
        else
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
   
    protected void Button_add_Click(object sender, EventArgs e)
    {
        try
        {
            //string mainconn = ConfigurationManager.ConnectionStrings["ShoeMe"].ConnectionString;
            string mainconn = DBConnection.DBPath(Server.MapPath("~"));
            SqlConnection con = new SqlConnection(mainconn);

            string name = TextBox_name.Text.Trim();
            string filename = Path.GetFileName(FileUpload1.FileName);
            string size = "";
            string details = TextBox_details.Text.Trim();
            string category = DropDownList_category.SelectedValue;
            string gender = "";
            string price = TextBox_price.Text.Trim();

            if (RadioButtonList1.Items[0].Selected == true)
            {
                gender = "Male";
            }

            else if (RadioButtonList1.Items[1].Selected == true)
            {
                gender = "Female";
            }


            foreach (ListItem lst in CheckBoxList_size.Items)
            {
                if (lst.Selected == true)
                {
                    size += "," + lst.Value;
                }
            }
                
                SqlCommand cmd = new SqlCommand("spAddProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;

                FileUpload1.SaveAs(Server.MapPath("~/Image/" + filename));

                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@images", "Image/"+filename);
                cmd.Parameters.AddWithValue("@size", size);
                cmd.Parameters.AddWithValue("@details", details);
                cmd.Parameters.AddWithValue("@category", category);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@price", price);
                con.Open();
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script language='javascript'>window.alert('Product added');window.location='AdminChild.aspx';</script>");

        }
        catch (Exception ex)
        {
            Console.Write(ex.ToString());
        }
    }
    protected void Button_back_Click1(object sender, EventArgs e)
    {
        Response.Redirect("AdminChild.aspx");
    }
}