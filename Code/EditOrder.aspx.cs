using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditOrder : System.Web.UI.Page
{
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["sno"] != null)
            {
                dt = (DataTable)Session["buyitems"];

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    int sr;
                    int sr1;
                    sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                    Label_no.Text = Request.QueryString["sno"];
                    //Label_name.Text = sr.ToString();
                    sr1 = Convert.ToInt32(Label_no.Text);

                    if (sr == sr1)
                    {
                        Label_no.Text = dt.Rows[i]["sno"].ToString();
                        Label_name.Text = dt.Rows[i]["name"].ToString();
                        DropDownList_size.Text = dt.Rows[i]["Size"].ToString();
                        DropDownList1.Text = dt.Rows[i]["quantity"].ToString();
                        Label_price.Text = dt.Rows[i]["price"].ToString();
                        Label_total.Text = dt.Rows[i]["totalprice"].ToString();

                        break;

                    }
                }
            }

        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int q;
        q = Convert.ToInt32(DropDownList1.Text);
        int cost;
        cost = Convert.ToInt32(Label_price.Text);
        int totalcost;
        totalcost = cost * q;
        Label_total.Text = totalcost.ToString();
    }

    protected void Button_save_Click(object sender, EventArgs e)
    {
        dt = (DataTable)Session["buyitems"];


        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;
            sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());

            sr1 = Convert.ToInt32(Label_no.Text);

            if (sr == sr1)
            {
                dt.Rows[i]["sno"] = Label_no.Text;
                dt.Rows[i]["name"] = Label_name.Text;
                dt.Rows[i]["Size"] = DropDownList_size.Text;
                dt.Rows[i]["quantity"] = DropDownList1.Text;
                dt.Rows[i]["price"] = Label_price.Text;
                dt.Rows[i]["totalprice"] = Label_total.Text;
                dt.AcceptChanges();

                break;
            }
        }
        Response.Redirect("cart.aspx");
    }

    protected void DropDownList_size_SelectedIndexChanged(object sender, EventArgs e)
    {
        int p;
        p = Convert.ToInt32(DropDownList_size.Text);
    }
}