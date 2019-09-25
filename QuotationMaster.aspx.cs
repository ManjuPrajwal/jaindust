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


public partial class QuotationMaster : System.Web.UI.Page
{

    int K = 0;
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    string Chk_TotQty;
    Int32 TotQty = 0;
    Int32 GTotl = 0;
    Int32 IncNO = 0;
    Int32 QNO = 0;
    string CHKQNO = "";
    decimal GTotal;
    decimal TaxVal;
    string RHSNCODE = string.Empty;
    string invoiceno = string.Empty;
    string CurrDt = DateTime.Now.Date.ToString("dd-MM-yyyy");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadVendormaster();
            LoadPartMaster();
            txtQuotationNo.Text = GetQUTNO();
            txtQuotationNo.Enabled = false;
            txtQuotationDt.Text = CurrDt;

            if (Session["QtyTable"] != null)
            {

                DataTable DTResult = (DataTable)Session["QtyTable"];
                if (DTResult.Rows.Count > 0)
                {
                    grdQutChild.DataSource = DTResult;
                      grdQutChild.DataBind();

                    //GridView1.DataSource = DTResult;
                    //GridView1.DataBind();

                }

            }

          

        }

    }


    protected void cmbPartMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        string q1 = "SELECT PRICE  FROM PARTMASTER  WHERE ID='" + cmbPartMaster.SelectedItem.Value + "'";
        txtPrice.Text = SqlObj.ExecuteScalar(q1);
        txtPrice.Enabled = false;

        txtTotalAmt.Text = "";
        txtTaxAmount.Text = "";
        txtGrandTotal.Text = "";
        txtQutQty.Text = "";
    }

    protected void rdWitoutTax_CheckedChanged(object sender, EventArgs e)
    {



        if (rdWitoutTax.Checked == true)
        {
            txtTaxAmount.Text = "0";
            GTotal = Convert.ToDecimal(txtTotalAmt.Text) + Convert.ToDecimal(txtTaxAmount.Text);
            txtGrandTotal.Text = Convert.ToString(GTotal);

        }

    }
    protected void rdSTax_CheckedChanged(object sender, EventArgs e)
    {

        if (rdSTax.Checked == true)
        {

            // Service Tax Calculation  : 18% 

            decimal TaxVal = Convert.ToDecimal(txtTotalAmt.Text) * 18 / 100;
            txtTaxAmount.Text = Convert.ToString(TaxVal);

            GTotal = Convert.ToDecimal(txtTotalAmt.Text) + Convert.ToDecimal(txtTaxAmount.Text);
            txtGrandTotal.Text = Convert.ToString(GTotal);

        }


    }
    // Save Quotation Details 
    public void SaveQuoationDetails()
    { 

     DataTable DTResultFinal = (DataTable)Session["QtyTable"];

     if (DTResultFinal.Rows.Count > 0)
     {
         foreach (DataRow Row in DTResultFinal.Rows)
         {
             PLobj.QUTID = objBL.Generate_QUTID();
             PLobj.Id = Convert.ToInt32(Convert.ToInt32(Row["ID"]));
             PLobj.HSNCode = Row["HSNCODE"].ToString();
             PLobj.UOM = Row["UOM"].ToString();
             PLobj.Qty =Convert.ToInt32(Row["QTY"]);
             PLobj.NPrice = Convert.ToDecimal(Row["PRICE"]);
             PLobj.TotalAmt = Convert.ToDecimal(Row["TOTAL"]);
             PLobj.TaxAmt = Convert.ToDecimal(Row["GST"]);
             PLobj.GrandTotal = Convert.ToDecimal(Row["GRANDTOTAL"]);

             K = objBL.QuoationCHILD(PLobj);

         }

     
     }
              
    }
    // This Function for Save Quoation Master 
    public void SaveQuoationMaster()
    {

        PLobj.QUTID = objBL.Generate_QUTID();
        PLobj.Vid = Convert.ToInt32(cmbVendoreName.SelectedItem.Value);
        PLobj.QDate =Convert.ToDateTime(txtQuotationDt.Text);
        PLobj.QUTNO = Convert.ToInt32(GetQUTNO());
        PLobj.Remarks = "Nill";
        objBL.QuoationMaster(PLobj);
    
    }
   protected void imbtnAddItems_Click(object sender, ImageClickEventArgs e)
    {
     
        SaveTempQD();

    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        SaveQuoationDetails();
        SaveQuoationMaster();
        QUOTUpdate();

        Session["QtyTable"] = null;

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert(' Quotation Saved  Successfully  !');location.href='QuotationMaster.aspx'", true);    

    }

    public void LoadSubGrid()
    {
        DataTable DTResult = (DataTable)Session["QtyTable"];
        if (DTResult.Rows.Count > 0)
        {
            grdQutChild.DataSource = DTResult;
            grdQutChild.DataBind();

            //GridView1.DataSource = DTResult;
            //GridView1.DataBind();
        
        }

   
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

    public string GetQUTNO()
    {
        string Q = "SELECT ISNULL(MAX((QUTNO)+1),1) FROM QUTNO";
        invoiceno = SqlObj.ExecuteScalar(Q);
        return invoiceno;
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



    protected void txtQutQty_TextChanged(object sender, EventArgs e)
    {

        if (rdSTax.Checked == true)
        {

            // Service Tax Calculation  : 18% 

            decimal Tot;
            Tot = Convert.ToDecimal(txtPrice.Text) * Convert.ToInt32(txtQutQty.Text);
            txtTotalAmt.Text = Convert.ToString(Tot);

            decimal TaxVal = Convert.ToDecimal(txtTotalAmt.Text) * 18 / 100;
            txtTaxAmount.Text = Convert.ToString(TaxVal);

            GTotal = Convert.ToDecimal(txtTotalAmt.Text) + Convert.ToDecimal(txtTaxAmount.Text);
            txtGrandTotal.Text = Convert.ToString(GTotal);

        }


       
    }

    public void SaveTempQD()
    {

        DataTable DtFinaldata = new DataTable();

        if (Session["QtyTable"] != null)
        {
            DtFinaldata = (DataTable)Session["QtyTable"];   
        
        }

     

        DataRow Dr = DtFinaldata.NewRow();
        if (DtFinaldata.Rows.Count == 0)
        {
         
            DtFinaldata.Columns.Add("ID", typeof(Int32));
            DtFinaldata.Columns.Add("PARTNAME", typeof(string));
            DtFinaldata.Columns.Add("HSNCODE", typeof(string));
            DtFinaldata.Columns.Add("UOM", typeof(string));
            DtFinaldata.Columns.Add("QTY", typeof(Int32));
            DtFinaldata.Columns.Add("PRICE", typeof(decimal));
            DtFinaldata.Columns.Add("TOTAL", typeof(decimal));
            DtFinaldata.Columns.Add("GST", typeof(decimal));
            DtFinaldata.Columns.Add("GRANDTOTAL", typeof(decimal));
           
            Dr["ID"] = cmbPartMaster.SelectedItem.Value;
            Dr["PARTNAME"] = cmbPartMaster.SelectedItem.Text;
            Dr["HSNCODE"] = lblHSNCODE.Text;
            Dr["UOM"] = "pcs";
            Dr["QTY"] = Convert.ToInt32(txtQutQty.Text);
            Dr["PRICE"] = txtPrice.Text;
            Dr["TOTAL"] = txtTotalAmt.Text;
            Dr["GST"] = txtTaxAmount.Text;
            Dr["GRANDTOTAL"] = txtGrandTotal.Text;
            
        }
        else
        {
            Dr["ID"] = cmbPartMaster.SelectedItem.Value;
            Dr["PARTNAME"] = cmbPartMaster.SelectedItem.Text;
            Dr["HSNCODE"] = lblHSNCODE.Text;
            Dr["UOM"] = "pcs";
            Dr["QTY"] =  Convert.ToInt32(txtQutQty.Text);
            Dr["PRICE"] = txtPrice.Text;
            Dr["TOTAL"] = txtTotalAmt.Text;
            Dr["GST"] = txtTaxAmount.Text;
            Dr["GRANDTOTAL"] = txtGrandTotal.Text;
            
        
        
        }

        DtFinaldata.Rows.Add(Dr);

        Session["QtyTable"] = DtFinaldata;

        LoadSubGrid();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert(' Items Added  !');location.href='QuotationMaster.aspx'", true);    



    }


    public int QUOTUpdate()
    {
        string Q12 = "SELECT QUTNO FROM QUTNO WHERE SNO=1";
        CHKQNO = SqlObj.ExecuteScalar(Q12);

        if (CHKQNO != "")
        {
            QNO = Convert.ToInt32(CHKQNO);
            QNO += 1;
            string Q13 = "UPDATE QUTNO SET QUTNO=" + QNO + " WHERE SNO=1";
            SqlObj.ExecuteNonQuery(Q13);
        }
        else
        {

            QNO += 1;
            string Q14 = "INSERT INTO QUTNO (SNO,QUTNO)VALUES(1," + QNO + ") ";
            SqlObj.ExecuteNonQuery(Q14);
        }

        return QNO;

    }

  


    protected void btnGetHSNCODE_Click(object sender, EventArgs e)
    {
        lblHSNCODE.Text = SqlObj.ExecuteScalar("select HSNCODE from MATERIALMASTER where MATERIALNAME='" + txtSearch.Text + "'");

    }
    protected void grdQutChild_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        DataTable dt1 = (DataTable)Session["QtyTable"];
        // DataTable dt = new DataTable();
        if (dt1.Rows.Count > 0)
        {
            dt1.Rows[e.RowIndex].Delete();
            grdQutChild.DataSource = dt1;
            grdQutChild.DataBind();

        }


    }



   



}