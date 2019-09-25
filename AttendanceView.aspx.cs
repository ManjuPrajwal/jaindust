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

public partial class AttendanceView : System.Web.UI.Page
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
    string Present, Absent, Leave;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LoadAtt_View();
            LoadEmpName();
            txtStartDt.Text = CurrDt;
            txtEndDt.Text = CurrDt;
        }

    }

    public void LoadAtt_View()
    {
        string Query = "SELECT * FROM ATTENDANCEMASTER ORDER BY ATT_DT DESC";    
           Dt=SqlObj.GetData_DT(Query);
           grdAttView.DataSource = Dt;
           grdAttView.DataBind();
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


    protected void cmbEmpName_SelectedIndexChanged(object sender, EventArgs e)
    {

        string Query = "select * from   ATTENDANCEMASTER  where ATT_DT between '"+txtStartDt.Text+"' and '"+txtEndDt.Text+"' and EMPNAME='"+cmbEmpName.SelectedItem.Text+"'";
        Dt = SqlObj.GetData_DT(Query);
        grdAttView.DataSource = Dt;
        grdAttView.DataBind();

        
        string q1="select count(*) from   ATTENDANCEMASTER  where ATT_DT between '"+txtStartDt.Text+"' and '"+txtEndDt.Text+"' and EMPNAME='"+cmbEmpName.SelectedItem.Text+"' and STATUS='Present'";
        Present=SqlObj.ExecuteScalar(q1);
        lblPresent.Text = Present;

        string q2 = "select count(*) from   ATTENDANCEMASTER  where ATT_DT between '" + txtStartDt.Text + "' and '" + txtEndDt.Text + "' and EMPNAME='" + cmbEmpName.SelectedItem.Text + "' and STATUS='Absent'";
        Absent = SqlObj.ExecuteScalar(q2);
        lblAbsent.Text = Absent;

        string q3 = "select count(*) from   ATTENDANCEMASTER  where ATT_DT between '" + txtStartDt.Text + "' and '" + txtEndDt.Text + "' and EMPNAME='" + cmbEmpName.SelectedItem.Text + "' and STATUS='Leave'";
        Leave = SqlObj.ExecuteScalar(q3);
        lblLeave.Text = Leave;



    }
}
