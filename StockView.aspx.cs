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

public partial class StockView : System.Web.UI.Page
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
         LoadStockView();
        
        }


    }

    public void LoadStockView()
    {
        string query = "select distinct I.JOBID,I.PARTNO,I.DESCRIPTION,ST.TOTCOUNT,ST.CREATEDT  from INWARDCHILD  as I INNER JOIN STOCKCOUNT AS ST ON  I.JOBID =ST.JOBID";
        Dt = SqlObj.GetData_DT(query);
        grdStockView.DataSource = Dt;
        grdStockView.DataBind();
    
    }






}
