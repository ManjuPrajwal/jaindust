<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="EmployeeMaster.aspx.cs" Inherits="EmployeeMaster" Title="EmployeeMaster Page" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="Javascripts/Common.js"></script>
<script type="text/javascript">
       function Validat()
       {
           if (document.getElementById("<%=txtEmployeeName.ClientID%>").value == "")
           {
               alert("Enter The Employee Name");
               document.getElementById("<%=txtEmployeeName.ClientID%>").focus();

               return false;
           }
           if (document.getElementById("<%=txtMobileNo.ClientID%>").value == "")
           {
               alert("Enter The MobileNo");
               document.getElementById("<%=txtMobileNo.ClientID%>").focus();

               return false;
           }

           if (document.getElementById("<%=txtPlace.ClientID%>").value == "") {
               alert("Enter The Place");
               document.getElementById("<%=txtPlace.ClientID%>").focus();

               return false;
           }
           if (document.getElementById("<%=txtSalary.ClientID%>").value == "") {
               alert("Enter Salary");
               document.getElementById("<%=txtSalary.ClientID%>").focus();

               return false;
           }
          
          
       }


   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>


                    <br />
                   <div id="Div3">
                    <asp:ImageButton ID="ImageButton2"  PostBackUrl="~/EmployeeMasterView.aspx"  runat="server" ImageUrl="~/Images/view-icon.png" Width="30" Height="30"  ToolTip="EmployeeList View"/>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:ImageButton ID="imgImageAttendance"  PostBackUrl="~/Attendance.aspx" runat="server" ImageUrl="~/Images/attendance.png" Width="30" Height="30"  ToolTip="Click For Attendance"/>
                                               
                   </div>


<div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Employee Master</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart3">
                                Employee Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox>
                                                 
                            </div>
                             <div id="shieldui-chart3">
                               Mobile No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:TextBox ID="txtMobileNo" runat="server"  onKeyPress="return checkNumber(event)" MaxLength="10"></asp:TextBox></div>
                            <div>
                            
                            <div id="shieldui-chart3">
                                Place&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtPlace" runat="server"></asp:TextBox>
                                             
                            </div>
                            <div id="shieldui-chart3">
                                Salary&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;
                                <asp:TextBox ID="txtSalary" runat="server" MaxLength="5"  onKeyPress="return checkNumber(event)" ></asp:TextBox>
                                             
                            </div>
                            
                      
         <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Images/save.png" Width="45px" Height="30" OnClientClick="return Validat()" OnClick="btnSave_Click" />

                            </div>
               
                        </div>
                    </div>
                </div>
            </div>
            
        
        </div>
   </div>
   </ContentTemplate>
   </asp:UpdatePanel>

</asp:Content>

