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


public partial class MaterialInward : System.Web.UI.Page
{

    int K = 0;
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    string Chk_TotQty;
    Int32 TotQty=0;
    Int32 GTotl=0;
    string CurrDt = DateTime.Now.Date.ToString("dd-MM-yyyy");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtEntryDt.Text = CurrDt;
            txtRemarks.Text = "Nill";
            LoadVendormaster();
            LoadPartMaster();
            objBL.Del_InwardTrans();


        }

    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {

        if (cmbVendoreName.SelectedItem.Text == "Select")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Select VendorName !')", true);
        }
        else
        {

            string Val_Chk = "SELECT CHID,PARTNO,JOBID,DESCRIPTION,QTY,INWARD_DT FROM INWARDCHILD WHERE MID_STATUS='N'";
            Dt = SqlObj.GetData_DT(Val_Chk);
            if (Dt.Rows.Count > 0)
            {

                InwardMasterIN();
                objBL.UpdateMID(PLobj.Mid);
                objBL.UpdateMIDonStock(PLobj.Mid);
                txtEntryDt.Text = "";
                txtBillNo.Text = "";
                txtPODt.Text = "";
                txtPONO.Text = "";
                txtRemarks.Text = "";
                txtTotalQty.Text = "";
                cmbPartMaster.SelectedIndex = 0;
                cmbVendoreName.SelectedIndex = 0;
                grdITEMView.DataSource = null;
                grdITEMView.DataBind();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Material Inward Inserted Successfully !');location.href='MaterialInward.aspx'", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Add The Items!')", true);          
            }

       

        }

        
    }

    public void LoadVendormaster()
    {
        string QUERY = "SELECT VID,VENDORNAME FROM VENDORMASTER ORDER BY VENDORNAME ASC";
        Dt = SqlObj.GetData_DT(QUERY);
        
        cmbVendoreName.DataSource = Dt;
        cmbVendoreName.DataTextField = "VENDORNAME";
        cmbVendoreName.DataValueField = "VID";
        cmbVendoreName.DataBind();
        cmbVendoreName.Items.Insert(0, "Select");
    
    }
    
    public void LoadPartMaster()
    {
        string query = "SELECT JOBID,PARTNO FROM PARTMASTER ORDER BY PARTNO ASC ";
        Dt = SqlObj.GetData_DT(query);
        cmbPartMaster.DataSource = Dt;
        cmbPartMaster.DataTextField = "PARTNO";
        cmbPartMaster.DataValueField = "JOBID";
        cmbPartMaster.DataBind();
        cmbPartMaster.Items.Insert(0, "Select");
    
    }

    public void InwardMasterIN()
    {
        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "dd-MM-yyyy";

        PLobj.Mid = objBL.Generate_MID();
        PLobj.Vid =  Convert.ToInt32(cmbVendoreName.SelectedItem.Value);
        PLobj.Podate = Convert.ToDateTime(txtPODt.Text, dateInfo);
        PLobj.PoNo = txtPONO.Text;
        PLobj.DCRefNo = txtBillNo.Text;
        PLobj.Inward_date = Convert.ToDateTime(txtEntryDt.Text, dateInfo);
        objBL.InsertInwardMaster(PLobj);
    
       
    }
    public void InwardChild()
    {
        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "dd-MM-yyyy";

        PLobj.Jobid = cmbPartMaster.SelectedItem.Value;
        PLobj.PartName = cmbPartMaster.SelectedItem.Text;
        PLobj.Description = objBL.Get_Description(cmbPartMaster.SelectedItem.Value);
        PLobj.Qty = Convert.ToInt32(txtTotalQty.Text);
        PLobj.Inward_date = Convert.ToDateTime(txtEntryDt.Text, dateInfo);

        objBL.InsertInwardChild(PLobj);
    
        
    }
    public void StockCnt()
    {
        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "dd-MM-yyyy";
        
         string Query="SELECT TOTCOUNT FROM STOCKCOUNT WHERE JOBID='"+ cmbPartMaster.SelectedItem.Value +"'";
         Chk_TotQty = SqlObj.ExecuteScalar(Query);

         if (Chk_TotQty != "")
         {
        
             TotQty = Convert.ToInt32(Chk_TotQty)+Convert.ToInt32(txtTotalQty.Text);
             PLobj.Jobid = cmbPartMaster.SelectedItem.Value;
             PLobj.Qty = TotQty;
             PLobj.UpdatedDate = Convert.ToDateTime(CurrDt,dateInfo);
             objBL.UpdateStockcount(PLobj);


         }
         else
         {
             PLobj.Jobid = cmbPartMaster.SelectedItem.Value;
             PLobj.Qty = Convert.ToInt32(txtTotalQty.Text);
             PLobj.CreatedDate = Convert.ToDateTime(CurrDt,dateInfo);
             objBL.InsertStockcount(PLobj);
  
         }

            
    
    }

    public void LoadCHGrid()
    {
        string Query = "SELECT CHID,PARTNO,JOBID,DESCRIPTION,QTY,INWARD_DT FROM INWARDCHILD WHERE MID_STATUS='N'";
        Dt = SqlObj.GetData_DT(Query);
        grdITEMView.DataSource = Dt;
        grdITEMView.DataBind();
        
    }
    
    protected void imbtnAddItems_Click(object sender, ImageClickEventArgs e)
    {

        if (cmbPartMaster.SelectedItem.Text == "Select")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Select PartNo!')", true);
        }
        else
        {
            InwardChild();
            LoadCHGrid();
            StockCnt();
            cmbPartMaster.SelectedIndex = 0;
            txtTotalQty.Text = "";
     
        }

    }
    protected void grdITEMView_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        Int32 ChID =Convert.ToInt32(e.CommandArgument);

        string Qty = SqlObj.ExecuteScalar("SELECT QTY FROM INWARDCHILD WHERE CHID="+ChID+"");
              
        string JobId = SqlObj.ExecuteScalar("SELECT JOBID FROM INWARDCHILD WHERE CHID=" + ChID + "");

        string St_Cnt = SqlObj.ExecuteScalar("SELECT TOTCOUNT FROM STOCKCOUNT WHERE JOBID='" + JobId + "'");
        
        // Qty Calculation
        int Net_St = 0;
        Net_St = Convert.ToInt32(St_Cnt) - Convert.ToInt32(Qty);
                
        if (e.CommandName.ToUpper().Trim() == "REMOVE")
        {

            string UQuery = "UPDATE STOCKCOUNT SET TOTCOUNT=" + Net_St + ",MID_STATUS='M' WHERE JOBID='" + JobId + "'";
            SqlObj.ExecuteNonQuery(UQuery);
            objBL.GetRow4Delete(ChID);
            LoadCHGrid();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Record Deleted Successfully !');location.href='MaterialInward.aspx'", true);
        
        }
     
    }
    protected void grdITEMView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GTotl += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "QTY")); 
            
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {

            Label lblTOTALAMT = (Label)e.Row.FindControl("lblGTotQty");
            lblTOTALAMT.Text = GTotl.ToString();
            Session["GToTQty"] = GTotl;
        
        }


    }
}
