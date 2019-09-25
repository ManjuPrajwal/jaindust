<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="JobEntry.aspx.cs" Inherits="JobEntry" Title="Daily Job Entry"%>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="Javascripts/Common.js"></script>
<script type="text/javascript">
       function Validat()
       {
           if (document.getElementById("<%=txtToalNos.ClientID%>").value == "")
           {
               alert("Enter The Total Nos");
               document.getElementById("<%=txtToalNos.ClientID%>").focus();

               return false;
           }
           if (document.getElementById("<%=txtEntryDt.ClientID%>").value == "") {
               alert("Enter The Date");
               document.getElementById("<%=txtEntryDt.ClientID%>").focus();

               return false;
           }
          
       }


   </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div align="center">


                    <br />
                   <div id="Div3">
                    <asp:ImageButton ID="ImageButton2"  PostBackUrl="~/JobEntryView.aspx"  runat="server" ImageUrl="~/Images/view-icon.png" Width="30" Height="30"  ToolTip=" Daily JobEntry View"/>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:ImageButton ID="imgImag"  PostBackUrl="~/JobEntryVirtualView.aspx" runat="server" ImageUrl="~/Images/view-icon.png" Width="30" Height="30"  ToolTip="Job Entry View"/>
                                               
                   </div>


<div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Daily Job Entry</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart3">
                                
                                
                                Emp Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="cmbEmpName" AutoPostBack="true" Width="180px" runat="server"></asp:DropDownList>
                                
                            </div>
                                                 
                     
                             <div id="shieldui-chart3">
                                 PartNo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:DropDownList ID="cmbPartMaster" Width="180px"  runat="server"></asp:DropDownList>
                                  </div> 
                           
                            
                            <div id="shieldui-chart3">
                                Total No's&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtToalNos" runat="server" MaxLength="5" Width="180px"  onKeyPress="return checkNumber(event)" ></asp:TextBox>
                                             
                            </div>
                            
                             <div id="shieldui-chart3">
                               Entry Dt &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:TextBox ID="txtEntryDt" Width="180px" runat="server"></asp:TextBox >
                                  <asp:CalendarExtender id="ceAttDt"  runat="server" Format="dd-MM-yyyy"  TargetControlID="txtEntryDt" PopupButtonID="txtEntryDt"></asp:CalendarExtender>
                           
                           </div>
                            
                           
                     <div>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Images/save.png" Width="45px" Height="30" OnClientClick="return Validat()" OnClick="btnSave_Click" />

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

