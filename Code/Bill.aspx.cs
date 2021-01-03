using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Bill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = Request.QueryString["orderid"];
        Label3.Text = Label2.Text;
        findorderdate(Label3.Text);
        findaddress(Label3.Text);
        showgrid(Label3.Text);
    }
    protected void Button_dwnld_Click(object sender, EventArgs e)
    {
        ExportPdf();
    }
    private void ExportPdf()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter(); //whole table/gridview in SW
        HtmlTextWriter hw = new HtmlTextWriter(sw); //attached with the StringBuilder
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc); 
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr); //parse html available inside the string
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
    private void findorderdate(String Orderid)
    {
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);
        String myquery = "Select * from orderdetails where orderid='" + Orderid+"'";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Label4.Text = ds.Tables[0].Rows[0]["dateoforder"].ToString();
        }
        con.Close();
     }

    private void findaddress(String Orderid)
    {
        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);
        String myquery = "Select * from orderaddress where orderid='" + Orderid + "'";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Label5.Text = ds.Tables[0].Rows[0]["address"].ToString();

        }

        con.Close();
    }

    private void showgrid(String orderid)
    {
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add("sno");
        dt.Columns.Add("name");
        dt.Columns.Add("Size");
        dt.Columns.Add("price");
        dt.Columns.Add("quantity");
        dt.Columns.Add("totalprice");

        string mainconn = DBConnection.DBPath(Server.MapPath("~"));
        SqlConnection con = new SqlConnection(mainconn);
        String myquery = "select * from orderdetails where orderid='" + orderid + "'";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        int totalrows = ds.Tables[0].Rows.Count;
        int i = 0;
        int grandtotal = 0;
        while (i < totalrows)
        {
            dr = dt.NewRow();
            dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
            dr["name"] = ds.Tables[0].Rows[i]["name"].ToString();
            dr["Size"] = ds.Tables[0].Rows[i]["Size"].ToString();
            dr["quantity"] = ds.Tables[0].Rows[i]["quantity"].ToString();
            dr["price"] = ds.Tables[0].Rows[i]["price"].ToString();
            int price = Convert.ToInt16(ds.Tables[0].Rows[i]["price"].ToString());
            int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["quantity"].ToString());
            int totalprice = price * quantity;
            dr["totalprice"] = totalprice;
            grandtotal = grandtotal + totalprice;
            dt.Rows.Add(dr);
            i = i + 1;
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();

        Label7.Text = grandtotal.ToString();
    }
} 