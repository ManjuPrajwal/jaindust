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

public partial class DCMasterDetailsView : System.Web.UI.Page
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

            string Dcno;

            Dcno = Request.QueryString["id"].ToString();
            string Query = "SELECT  DM.PODATE,DM.DCNO ,DM.DCDATE ,P.PARTNO,P.DESCRIPTION ,DM.STATUS,CH.DC_QTY,CH.PONO,CH.DCHID AS DCHID ,V.VENDORNAME FROM DCMASTER AS DM INNER JOIN DCCHILD AS CH ON DM.DCID=CH.DCID  INNER JOIN VENDORMASTER  AS V ON  DM.VID=V.VID  INNER JOIN PARTMASTER AS P ON CH.JOBID=P.JOBID  where DM.DCNO="+Dcno+"";
            Dt = SqlObj.GetData_DT(Query);
            grdDCDetailsView.DataSource = Dt;
            grdDCDetailsView.DataBind();

            if (Dt.Rows.Count > 0)
            {
                grdDCDetailsView.FooterRow.Cells[5].Text = "Total Qty";
            }
            


        }    

  


    }
    protected void grdDCDetailsView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GTot += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "DC_QTY"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label GTotal = (Label)e.Row.FindControl("lblGTotQty");
            GTotal.Text = GTot.ToString();
            Session["GTotal1"] = GTot;

        }



    }
}
