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

public partial class VendorMasterView : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            LoadVendorAddress();
        
        }


    }

    public void LoadVendorAddress()
    {

        string Query = "SELECT * FROM VENDORMASTER   ORDER BY VENDORNAME ASC";

        Dt = SqlObj.GetData_DT(Query);
        grdVendorMasterView.DataSource = Dt;
        grdVendorMasterView.DataBind();    
    
    }




    protected void grdVendorMasterView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        grdVendorMasterView.EditIndex = -1;
        LoadVendorAddress();

    }
    protected void grdVendorMasterView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void grdVendorMasterView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        GridViewRow grvRow = (GridViewRow)grdVendorMasterView.Rows[e.RowIndex];
        Label lblDeleteId = (Label)grvRow.FindControl("lblVId");
        string Query = "delete from VENDORMASTER where VID='" + lblDeleteId.Text + "'";
        SqlObj.ExecuteNonQuery(Query);
        LoadVendorAddress();

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Vendor Item Deleted!');location.href='VendorMasterView.aspx'", true);
     

    }
    protected void grdVendorMasterView_RowEditing(object sender, GridViewEditEventArgs e)
    {

        grdVendorMasterView.EditIndex = e.NewEditIndex;
        LoadVendorAddress();
    }
    protected void grdVendorMasterView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        GridViewRow grvRow = (GridViewRow)grdVendorMasterView.Rows[e.RowIndex];
        Label lbl = (Label)grvRow.FindControl("lblVId");
        TextBox TxtVendorName = (TextBox)grvRow.FindControl("txtVendorName");
        TextBox TxtAutority = (TextBox)grvRow.FindControl("txtAuthority");
        TextBox TxtAddr1 = (TextBox)grvRow.FindControl("txtAddr1");
        TextBox TxtAddr2 = (TextBox)grvRow.FindControl("txtAddr2");
        TextBox TxtPlace = (TextBox)grvRow.FindControl("txtPlace");
        TextBox TxtPincode = (TextBox)grvRow.FindControl("txtPinCode");
        grdVendorMasterView.EditIndex = -1;
        string Query = "Update VENDORMASTER set AUTHORITYNAME='" + TxtAutority.Text + "', VENDORNAME='" + TxtVendorName.Text + "',ADDR1='" + TxtAddr1.Text + "',ADDR2='" + TxtAddr2.Text + "',PLACE='" + TxtPlace.Text + "',PINCODE='" + TxtPincode.Text + "' where VID='" + lbl.Text + "' ";
        SqlObj.ExecuteNonQuery(Query);
        LoadVendorAddress();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Vendor Item Updated!');location.href='VendorMasterView.aspx'", true);

    }
     





}


