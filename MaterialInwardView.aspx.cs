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

public partial class MaterialInwardView : System.Web.UI.Page
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
            LoadInwardView();
        }

    }

    public void LoadInwardView()
    {
        string query = "SELECT I.PONO,I.PODATE,I.MID,V.VENDORNAME,I.INWARD_DT  FROM INWARDMASTER AS I  INNER JOIN VENDORMASTER AS V  ON I.VID=V.VID";
        Dt = SqlObj.GetData_DT(query);
        grdInwardMasterView.DataSource = Dt;
        grdInwardMasterView.DataBind();
   
    }

}
