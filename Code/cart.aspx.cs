using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
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
                if (Session["buyitems"] == null)
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
                    GridView1.FooterRow.Cells[5].Text = "Total Amount";
                    GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
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
                    dr["sno"] = sr+1;
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
                    GridView1.FooterRow.Cells[5].Text = "Total Amount";
                    GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                }
            }
            else
            {
                dt = (DataTable)Session["buyitems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[5].Text = "Total Amount";
                    GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                }
            }
            Label1.Text = GridView1.Rows.Count.ToString();

        }
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];


        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;
            string qdata;
            string dtdata;
            sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
            TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
            qdata = cell.Text ;
            dtdata = sr.ToString();
            sr1 = Convert.ToInt32(qdata);

            if (sr == sr1)
            {
                dt.Rows[i].Delete();
                dt.AcceptChanges();
                //Label1.Text = "Item Has Been Deleted From Shopping Cart";
                break;
            }
        }

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            dt.Rows[i - 1]["sno"] = i;
            dt.AcceptChanges();
        }
        Session["buyitems"] = dt;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("EditOrder.aspx?sno=" + GridView1.SelectedRow.Cells[0].Text);
    }
    protected void Button_checkout_Click(object sender, EventArgs e)
    {
        Response.Redirect("PlaceOrder.aspx");
    }
}