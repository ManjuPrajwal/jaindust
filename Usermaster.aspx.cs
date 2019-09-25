using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using CLS_BL;
using CLS_DL;

public partial class Usermaster : System.Web.UI.Page
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

        if(!IsPostBack)
        {
            LoadUserMaster();
        
        }


    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {

        SaveUsermaster();
            
    }

    public void SaveUsermaster()
    {

        System.Globalization.DateTimeFormatInfo dateInfo = new DateTimeFormatInfo();
        dateInfo.ShortDatePattern = "dd-MM-yyyy";
        Today = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy"), dateInfo);

        PLobj.strUserName = txtUserName.Text;
        PLobj.strPassword = txtPassword.Text;
        PLobj.CurrDt = Today;
        _INS = objBL.InsertUserMaster(PLobj);
        if (_INS > 0)
        {


            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Record Saved Successfully !');location.href='Usermaster.aspx'", true);
           
            LoadUserMaster();
            txtPassword.Text = "";
            txtUserName.Text = "";


        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('Failed !')", true);
        }
          
    
    }


    protected void lnkDelete_Click(object sender, EventArgs e)
    {

        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow Grvrow = lnkbtn.NamingContainer as GridViewRow;
        int Didd = Convert.ToInt32(grdUserMaster.DataKeys[Grvrow.RowIndex].Value.ToString());
        string DeptName = Grvrow.Cells[0].Text;
        string Query = "delete from USERMASTER where UID='" + Didd + "'";
        SqlObj.ExecuteNonQuery(Query);
        LoadUserMaster();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "alert('User Deleted!');location.href='Usermaster.aspx'", true);

    }

    protected void grdUserMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (DataControlRowType.DataRow == e.Row.RowType)
        {
            ((LinkButton)e.Row.FindControl("lnkDelete"))
                .Attributes.Add("onclick", "return confirm('Are you sure?')");

        }

    }


    public void LoadUserMaster()
    {
        string Query = "SELECT  UID,USERNAME FROM USERMASTER ORDER BY USERNAME ASC";
        Dt=SqlObj.GetData_DT(Query);
        grdUserMaster.DataSource = Dt;
        grdUserMaster.DataBind();
               
    }




}