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


public partial class JobEntry : System.Web.UI.Page
{
    int K = 0;
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    string CHK;
    Int32 Val1;
    Int32 Result;

    string CurrDt = DateTime.Now.Date.ToString("dd-MM-yyyy");


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LoadEmpName();
            LoadPartMaster();
            txtEntryDt.Text = CurrDt;
        }

        
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (cmbEmpName.SelectedItem.Text == "Select" || cmbPartMaster.SelectedItem.Text == "Select")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('You Must Select Categories !')", true);

        }
        else
        {
            InsertJobMaster();
            VirtualCount();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Record Inserted !');location.href='JobEntry.aspx'", true);       
        }


    }
    public void InsertJobMaster()
    {
        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "dd-MM-yyyy";

        PLobj.Id = Convert.ToInt32(cmbEmpName.SelectedItem.Value);
        PLobj.Jobid = cmbPartMaster.SelectedItem.Value;
        PLobj.EmpName = cmbEmpName.SelectedItem.Text;
        PLobj.Qty =Convert.ToInt32(txtToalNos.Text);
        PLobj.CreatedDate = Convert.ToDateTime(txtEntryDt.Text, dateInfo);
        PLobj.Enteredby = Session["UserName"].ToString();
        objBL.InsertJobEntryMaster(PLobj);

    
    }
    public void VirtualCount()
    {


        System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "dd-MM-yyyy";

            

        string Query = "SELECT TOTCOUNT FROM VIRTUALCOUNT WHERE JOBID='"+cmbPartMaster.SelectedItem.Value+"' ";
        CHK = SqlObj.ExecuteScalar(Query);
        if (CHK != "")
        {
            Val1 = Convert.ToInt32(CHK);
            Result=Val1 + Convert.ToInt32(txtToalNos.Text);
            string q1 = "UPDATE VIRTUALCOUNT SET TOTCOUNT=" + Result + ",UPDATEDDT='"+Convert.ToDateTime(CurrDt,dateInfo)+"' WHERE JOBID='" + cmbPartMaster.SelectedItem.Value + "' ";
            SqlObj.ExecuteNonQuery(q1);
        }
        else
        {

            PLobj.Jobid = cmbPartMaster.SelectedItem.Value;
            PLobj.Totcount = Convert.ToInt32(txtToalNos.Text);
            PLobj.CreatedDate = Convert.ToDateTime(txtEntryDt.Text, dateInfo);
            objBL.InsertVirtualCount(PLobj);
        
        }
        
        
    }

    public void LoadEmpName()
    {
        string Query = "SELECT EMPNAME,ID FROM  EMPMASTER ORDER BY EMPNAME ASC";
        Dt = SqlObj.GetData_DT(Query);
        cmbEmpName.DataSource = Dt;

        cmbEmpName.DataTextField = "EMPNAME";
        cmbEmpName.DataValueField = "ID";
        cmbEmpName.DataBind();
        cmbEmpName.Items.Insert(0, "Select");

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


}
