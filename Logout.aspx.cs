using System;
using System.Collections.Generic;
using System.Linq;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected override void OnLoad(System.EventArgs e)
    {
        base.OnLoad(e);
        Session.RemoveAll();
        Session.Clear();
        Session.Abandon();
        FormsAuthentication.SignOut();
        Response.Redirect("Loginpage.aspx");
        
    }


}