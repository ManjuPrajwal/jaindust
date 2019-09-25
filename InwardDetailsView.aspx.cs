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

public partial class InwardDetailsView : System.Web.UI.Page
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
      
        string Mid;

           Mid=Request.QueryString["id"].ToString();
           string Query = "select I.MID,I.PONO,IC.JOBID,IC.PARTNO,IC.DESCRIPTION,IC.QTY,V.VENDORNAME,I.INWARD_DT FROM  INWARDMASTER AS I INNER JOIN VENDORMASTER AS V ON I.VID=V.VID  INNER JOIN   INWARDCHILD AS IC ON I.MID=IC.MID WHERE I.MID=" + Mid + "";
           Dt = SqlObj.GetData_DT(Query);
           grdInwardDetailsView.DataSource = Dt;
           grdInwardDetailsView.DataBind();

           if (Dt.Rows.Count > 0)
           {
               grdInwardDetailsView.FooterRow.Cells[5].Text = "Total Qty";
           }
                       
        }    

    }

    protected void grdInwardDetailsView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        { 
          GTot+=Convert.ToInt32(DataBinder.Eval(e.Row.DataItem,"QTY"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label GTotal = (Label)e.Row.FindControl("lblGTotQty");
            GTotal.Text = GTot.ToString();
            Session["GTotal"] = GTot;

        }

        // Doing Coloring According the Condition 

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView DtRwView = (DataRowView)e.Row.DataItem;

            string Val1 = DtRwView["JOBID"].ToString();
            string Val2 = DtRwView["PONO"].ToString();
            string QU = "SELECT STATUS FROM DCCHILD WHERE JOBID='" + Val1 + "' AND PONO='" + Val2 + "'";
            Chk = SqlObj.ExecuteScalar(QU);
            if (Chk == "U")
            {
                e.Row.Cells[3].BackColor = System.Drawing.Color.Cyan;           
                                
            }


        
        }
  

    }
}
