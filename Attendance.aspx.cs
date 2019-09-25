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



public partial class Attendance : System.Web.UI.Page
{
    int K = 0;
    DataTable Dt = new DataTable();
    SQLDB SqlObj = new SQLDB();
    BLTaxi objBL = new BLTaxi();
    PLTaxi PLobj = new PLTaxi();
    DateTime Today;
    int _INS = 0;
    string CurrDt = DateTime.Now.Date.ToString("yyyy-MM-dd");
    string CHK;

   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadEmpName();
            txtAttDt.Text = CurrDt;

        }
        
    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {

        if (cmbAttendance.SelectedItem.Text == "Select" || cmbEmpName.SelectedItem.Text == "Select" || cmbShift.SelectedItem.Text == "Select")
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('You Must Select All Categories!');location.href='Attendance.aspx'", true);
        }
        else
        {

            string Query = "SELECT EMPNAME FROM ATTENDANCEMASTER WHERE  EMPNAME='" + cmbEmpName.SelectedItem.Text + "' AND  ATT_DT='" +txtAttDt.Text + "'";

            CHK = SqlObj.ExecuteScalar(Query);
            if (CHK != "")
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Attendance Added Already!');location.href='Attendance.aspx'", true);
            }
            else
            {

                System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
                dateInfo.ShortDatePattern = "dd-MM-yyyy";

       
                PLobj.EmpName = cmbEmpName.SelectedItem.Text;
                PLobj.Shift = cmbShift.SelectedItem.Text;
                PLobj.Status = cmbAttendance.SelectedItem.Text;
                PLobj.Att_Date = Convert.ToDateTime(txtAttDt.Text,dateInfo);
                PLobj.Enteredby = Session["UserName"].ToString();
                objBL.InsertAttendance(PLobj);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Attendance Saved !');location.href='Attendance.aspx'", true);

            }


        }



        
    }
    public void LoadEmpName()
    {
        string Query = "SELECT EMPNAME FROM  EMPMASTER ORDER BY EMPNAME ASC";
        Dt = SqlObj.GetData_DT(Query);
        cmbEmpName.DataSource = Dt;

        cmbEmpName.DataTextField = "EMPNAME";
        cmbEmpName.DataValueField = "EMPNAME";
        cmbEmpName.DataBind();
        cmbEmpName.Items.Insert(0, "Select");
    
    }

}
