using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBConnection
/// </summary>
public class DBConnection
{
	
	public DBConnection()
	{
		
	}
	public static string DBPath(string mappath)
	{
		return "Data Source=(LocalDB)\\v11.0;AttachDbFilename="+mappath+"\\ShoeMeDB.mdf;Integrated Security=True;Connect Timeout=30";
	}
}