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
using System.Globalization;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data.SqlClient;
using System.Globalization;

using CLS_BL;
using CLS_DL;
public partial class IncWithoutTaxRpt : System.Web.UI.Page
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

            LoadWithoutTaxGrid();
        }
        else
        {
            CrystalReportViewer1.ReportSource = Session["Report"];
        }
         

    }

    public void LoadWithoutTaxGrid()
    {
        string Q = "SELECT distinct I.INVOICENO,V.VENDORNAME,I.INCDATE,IC.TAXPREFIX  FROM INVOICEMASTER AS I INNER JOIN VENDORMASTER AS V ON V.VID=I.VID INNER JOIN INVOICECHILD AS IC ON I.INCID=IC.INCID WHERE IC.TAXPREFIX='E'";
        Dt = SqlObj.GetData_DT(Q);
        grdIncWithoutTaxView.DataSource = Dt;
        grdIncWithoutTaxView.DataBind();
    }

    protected void btnReport_Click(object sender, EventArgs e)
    {
        bool result = false;
        string InvoiceNo = string.Empty;
        
        foreach (GridViewRow row in grdIncWithoutTaxView.Rows)
        {
            result = ((RadioButton)row.FindControl("chk")).Checked;
            if (result)
            {
                InvoiceNo = (row.FindControl("lblInvoiceNO") as Label).Text;
                loadcry(InvoiceNo);

            }
        }


    }


    public void loadcry(string InvoiceNo)
    {
        TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
        TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
        ConnectionInfo crConnectionInfo = new ConnectionInfo();
        Tables CrTables;
        string q2 = "SELECT * FROM IncNReport WHERE TAXPREFIX='E' AND INVOICENO='" + InvoiceNo + "'";
        Ds = SqlObj.GetData_DS(q2);
        rep = new ReportDocument();
        rep.Load(Server.MapPath("~/IncSalesRptwidTAX.rpt"));
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
