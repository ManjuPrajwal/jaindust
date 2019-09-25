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

public partial class InvoiceView : System.Web.UI.Page
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

            LoadInvoiceMaster();
        }


    }

    public void LoadInvoiceMaster()
    {
        string query = "SELECT I.INCID,V.VENDORNAME,I.INVOICENO,I.INCDATE  FROM INVOICEMASTER AS I INNER JOIN VENDORMASTER AS V ON V.VID=I.VID";
        Dt = SqlObj.GetData_DT(query);
        grdInvoiceView.DataSource = Dt;
        grdInvoiceView.DataBind();

    }




}
