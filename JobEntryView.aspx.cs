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

public partial class JobEntryView : System.Web.UI.Page
{
    int K = 0;
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    string CurrDt = DateTime.Now.Date.ToString("dd-MM-yyyy");
    string CHK;
    Int32 GTOT = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPartMaster();
            LoadJobEntryView();
             
        }


    }


    public void LoadJobEntryView()
    {
        string q1 = "SELECT EJ.EJOBID,P.PARTNO,P.DESCRIPTION,EJ.EMPNAME,EJ.QTY,EJ.CREATEDT  FROM EMPJOBMASTER AS EJ INNER JOIN PARTMASTER AS P ON EJ.JOBID=P.JOBID order by EJ.CREATEDT";
        Dt = SqlObj.GetData_DT(q1);
        grdJobEntry.DataSource = Dt;
        grdJobEntry.DataBind();
        if (Dt.Rows.Count > 0)
        {
            grdJobEntry.FooterRow.Cells[4].Text = "Total Qty";
        }
        
            
    }
    public void LoadPartMaster()
    {
        string query = "SELECT JOBID,PARTNO FROM PARTMASTER ORDER BY PARTNO ASC ";
        Dt = SqlObj.GetData_DT(query);
        cmbPartMaster.DataSource = Dt;
        cmbPartMaster.DataTextField = "PARTNO";
        cmbPartMaster.DataValueField = "JOBID";
        cmbPartMaster.DataBind();
        cmbPartMaster.Items.Insert(0, "Select");

    }



    protected void cmbPartMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        string q1 = "SELECT EJ.EJOBID,P.PARTNO,P.DESCRIPTION,EJ.EMPNAME,EJ.QTY,EJ.CREATEDT  FROM EMPJOBMASTER AS EJ INNER JOIN PARTMASTER AS P ON EJ.JOBID=P.JOBID  WHERE EJ.JOBID='"+cmbPartMaster.SelectedItem.Value+"'";
        Dt = SqlObj.GetData_DT(q1);
        grdJobEntry.DataSource = Dt;
        grdJobEntry.DataBind();

        if (Dt.Rows.Count > 0)
        {
            grdJobEntry.FooterRow.Cells[4].Text = "Total Qty";
        }
        
        
     
    }
    protected void grdJobEntry_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GTOT += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "QTY"));
               
        
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label GTotal = (Label)e.Row.FindControl("lblGTotQty");
            GTotal.Text = GTOT.ToString();
            Session["GTotal"] = GTOT;

        
        }


    }
}
