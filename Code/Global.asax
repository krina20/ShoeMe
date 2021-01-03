<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        string fpath = Server.MapPath("~/Image");
        string[] files = System.IO.Directory.GetFiles(fpath);
        System.IO.FileInfo fi;
        Session["inc"] = 0;
        int x = 0;
        foreach (string s in files)
        {
            fi = new System.IO.FileInfo(s);
            Session["" + x] = "Image/" + fi.Name;
            x++;
        }
        Session["count"] = x - 1;
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>