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
public partial class DCMasterView : System.Web.UI.Page
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
            LoadDCMaster();
        }


    }

    public void LoadDCMaster()
    {
        string query = "SELECT DISTINCT D.DCNO,D.DCID,V.VENDORNAME,D.DCDATE FROM DCMASTER AS D  INNER JOIN VENDORMASTER  AS V ON  D.VID=V.VID";
        Dt = SqlObj.GetData_DT(query);
        grdDCMasterView.DataSource = Dt;
        grdDCMasterView.DataBind();
    
    }

}
