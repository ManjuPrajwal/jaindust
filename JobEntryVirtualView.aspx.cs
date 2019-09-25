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
public partial class JobEntryVirtualView : System.Web.UI.Page
{

    int K = 0;
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    string CHK;
    Int32 Val1;
    Int32 Result;


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LoadPartMaster();
            LoadJobEntryVView();
        }

    }
    protected void cmbPartMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        string q1 = "select V.VIRUTALID,P.PARTNO,P.DESCRIPTION,V.TOTCOUNT,V.UPDATEDDT  from VIRTUALCOUNT AS V inner join PARTMASTER as P ON V.JOBID =P.JOBID  WHERE V.JOBID='" + cmbPartMaster.SelectedItem.Value + "'";
        Dt = SqlObj.GetData_DT(q1);
        grdJobEntryVView.DataSource = Dt;
        grdJobEntryVView.DataBind();
        grdJobEntryVView.FooterRow.Cells[3].Text = "Total Qty";

    }

    public void LoadJobEntryVView()
    {
        string Query = "select V.VIRUTALID,P.PARTNO,P.DESCRIPTION,V.TOTCOUNT,V.UPDATEDDT  from VIRTUALCOUNT AS V inner join PARTMASTER as P ON V.JOBID =P.JOBID";
        Dt = SqlObj.GetData_DT(Query);
        grdJobEntryVView.DataSource = Dt;
        grdJobEntryVView.DataBind();
        grdJobEntryVView.FooterRow.Cells[3].Text = "Total Qty";
           
    }

    protected void grdJobEntryVView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Result += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "TOTCOUNT"));   


        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label Gtott = (Label)e.Row.FindControl("lblGTotQty");
            Gtott.Text = Result.ToString();
            Session["VirtualCount"] = Result;
   
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

  
   
}
