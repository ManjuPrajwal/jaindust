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


public partial class EmployeeMasterView : System.Web.UI.Page
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
            LoadEmpView();
        }

    }
    public void LoadEmpView()
    {
        string Query = "SELECT * FROM EMPMASTER  ORDER BY EMPNAME";
        Dt = SqlObj.GetData_DT(Query);
        grdEmpView.DataSource = Dt;
        grdEmpView.DataBind();         
    }
    protected void grdEmpView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        grdEmpView.EditIndex = -1;
        LoadEmpView();

    }
    protected void grdEmpView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void grdEmpView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        GridViewRow grvRow = (GridViewRow)grdEmpView.Rows[e.RowIndex];
        Label lblDeleteId = (Label)grvRow.FindControl("lblId");
        string Query = "delete from EMPMASTER where ID='" + lblDeleteId.Text + "'";
        SqlObj.ExecuteNonQuery(Query);
        LoadEmpView();

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Employee Deleted !');location.href='EmployeeMasterView.aspx'", true);
    }
    protected void grdEmpView_RowEditing(object sender, GridViewEditEventArgs e)
    {

        grdEmpView.EditIndex = e.NewEditIndex;
        LoadEmpView();
    }
    protected void grdEmpView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        GridViewRow grvRow = (GridViewRow)grdEmpView.Rows[e.RowIndex];
        Label lbl = (Label)grvRow.FindControl("lblId");
        TextBox TxtEmpName = (TextBox)grvRow.FindControl("txtEmpName");
        TextBox TxtMobileNo = (TextBox)grvRow.FindControl("txtMobileNo");
        TextBox TxtPlace = (TextBox)grvRow.FindControl("txtPlace");
        TextBox TxSalary = (TextBox)grvRow.FindControl("txtSalary");
        grdEmpView.EditIndex = -1;
        string Query = "Update EMPMASTER set EMPNAME='" + TxtEmpName.Text + "',MOBILENO="+ Convert.ToDouble(TxtMobileNo.Text) +" ,SALARY="+ Convert.ToDecimal(TxSalary.Text )+ ",PLACE='" + TxtPlace.Text + "' where ID='" + lbl.Text + "' ";
        SqlObj.ExecuteNonQuery(Query);
        LoadEmpView();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Employee Updated !');location.href='EmployeeMasterView.aspx'", true);

    }   



}
