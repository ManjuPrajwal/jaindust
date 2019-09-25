using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CLS_BL;
using CLS_DL;

public partial class Loginpage : System.Web.UI.Page
{
    string ChkValue = string.Empty;
    SQLDB SqlObj = new SQLDB();
    protected void Page_Load(object sender, EventArgs e)
    {

        Session["UserName"] = txtUserName.Text;


    }


    public void UserNamechk()
    {
        ChkValue = SqlObj.ExecuteScalar("select [USERNAME] from [USERMASTER] where USERNAME='" + txtUserName.Text + "' AND PASSWORD='" + txtPassword.Text + "' ");

        if (ChkValue != "")
        {
            //Server.Transfer("");
            Response.Redirect("DashBoard.aspx");
            Session["UserName"] = ChkValue;


        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", " alert('Invalid User ');location.href='Loginpage.aspx'", true);
        }
       
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
         UserNamechk();
    }
}