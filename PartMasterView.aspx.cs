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



public partial class PartMasterView : System.Web.UI.Page
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
            LoadPartMaster();
        }


    }


    protected void grdPartMasterView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        grdPartMasterView.EditIndex = -1;
        LoadPartMaster();

    }
    protected void grdPartMasterView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void grdPartMasterView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        GridViewRow grvRow = (GridViewRow)grdPartMasterView.Rows[e.RowIndex];
        Label lblDeleteId = (Label)grvRow.FindControl("lblJobId");
        string Query = "delete from PARTMASTER where JOBID='" + lblDeleteId.Text + "'";
        SqlObj.ExecuteNonQuery(Query);
        LoadPartMaster();

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('PartMaster Item Deleted!');location.href='PartMasterView.aspx'", true);

    }
    protected void grdPartMasterView_RowEditing(object sender, GridViewEditEventArgs e)
    {

        grdPartMasterView.EditIndex = e.NewEditIndex;
        LoadPartMaster();
    }
    protected void grdPartMasterView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        GridViewRow grvRow = (GridViewRow)grdPartMasterView.Rows[e.RowIndex];
        Label lbl = (Label)grvRow.FindControl("lblJobId");
        TextBox TxtPartNo = (TextBox)grvRow.FindControl("txtPartNo");
        TextBox TxtDecription = (TextBox)grvRow.FindControl("txtDescription");
        TextBox TxtPrice = (TextBox)grvRow.FindControl("txtPrice");
     
        grdPartMasterView.EditIndex = -1;
        string Query = "Update PARTMASTER set PARTNO='" + TxtPartNo.Text + "',PRICE= '"+Convert.ToDouble(TxtPrice.Text)+"'  ,DESCRIPTION='" + TxtDecription.Text + "'  FROM PARTMASTER WHERE JOBID='" + lbl.Text + "' ";
        SqlObj.ExecuteNonQuery(Query);
        LoadPartMaster();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('PartMaster Item Updated!');location.href='PartMasterView.aspx'", true);

    }

    public void LoadPartMaster()
    {
        string Query = "SELECT * FROM PARTMASTER  ORDER BY PARTNO ASC ";
        Dt=SqlObj.GetData_DT(Query);
        grdPartMasterView.DataSource = Dt;
        grdPartMasterView.DataBind();
     
    }



}
