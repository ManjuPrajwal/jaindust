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


public partial class MaterialView : System.Web.UI.Page
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
            LoadMaterialMaster();
        }

    }


    protected void grdMaterialView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        grdMaterialView.EditIndex = -1;
        LoadMaterialMaster();

    }
    protected void grdMaterialView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void grdMaterialView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        GridViewRow grvRow = (GridViewRow)grdMaterialView.Rows[e.RowIndex];
        Label lblDeleteId = (Label)grvRow.FindControl("lblId");
        string Query = "delete from MATERIALMASTER where ID='" + lblDeleteId.Text + "'";
        SqlObj.ExecuteNonQuery(Query);
        LoadMaterialMaster();

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Material Master Item Deleted!');location.href='MaterialView.aspx'", true);

    }
    protected void grdMaterialView_RowEditing(object sender, GridViewEditEventArgs e)
    {

        grdMaterialView.EditIndex = e.NewEditIndex;
        LoadMaterialMaster();
    }
    protected void grdMaterialView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        GridViewRow grvRow = (GridViewRow)grdMaterialView.Rows[e.RowIndex];
        Label lbl = (Label)grvRow.FindControl("lblId");
        TextBox TxtMaterial = (TextBox)grvRow.FindControl("txtMaterialName");
        TextBox TxtHSN = (TextBox)grvRow.FindControl("txtHsncode");


        grdMaterialView.EditIndex = -1;
        string Query = "Update MATERIALMASTER set MATERIALNAME='" + TxtMaterial.Text + "',HSNCODE='" + TxtHSN.Text + "'  WHERE ID='" + lbl.Text + "' ";
        SqlObj.ExecuteNonQuery(Query);
        LoadMaterialMaster();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Material Item Updated!');location.href='Materialview.aspx'", true);

    }

    public void LoadMaterialMaster()
    {
        string Query = "SELECT * FROM MATERIALMASTER  ORDER BY MATERIALNAME ASC ";
        Dt = SqlObj.GetData_DT(Query);
        grdMaterialView.DataSource = Dt;
        grdMaterialView.DataBind();

    }

}