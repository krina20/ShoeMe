using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["id"] != null)
        {
            lblans.Text = Session["id"].ToString();
            if (!IsPostBack)
            {
                string mainconn = DBConnection.DBPath(Server.MapPath("~"));
                SqlConnection con = new SqlConnection(mainconn);
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "Select * From ProductTbl";
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                GridView1.DataSource = sdr;
                GridView1.DataBind();
                con.Close();
            }
        }
        else
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }

    private void showData()
    {
        //string mainconn = ConfigurationManager.ConnectionStrings["ShoeMe"].ConnectionString;
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);
        GridView1.DataSourceID = null;
        GridView1.Columns.Clear();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        cmd.CommandText = "Select * From ProductTbl";
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();
    }

    protected void Button_update_Click(object sender, EventArgs e)
    {
        //string mainconn = ConfigurationManager.ConnectionStrings["ShoeMe"].ConnectionString;
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);

        string name = TextBox_name.Text.Trim();
        string filename = Image1.ImageUrl;
        string size = TextBox_size.Text.Trim();
        string details = TextBox_details.Text.Trim();
        string category = DropDownList_category.SelectedValue;
        string gender = string.Empty;
        string price = TextBox_price.Text.Trim();

        if (RadioButtonList1.Items[0].Selected == true)
        {

            gender = "Male";
        }

        else if (RadioButtonList1.Items[1].Selected == true)
        {
            gender = "Female";
        }
      
        con.Open();

        SqlCommand cmd = new SqlCommand("spUpdateProduct", con);
        cmd.CommandType = CommandType.StoredProcedure;


        cmd.Parameters.AddWithValue("@prod_code", Label_prodCode.Text);
        cmd.Parameters.AddWithValue("@name", TextBox_name.Text);
        cmd.Parameters.AddWithValue("@images", filename);
        cmd.Parameters.AddWithValue("@size", size); 
        cmd.Parameters.AddWithValue("@details", TextBox_details.Text);
        cmd.Parameters.AddWithValue("@category", category);
        cmd.Parameters.AddWithValue("@gender", gender);
        cmd.Parameters.AddWithValue("@price", TextBox_price.Text);
        
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Write("<script language='javascript'>window.alert('Product Updated');window.location='AdminChild.aspx';</script>");
        TextBox_name.Text = "";
        TextBox_details.Text = "";
        TextBox_price.Text = "";
        showData();
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Label_prodCode.Text = GridView1.SelectedRow.Cells[1].Text;
        TextBox_name.Text = GridView1.SelectedRow.Cells[2].Text;

        Image1.ImageUrl = GridView1.SelectedRow.Cells[3].Text;
        TextBox_size.Text = GridView1.SelectedRow.Cells[4].Text;
        TextBox_details.Text = GridView1.SelectedRow.Cells[5].Text;
        DropDownList_category.SelectedValue = GridView1.SelectedRow.Cells[6].Text;
        RadioButtonList1.SelectedValue = GridView1.SelectedRow.Cells[7].Text;
        TextBox_price.Text = GridView1.SelectedRow.Cells[8].Text;
    }
}