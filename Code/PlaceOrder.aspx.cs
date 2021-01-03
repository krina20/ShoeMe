using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlaceOrder : System.Web.UI.Page
{
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("name");
            dt.Columns.Add("Size");
            dt.Columns.Add("price");
            dt.Columns.Add("images");
            dt.Columns.Add("quantity");
            dt.Columns.Add("totalprice");

            if (Request.QueryString["prod_code"] != null)
            {
                if (Session["Buyitems"] == null)
                {

                    dr = dt.NewRow();
                    string mainconn = DBConnection.DBPath(Server.MapPath("~"));
                    SqlConnection con = new SqlConnection(mainconn);
                    String myquery = "select * from ProductTbl where prod_code=" + Request.QueryString["prod_code"];
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = myquery;
                    cmd.Connection = con;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = 1;
                    dr["name"] = ds.Tables[0].Rows[0]["name"].ToString();
                    dr["Size"] = Request.QueryString["Size"];
                    dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                    dr["images"] = ds.Tables[0].Rows[0]["images"].ToString();
                    dr["quantity"] = Request.QueryString["quantity"];
                   
                    int price = Convert.ToInt16(ds.Tables[0].Rows[0]["price"].ToString());
                    int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                    int totalprice = price * quantity;
                    dr["totalprice"] = totalprice;

                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    Session["buyitems"] = dt;
                    GridView1.FooterRow.Cells[4].Text = "Total Amount";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                    Response.Redirect("cart.aspx");

                }
                else
                {

                    dt = (DataTable)Session["buyitems"];
                    int sr;
                    sr = dt.Rows.Count;

                    dr = dt.NewRow();

                    string mainconn = DBConnection.DBPath(Server.MapPath("~"));
                    SqlConnection con = new SqlConnection(mainconn);
                    String myquery = "select * from ProductTbl where prod_code=" + Request.QueryString["prod_code"];
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = myquery;
                    cmd.Connection = con;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = sr + 1;
                    dr["name"] = ds.Tables[0].Rows[0]["name"].ToString();
                    dr["Size"] = Request.QueryString["Size"];
                    dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                    dr["images"] = ds.Tables[0].Rows[0]["images"].ToString();
                    dr["quantity"] = Request.QueryString["quantity"];
                   
                    int price = Convert.ToInt16(ds.Tables[0].Rows[0]["price"].ToString());
                    int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                    int totalprice = price * quantity;
                    dr["totalprice"] = totalprice;
                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    Session["buyitems"] = dt;
                    GridView1.FooterRow.Cells[4].Text = "Total Amount";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                    Response.Redirect("cart.aspx");

                }
            }
            else
            {
                dt = (DataTable)Session["buyitems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[4].Text = "Total Amount";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();

                }


            }
            // Label2.Text = GridView1.Rows.Count.ToString();

        }
        Label3.Text = DateTime.Now.ToShortDateString();
        findorderid();

    }
    public int grandtotal()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        int nrow = dt.Rows.Count;
        int i = 0;
        int gtotal = 0;
        while (i < nrow)
        {
            gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

            i = i + 1;
        }
        return gtotal;
    }

    public void findorderid()
    {
        String pass = "abcdefghijklmnopqrstuvwxyz123456789";
        Random r = new Random();
        char[] mypass = new char[5];
        for (int i = 0; i < 5; i++)
        {
            mypass[i] = pass[(int)(35 * r.NextDouble())];

        }
        String orderid;
        orderid = "Order" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);

        Label2.Text = orderid;
    }
    public void saveaddress()
    {
        String updateadd = "insert into orderaddress(orderid,address,mobilenumber) values('" + Label2.Text + "','" + TextBox_address.Text + "','" + TextBox_mobno.Text + "')";
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);
        con.Open();
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = updateadd;
        cmd1.Connection = con;
        cmd1.ExecuteNonQuery();
        con.Close();
    }

    protected void Button_placeorder_Click(object sender, EventArgs e)
    {
        DataTable dt;
        dt = (DataTable)Session["buyitems"];
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);
        con.Open();

        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            String updatepass = "insert into orderdetails(orderid,sno,name,Size,price,quantity,dateoforder) values('" + Label2.Text + "'," + dt.Rows[i]["sno"] + ",'" + dt.Rows[i]["name"] + "'," + dt.Rows[i]["Size"] + ",'" + dt.Rows[i]["price"] + "'," + dt.Rows[i]["quantity"] + ",'" + Label3.Text + "')";
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = updatepass;
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
            
        }
        saveaddress();
        Response.Redirect("Bill.aspx?orderid=" + Label2.Text);

        con.Close();
    }
}