using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        if (dt != null)
        {

            Label1.Text = dt.Rows.Count.ToString();
        }
        else
        {
            Label1.Text = "0";
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "addtocart")
        {
            DropDownList dlist1 = (DropDownList)(e.Item.FindControl("DropDownList1"));
            DropDownList dlist2 = (DropDownList)(e.Item.FindControl("DropDownList2"));
            Response.Redirect("cart.aspx?prod_code=" + e.CommandArgument.ToString() + "&quantity=" + dlist1.SelectedItem.ToString() + "&Size=" + dlist2.SelectedItem.ToString());
        }
    }
}