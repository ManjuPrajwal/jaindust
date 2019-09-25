<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Attendance" Title="Employee Attendance" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <br />
 

  
  <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    
    
    
   <div id="Div3">
   <asp:ImageButton ID="ImageButton1"  PostBackUrl="~/AttendanceView.aspx"  runat="server" ImageUrl="~/Images/view-icon.png" Width="30" Height="30"  ToolTip="Attendance View"/>
   </div>


   <div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Employee Attendance</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart3">
                                Emp Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="cmbEmpName" AutoPostBack="true" Width="120px" runat="server"></asp:DropDownList>
                            </div>
                             <div id="shieldui-chart3">
                               Shift&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:DropDownList ID="cmbShift" runat="server" Width="120px">
                       <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                       <asp:ListItem Value="1" Text="I Shift"></asp:ListItem>
                       <asp:ListItem Value="2" Text="II Shift"></asp:ListItem>
                       <asp:ListItem Value="3" Text="II Shift"></asp:ListItem>
                       </asp:DropDownList>
                       </div>
                       
                             <div id="shieldui-chart3">
                               Attendance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:DropDownList ID="cmbAttendance" runat="server" Width="120px">
                       <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                       <asp:ListItem Value="1" Text="Present"></asp:ListItem>
                       <asp:ListItem Value="2" Text="Absent"></asp:ListItem>
                       <asp:ListItem Value="3" Text="Leave"></asp:ListItem>
                       </asp:DropDownList>
                       
                                         
                       
                       </div>
                       <div>
                       Attendance Dt &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       &nbsp;&nbsp;&nbsp;

                        <asp:TextBox ID="txtAttDt" Width="120" runat="server"></asp:TextBox >
                                  <asp:CalendarExtender id="ceAttDt"  runat="server" Format="yyyy-MM-dd"  TargetControlID="txtAttDt" PopupButtonID="txtAttDt"></asp:CalendarExtender>
                           
                       </div>
                       
                       
                       
                            <div>
                            
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         
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

