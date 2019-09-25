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

public partial class VendorMaster : System.Web.UI.Page
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
        PLobj.AuthorityName = txtAuthority.Text;
        PLobj.VendorName = txtVendorName.Text;
        PLobj.Addr1 = txtAdd1.Text;
        PLobj.Addr2 = txtAdd2.Text;
        PLobj.Place = txtPlace.Text;
        PLobj.Pincode = txtPincode.Text;
        PLobj.Enteredby = "Karthik";


        _INS = objBL.InsertVendorMaster(PLobj);


        if (_INS > 0)
        {
        
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Record Saved Successfully !');location.href='VendorMaster.aspx'", true);
            txtAuthority.Text = "";
            txtPincode.Text = "";
            txtPlace.Text = "";
            txtVendorName.Text = "";
            txtAdd1.Text = "";
            txtAdd2.Text = "";

            
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Failed !')", true);
        }


    }

}
