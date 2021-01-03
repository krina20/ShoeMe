using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteProduct : System.Web.UI.Page
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

    private void Search()
    {
        string mainconn = ConfigurationManager.ConnectionStrings["ShoeMe"].ConnectionString;
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

    protected void Button_delete_Click1(object sender, EventArgs e)
    {
        string mainconn = ConfigurationManager.ConnectionStrings["ShoeMe"].ConnectionString;
        SqlConnection con = new SqlConnection(mainconn);
        con.Open();

        SqlCommand cmd = new SqlCommand("spDeleteProduct", con);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("@name", DropDownList_name.SelectedItem.Text.Trim());
        cmd.Parameters.AddWithValue("@name", Label_name.Text.Trim());
        cmd.ExecuteNonQuery();

        con.Close();
        Response.Write("<script language='javascript'>window.alert('Product deleted');window.location='AdminChild.aspx';</script>");
        Search();
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Label_prodCode.Text = GridView1.SelectedRow.Cells[1].Text;
        Label_name.Text = GridView1.SelectedRow.Cells[2].Text;
        Label_image.Text = GridView1.SelectedRow.Cells[3].Text;
        Label_size.Text = GridView1.SelectedRow.Cells[4].Text;
        Label_details.Text = GridView1.SelectedRow.Cells[5].Text;
        Label_category.Text = GridView1.SelectedRow.Cells[6].Text;
        Label_gender.Text = GridView1.SelectedRow.Cells[7].Text;
        Label_price.Text = GridView1.SelectedRow.Cells[8].Text;
    }
}