using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerChild : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
        
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "ViewDetails")
        {
            Response.Redirect("ViewDetails.aspx?prod_code=" + e.CommandArgument.ToString());
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("cart.aspx");
    }
}