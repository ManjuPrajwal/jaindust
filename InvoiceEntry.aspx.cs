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

public partial class InvoiceEntry : System.Web.UI.Page
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
    decimal GTotal;
    decimal TaxVal;
    string invoiceno = string.Empty;
    string CurrDt = DateTime.Now.Date.ToString("dd-MM-yyyy");
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadVendormaster();
            LoadPartMaster();
            txtInvoiceNo.Text = GetINVOICENO();
            txtInvoiceNo.Enabled = false;
            txtINCDt.Text = CurrDt;
            

            if (Session["InvTable"] != null)
            {

                DataTable DTResult = (DataTable)Session["InvTable"];
                if (DTResult.Rows.Count > 0)
                {
                    grdInvChild.DataSource = DTResult;
                    grdInvChild.DataBind();

                }

            }

          
        }

    }
    protected void imbtnAddItems_Click(object sender, ImageClickEventArgs e)
    {
        if (txtSearch.Text != "" && cmbPartMaster.SelectedIndex!=0)
        {
            SaveTempQD();
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Add the Items First !')", true);
        }

        
      
        
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        DataTable ChkData = (DataTable)Session["InvTable"];
        
        
        if (ChkData.Rows.Count > 0)
        {

            InsertInvoiceChild();
            Insert_InvoiceMaster();
           
            INVOICEUpdate();
            Session["InvTable"] = null;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Invoice Created Successfully !');location.href='InvoiceEntry.aspx'", true);

        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Add the Items !')", true);
        }
 
      
    }

    protected void btnGetHSNCODE_Click(object sender, EventArgs e)
    {
        lblHSNCODE.Text = SqlObj.ExecuteScalar("select HSNCODE from MATERIALMASTER where MATERIALNAME='" + txtSearch.Text + "'");

    }
   public void ClearFrm()
    {
        txtPrice.Text = string.Empty;
        txtInvoiceQty.Text = string.Empty;
        txtTotalAmt.Text = string.Empty;
        txtTaxAmount.Text = string.Empty;
        txtGrandTotal.Text = string.Empty;
        rdWitoutTax.Checked = false;
        rdSTax.Checked = false;
        cmbPartMaster.SelectedIndex = 0;
     
    }
    protected void cmbPartMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        string q1 = "SELECT PRICE  FROM PARTMASTER  WHERE ID='" + cmbPartMaster.SelectedItem.Value + "'";
        txtPrice.Text = SqlObj.ExecuteScalar(q1);
        txtPrice.Enabled = false;
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
        string query = "SELECT ID,JOBID,PARTNO FROM PARTMASTER ORDER BY PARTNO ASC ";
        Dt = SqlObj.GetData_DT(query);
        cmbPartMaster.DataSource = Dt;
        cmbPartMaster.DataTextField = "PARTNO";
        cmbPartMaster.DataValueField = "ID";
        cmbPartMaster.DataBind();
        cmbPartMaster.Items.Insert(0, "Select");

    }
    public string GetINVOICENO()
    {
        string Q = "SELECT ISNULL(MAX((INVOICENO)+1),1) FROM INVOICENO";
        invoiceno = SqlObj.ExecuteScalar(Q);
        return invoiceno;
    }
    public void SaveTempQD()
    {

        DataTable DtFinaldata = new DataTable();

        if (Session["InvTable"] != null)
        {
            DtFinaldata = (DataTable)Session["InvTable"];

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
            DtFinaldata.Columns.Add("TAXPREFIX", typeof(string));
            DtFinaldata.Columns.Add("GST", typeof(decimal));
            DtFinaldata.Columns.Add("GRANDTOTAL", typeof(decimal));

            Dr["ID"] = cmbPartMaster.SelectedItem.Value;
            Dr["PARTNAME"] = cmbPartMaster.SelectedItem.Text;
            Dr["HSNCODE"] = lblHSNCODE.Text;
            Dr["UOM"] = "pcs";
            Dr["QTY"] = Convert.ToInt32(txtInvoiceQty.Text);
            Dr["PRICE"] = txtPrice.Text;
            Dr["TOTAL"] = txtTotalAmt.Text;
            if (rdSTax.Checked == true)
            {
                Dr["TAXPREFIX"] = "G";    // G Means GST
            }
            else if (rdWitoutTax.Checked == true)
            {
                Dr["TAXPREFIX"] = "E";   // E Means Empty Tax
            } 

          
            Dr["GST"] = txtTaxAmount.Text;
            Dr["GRANDTOTAL"] = txtGrandTotal.Text;

        }
        else
        {
            Dr["ID"] = cmbPartMaster.SelectedItem.Value;
            Dr["PARTNAME"] = cmbPartMaster.SelectedItem.Text;
            Dr["HSNCODE"] = lblHSNCODE.Text;
            Dr["UOM"] = "pcs";
            Dr["QTY"] = Convert.ToInt32(txtInvoiceQty.Text);
            Dr["PRICE"] = txtPrice.Text;
            Dr["TOTAL"] = txtTotalAmt.Text;
            if (rdSTax.Checked == true)
            {
                Dr["TAXPREFIX"] = "G";    // G Means GST
            }
            else if (rdWitoutTax.Checked == true)
            {
                Dr["TAXPREFIX"] = "E";   // E Means Empty Tax
            } 
            Dr["GST"] = txtTaxAmount.Text;
            Dr["GRANDTOTAL"] = txtGrandTotal.Text;

        }

        DtFinaldata.Rows.Add(Dr);
        Session["InvTable"] = DtFinaldata;

         LoadSubGrid();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert(' Items Added  !');location.href='InvoiceEntry.aspx'", true);



    }

    public void LoadSubGrid()
    {
        DataTable DTResult = (DataTable)Session["InvTable"];
        if (DTResult.Rows.Count > 0)
        {
            grdInvChild.DataSource = DTResult;
            grdInvChild.DataBind();

           
        }


    }


    protected void grdInvChild_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        DataTable dt1 = (DataTable)Session["InvTable"];
        // DataTable dt = new DataTable();
        if (dt1.Rows.Count > 0)
        {
            dt1.Rows[e.RowIndex].Delete();
            grdInvChild.DataSource = dt1;
            grdInvChild.DataBind();

        }


    }


   


    public int INVOICEUpdate()
    {
        string Q12 = "SELECT INVOICENO FROM INVOICENO WHERE SNO=1";
        invoiceno = SqlObj.ExecuteScalar(Q12);

        if (invoiceno != "")
        {
           IncNO  = Convert.ToInt32(invoiceno);
           IncNO += 1;
           string Q13 = "UPDATE INVOICENO SET INVOICENO=" + IncNO + " WHERE SNO=1";
            SqlObj.ExecuteNonQuery(Q13);
        }
        else
        {

            IncNO += 1;
            string Q14 = "INSERT INTO INVOICENO (SNO,INVOICENO)VALUES(1," + IncNO + ") ";
            SqlObj.ExecuteNonQuery(Q14);
        }

        return IncNO;

    }

    public void InsertInvoiceChild()
    {
       /* PLobj.INCid = objBL.Generate_INCCHID();
        PLobj.Id= cmbPartMaster.SelectedItem.Value;
        PLobj.Qty = Convert.ToInt32(txtInvoiceQty.Text);
        PLobj.UnitPrice =Convert.ToDecimal(txtPrice.Text);
        PLobj.TotalAmt = Convert.ToDecimal(txtTotalAmt.Text);
       
        

        PLobj.TaxAmt = Convert.ToDecimal(txtTaxAmount.Text);
        PLobj.GrandTotal = Convert.ToDecimal(txtGrandTotal.Text);
       
        objBL.InvoiceCHILD(PLobj);
        LoadInvoiceChild();
        ClearFrm();
        */

        DataTable DTResultFinal = (DataTable)Session["InvTable"];

     if (DTResultFinal.Rows.Count > 0)
     {
         foreach (DataRow Row in DTResultFinal.Rows)
         {
             PLobj.INCid = objBL.Generate_INCCHID();
             PLobj.Id = Convert.ToInt32(Convert.ToInt32(Row["ID"]));
             PLobj.HSNCode = Row["HSNCODE"].ToString();
             PLobj.UOM = Row["UOM"].ToString();
             PLobj.Qty =Convert.ToInt32(Row["QTY"]);
             PLobj.UnitPrice = Convert.ToDecimal(Row["PRICE"]);
             PLobj.TotalAmt = Convert.ToDecimal(Row["TOTAL"]);
             PLobj.TaxPrefix = Row["TAXPREFIX"].ToString();
             
             PLobj.TaxAmt = Convert.ToDecimal(Row["GST"]);
             PLobj.GrandTotal = Convert.ToDecimal(Row["GRANDTOTAL"]);
            

            K= objBL.InvoiceCHILD(PLobj);

         }

     
     }
              
    }








    public void Insert_InvoiceMaster()
    {
        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "dd-MM-yyyy";

            PLobj.INCid = objBL.Generate_INCCHID();
            PLobj.Vid = Convert.ToInt32(cmbVendoreName.SelectedItem.Value);
            PLobj.INCDate = Convert.ToDateTime(txtINCDt.Text, dateInfo);
            PLobj.InvoiceNO = Convert.ToInt32(txtInvoiceNo.Text);
            PLobj.PoNo = txtPONO.Text;
            PLobj.Podate = Convert.ToDateTime(txtPODt.Text, dateInfo);
            PLobj.CreatedDate = Convert.ToDateTime(CurrDt, dateInfo);
            PLobj.Enteredby = Session["UserName"].ToString();
            PLobj.Status = "N";

            K = objBL.InvoiceMaster(PLobj);
       
    
    }

    protected void txtInvoiceQty_TextChanged(object sender, EventArgs e)
        {
        decimal Tot;
        Tot=Convert.ToDecimal(txtPrice.Text) * Convert.ToInt32(txtInvoiceQty.Text);
        txtTotalAmt.Text = Convert.ToString(Tot);

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

            // GST Tax Calculation  : 15% 

            decimal TaxVal = Convert.ToDecimal(txtTotalAmt.Text) * 18 / 100;
            txtTaxAmount.Text = Convert.ToString(TaxVal);

            GTotal = Convert.ToDecimal(txtTotalAmt.Text) + Convert.ToDecimal(txtTaxAmount.Text);
            txtGrandTotal.Text = Convert.ToString(GTotal);

        }


    }


    public void LoadInvoiceChild()
    {
        string Q7 = "SELECT I.INCCHID,P.PARTNO,P.DESCRIPTION,I.INCID,I.PRICE,I.QTY,I.TOTAL,I.TAXAMT,I.GRNDTOTAL,I.STATUS  FROM INVOICECHILD AS I INNER JOIN PARTMASTER AS P ON I.JOBID=P.JOBID WHERE STATUS='N'";
        Dt = SqlObj.GetData_DT(Q7);
       grdInvChild.DataSource = Dt;
       grdInvChild.DataBind();
        

    }


}
