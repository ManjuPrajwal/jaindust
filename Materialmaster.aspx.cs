using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Data.SqlClient;

using System.Globalization;
using CLS_BL;
using CLS_DL;

public partial class Materialmaster : System.Web.UI.Page
{

    int K = 0;
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {

        PLobj.MaterialName = txtMaterialName.Text;
        PLobj.HSNCode = txtHSNCode.Text;
       _INS = objBL.InsertMaterialMaster(PLobj);
        if (_INS > 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Record Saved Successfully !');location.href='Materialmaster.aspx'", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Failed !')", true);
        }


    }
}