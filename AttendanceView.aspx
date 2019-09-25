<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AttendanceView.aspx.cs" Inherits="AttendanceView" Title="AttendanceView Page" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="Gridstyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
 <div align="center">
 
 
     <div>
        &nbsp;&nbsp;&nbsp;
        Start Date          
        <asp:TextBox ID="txtStartDt" Width="120" runat="server"></asp:TextBox >
        <asp:CalendarExtender id="ceAttDt"  runat="server" Format="yyyy-MM-dd"  TargetControlID="txtStartDt" PopupButtonID="txtStartDt"></asp:CalendarExtender>
        End Date          
        <asp:TextBox ID="txtEndDt" Width="120" runat="server"></asp:TextBox >
        <asp:CalendarExtender id="CalendarExtender1"  runat="server" Format="yyyy-MM-dd"  TargetControlID="txtEndDt" PopupButtonID="txtEndDt"></asp:CalendarExtender>
        Emp Name 
        <asp:DropDownList ID="cmbEmpName" AutoPostBack="true" Width="120px" 
             runat="server" onselectedindexchanged="cmbEmpName_SelectedIndexChanged"></asp:DropDownList>
                           
                           
                   
       </div>
 
<asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
   
   <div id="wrapper">
    <div id="page-wrapper5">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Attendance View</h3>
                        </div>
                        <div class="panel-body">
                 
                            
                            <div  style="overflow:scroll; height:370px; width:337px; background-color:White">
                   <asp:GridView ID="grdAttView" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="50000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="ATTID">
                           
                           
                                           
                        <Columns>
                              <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>

                        <asp:TemplateField HeaderText="Id" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblId" runat="server" Text='<%#Eval("ATTID")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                        
                        
                          <asp:TemplateField HeaderText="EmpName">
                          <ItemTemplate>
                          <asp:Label id="lblEmpName" runat="server" Text='<%#Eval("EMPNAME")%>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                          <asp:TextBox ID="txtEmpName" runat="server" Text='<%#Eval("EMPNAME")%>'></asp:TextBox>
                          
                          </EditItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Shift">
                          <ItemTemplate>
                          <asp:Label id="lblMobileNo" runat="server" Text='<%#Eval("SHIFT")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                          <asp:TemplateField HeaderText="AttStatus">
                          <ItemTemplate>
                          <asp:Label id="lblAtt_Status" runat="server" Text='<%#Eval("STATUS")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                             
                          <asp:TemplateField HeaderText="Att_Dt">
                          <ItemTemplate>
                          <asp:Label id="lblAtt_Dt" runat="server" Text='<%#Eval("ATT_DT" ,"{0:dd/MM/yyyy}")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                          
                       <%--
                         <asp:TemplateField HeaderText="Remove" ItemStyle-Width="30px">
                            <ItemTemplate>
                            <asp:ImageButton id="btnItemRemove"   ImageUrl="~/images/Alarm-Error-icon.png" width="20px" runat="server" CommandArgument='<%#Eval("VENDORID") %>' CommandName="REMOVE"></asp:ImageButton>
                            </ItemTemplate>
                            <ItemStyle Width="30px" />
                           </asp:TemplateField> --%>
                                    
                        </Columns>
                                     
                        <PagerStyle CssClass="pgr" />
                        <AlternatingRowStyle CssClass="alt" />
                   
                  </asp:GridView>
      
                  </div>
                  </div>
                    <div align="left" style="color:Blue">
       PRESENT - <asp:Label ID="lblPresent" runat="server" ForeColor="Red"></asp:Label><br />
       ABSENT  - <asp:Label ID="lblAbsent" runat="server"></asp:Label><br />
       LEAVE - <asp:Label ID="lblLeave" runat="server"></asp:Label>
   </div>
 
              
                            
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

