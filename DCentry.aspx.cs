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

public partial class DCentry : System.Web.UI.Page
{

    int K = 0;
    int j = 0;
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    Int32 GTot = 0;
    int MID = 0;
    int DCNO = 0;
    string dcno;
    string jobid;
    string Vid;
    Int32 GTotl = 0;
    string CurrDt = DateTime.Now.Date.ToString("dd-MM-yyyy");
    protected void Page_Load(object sender, EventArgs e)
    
    {

        if (!IsPostBack)
        {
            GetDCNO();
          
            LoadPartMaster();


            if (Session["InvTable"] != null)
            {

                DataTable DTResult = (DataTable)Session["DCTableValue"];
                if (DTResult.Rows.Count > 0)
                {
                    grdDcDetails.DataSource = DTResult;
                    grdDcDetails.DataBind();

                }

            }



            
        }

    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {

        //InsertDCMaster();
        //objBL.UpdateCHID(PLobj.DCid);
        //DCUpdate();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert(' DC Created Successfully !');location.href='MaterialInwardView.aspx'", true);    
    }


    public void LoadPartMaster()
    {
        string query = "SELECT ID,JOBID,PARTNO FROM PARTMASTER ORDER BY PARTNO ASC ";
        Dt = SqlObj.GetData_DT(query);
        cmbPartMaster.DataSource = Dt;
        cmbPartMaster.DataTextField = "PARTNO";
        cmbPartMaster.DataValueField = "ID";
        cmbPartMaster.DataBind();
        cmbPartMaster.Items.Insert(0, "Select");

    }


    public void SaveTempQD()
    {

        DataTable DtFinaldata = new DataTable();

        if (Session["DCTableValue"] != null)
        {
            DtFinaldata = (DataTable)Session["DCTableValue"];

        }
        DataRow Dr = DtFinaldata.NewRow();
        if (DtFinaldata.Rows.Count == 0)
        {
            DtFinaldata.Columns.Add("ID", typeof(Int32));
            DtFinaldata.Columns.Add("PARTNAME", typeof(string));
            DtFinaldata.Columns.Add("DC_QTY", typeof(decimal));

            Dr["ID"] = cmbPartMaster.SelectedItem.Value;
            Dr["PARTNAME"] = cmbPartMaster.SelectedItem.Text;
            Dr["DC_QTY"] = txtDCQty.Text;
         
        }
        else
        {
            Dr["ID"] = cmbPartMaster.SelectedItem.Value;
            Dr["PARTNAME"] = cmbPartMaster.SelectedItem.Text;
            Dr["DC_QTY"] = txtDCQty.Text;
         
        }

        DtFinaldata.Rows.Add(Dr);
        Session["DCTableValue"] = DtFinaldata;

        LoadSubGrid();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert(' Items Added  !')", true);



    }


    public void LoadSubGrid()
    {
        DataTable DTResult = (DataTable)Session["DCTableValue"];
        if (DTResult.Rows.Count > 0)
        {
            grdDcDetails.DataSource = DTResult;
            grdDcDetails.DataBind();


        }


    }



   
    protected void imbtnAddItems_Click(object sender, ImageClickEventArgs e)
    {

        SaveTempQD();

        
    }
        
        

    

   
    public string GetDCNO()
    {
        string Q = "SELECT ISNULL(MAX((DCNO)+1),1) FROM DCNO";
        dcno=SqlObj.ExecuteScalar(Q);
        return dcno;
    }

 
    public int DCUpdate()
    {
        string Q12 = "SELECT DCNO FROM DCNO WHERE SNO=1";
        dcno =SqlObj.ExecuteScalar(Q12);

        if (dcno != "")
        {
            DCNO = Convert.ToInt32(dcno);
            DCNO += 1;
            string Q13 = "UPDATE DCNO SET DCNO=" + DCNO + " WHERE SNO=1";
            SqlObj.ExecuteNonQuery(Q13);
        }
        else 
        {
         
            DCNO += 1;
            string Q14 = "INSERT INTO DCNO (SNO,DCNO)VALUES(1,"+DCNO+") ";
            SqlObj.ExecuteNonQuery(Q14); 
        }

        return DCNO;

    }
    
    
   
    public void InsertDCCHILD()
    {
        
        PLobj.Jobid = cmbPartMaster.SelectedItem.Value;
        PLobj.DC_Qty = Convert.ToInt32(txtDCQty.Text);
        PLobj.PoNo = txtPONO.Text;
        PLobj.Status = "N";
        objBL.InSDCCHILD(PLobj);
    
     
    }
    public void InsertDCMaster()
    {
        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "dd-MM-yyyy";

        PLobj.DCid = objBL.Generate_DCID();
        PLobj.Vid =Convert.ToInt32(Session["Vid"]);
        PLobj.Podate = Convert.ToDateTime(txtPODt.Text,dateInfo);
        PLobj.DCno = Convert.ToInt32(txtDCNO.Text);
        PLobj.DCRefNo = txtBillNo.Text;
        PLobj.DcDate = Convert.ToDateTime(txtDCDt.Text,dateInfo);
        PLobj.Status = "N";
        objBL.InSDCMaster(PLobj);
    
    }
    


   
}
