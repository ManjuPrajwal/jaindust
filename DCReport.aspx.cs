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
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CLS_BL;
using CLS_DL;


public partial class DCReport : System.Web.UI.Page
{

    ReportDocument rep = new ReportDocument();
    string ppp = string.Empty;

    int K = 0;
    int L = 1;
    DataTable Dt = new DataTable();
    DataSet Ds = new DataSet();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    string Chk_TotQty;
    Int32 TotQty = 0;
    Int32 GTotl = 0;
    string CurrDt = DateTime.Now.Date.ToString("dd-MM-yyyy");
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

           // LoadVendormaster();
            DCReptHeaderView();
        }
        else
        {
            CrystalReportViewer1.ReportSource = Session["Report"];
        }
              


    }

    //public void LoadVendormaster()
    //{
    //    string QUERY = "SELECT VID,VENDORNAME FROM VENDORMASTER ORDER BY VENDORNAME ASC";
    //    Dt = SqlObj.GetData_DT(QUERY);

    //    cmbVendoreName.DataSource = Dt;
    //    cmbVendoreName.DataTextField = "VENDORNAME";
    //    cmbVendoreName.DataValueField = "VID";
    //    cmbVendoreName.DataBind();
    //    cmbVendoreName.Items.Insert(0, "Select");

    //}
    public void DCReptHeaderView()
    {
        string q1 = "SELECT DISTINCT D.DCNO as DCNO,V.VENDORNAME as VENDORNAME,V.VID as VID,D.DCDATE as DCDATE FROM DCMASTER AS D  INNER JOIN VENDORMASTER  AS V ON  D.VID=V.VID";
        Dt = SqlObj.GetData_DT(q1);
        grdDCReport.DataSource = Dt;
        grdDCReport.DataBind();
    }

    public void loadcry(string DCNO,string VID)
    {
        TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
        TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
        ConnectionInfo crConnectionInfo = new ConnectionInfo();
        Tables CrTables;
        string q2="SELECT * FROM VIEW_DCREPORT WHERE DCNO="+DCNO +"  AND VID="+VID +"";
        Ds = SqlObj.GetData_DS(q2);
        rep = new ReportDocument();
        rep.Load(Server.MapPath("~/DCReport.rpt"));
        rep.SetDataSource(Ds.Tables[0]);
        CrTables = rep.Database.Tables;

        foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in CrTables)
        {
            crtableLogoninfo = CrTable.LogOnInfo;

            crtableLogoninfo.ConnectionInfo = crConnectionInfo;

            CrTable.ApplyLogOnInfo(crtableLogoninfo);

        }
        rep.Refresh();

        CrystalReportViewer1.ReportSource = rep;
        Session["Report"] = rep;
        
        CrystalReportViewer1.DataBind();
        CrystalReportViewer1.RefreshReport();
       

    }

    protected void btnReport_Click(object sender, EventArgs e)
    {
        bool result = false;
        string DCNo = string.Empty;
        string Vid = string.Empty;

        foreach (GridViewRow row in grdDCReport.Rows)
        {
            result = ((RadioButton)row.FindControl("chk")).Checked;
            if (result)
            {
                DCNo = (row.FindControl("lblDCNO") as Label).Text;
                Vid = (row.FindControl("lblVID") as Label).Text;
                loadcry(DCNo,Vid);
               
            }
        }




    }
}
