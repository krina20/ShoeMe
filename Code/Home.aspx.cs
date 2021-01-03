using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        //int cnt = (int)Session["count"];
        //int x = (int)Session["inc"];

        //if (Session["inc"] == null)
        //{
        //    x = 0;
        //}
        //Image1.ImageUrl = Session["" + x].ToString();

        //x++;
        //if (x == cnt)
        //{
        //    x = 0;
        //}
        //Session["inc"] = x;

        Label_timer.Text = DateTime.Now.ToString("HH:mm:ss");
    }
}