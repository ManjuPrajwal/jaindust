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

public partial class InvoiceDetailsView : System.Web.UI.Page
{

    int K = 0;
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    Int32 GTot = 0;
    string Chk = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            string InvoiceNO;

            InvoiceNO = Request.QueryString["id"].ToString();
            string Query = " SELECT IM.INVOICENO,IM.INCDATE,IM.INCID,IM.PONO,P.PARTNO,P.DESCRIPTION,IC.INCCHID,IC.QTY,IC.PRICE,IC.TOTAL,IC.TAXAMT,IC.TAXPREFIX,IC.GRNDTOTAL,IC.STATUS FROM INVOICEMASTER AS IM INNER JOIN INVOICECHILD AS IC ON IM.INCID=IC.INCID INNER JOIN PARTMASTER AS P ON IC.JOBID=P.JOBID    where IM.INVOICENO=" + InvoiceNO + "";
            Dt = SqlObj.GetData_DT(Query);
            grdInvoiceDetailsView.DataSource = Dt;
            grdInvoiceDetailsView.DataBind();

            if (Dt.Rows.Count > 0)
            {
                grdInvoiceDetailsView.FooterRow.Cells[8].Text = "GrandTotal";
            }
            else
            { 
             
            }

        }    


    }
    protected void grdInvoiceDetailsView_RowDataBound(object sender, GridViewRowEventArgs e)
    {


        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GTot += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "GRNDTOTAL"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label GTotal = (Label)e.Row.FindControl("lblGTotQty");
            GTotal.Text = GTot.ToString();
            Session["GinvoiceTotal"] = GTot;

        }
    }
}
