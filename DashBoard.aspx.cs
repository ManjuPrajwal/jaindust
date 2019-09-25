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

public partial class DashBoard : System.Web.UI.Page
{
    
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
     
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadStockCount();
            LoadVirtualCount();
            LoadDCCount();
        }

    }
    public void LoadStockCount()
    {
        string q = "SELECT  P.JOBID,P.PARTNO,S.TOTCOUNT FROM STOCKCOUNT AS S INNER JOIN PARTMASTER AS P ON S.JOBID=P.JOBID";
        Dt = SqlObj.GetData_DT(q);
        grdStockCount.DataSource = Dt;
        grdStockCount.DataBind();
    
    }

    public void LoadVirtualCount()
    {
        string q = "SELECT P.JOBID,P.PARTNO,V.TOTCOUNT FROM VIRTUALCOUNT  AS  V	 INNER JOIN  PARTMASTER AS P ON V.JOBID=P.JOBID";
        Dt = SqlObj.GetData_DT(q);
        grdVirtualCount.DataSource = Dt;
        grdVirtualCount.DataBind();

    }

    public void LoadDCCount()
    {
        string q = "SELECT SUM(DC_QTY) AS QTY,JOBID FROM  DCCHILD   GROUP BY JOBID";
        Dt = SqlObj.GetData_DT(q);
        grdDCCount.DataSource = Dt;
        grdDCCount.DataBind();

    }





}
