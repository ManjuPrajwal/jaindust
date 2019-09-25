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


public partial class QuotationReport : System.Web.UI.Page
{

    ReportDocument rep = new ReportDocument();
    string ppp = string.Empty;

    int K = 0;
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

            
            QuotationHeader();
        }
        else
        {
            CrystalReportViewer1.ReportSource = Session["Report"];
        }
              



    }
    protected void btnReport_Click(object sender, EventArgs e)
    {
        bool result = false;
        string QUNo = string.Empty;
        string Vid = string.Empty;

        foreach (GridViewRow row in grdQUTReport.Rows)
        {
            result = ((RadioButton)row.FindControl("chk")).Checked;
            if (result)
            {
                QUNo = (row.FindControl("lblQUTNO") as Label).Text;
                Vid = (row.FindControl("lblVID") as Label).Text;
                loadcry(QUNo, Vid);

            }
        }


    }
    public void QuotationHeader()
    {
        string q1 = "SELECT DISTINCT Q.QUTNO, Q.QUTDT, V.VENDORNAME,V.VID FROM  dbo.QUOTATIONMASTER AS Q INNER JOIN dbo.VENDORMASTER AS V ON Q.VID = V.VID";
       Dt = SqlObj.GetData_DT(q1);
       grdQUTReport.DataSource = Dt;
       grdQUTReport.DataBind();
    }

    public void loadcry(string DCNO, string VID)
    {
        TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
        TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
        ConnectionInfo crConnectionInfo = new ConnectionInfo();
        Tables CrTables;
        string q2 = "SELECT * FROM Quotation WHERE QUTNO=" + DCNO + "  AND VID=" + VID + "";
        Ds = SqlObj.GetData_DS(q2);
        rep = new ReportDocument();
        rep.Load(Server.MapPath("~/CryQuotation.rpt"));
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

}