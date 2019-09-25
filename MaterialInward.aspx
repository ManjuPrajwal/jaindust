<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MaterialInward.aspx.cs" Inherits="MaterialInward" Title="MaterialInward Page" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="Gridstyle.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="Javascripts/Common.js"></script>
<script type="text/javascript">
       function Validat()
       {
           if (document.getElementById("<%=txtPONO.ClientID%>").value == "")
           {
               alert("Enter The PoNo");
               document.getElementById("<%=txtPONO.ClientID%>").focus();

               return false;
           }
           if (document.getElementById("<%=txtPODt.ClientID%>").value == "") {
               alert("Enter The Po Date");
               document.getElementById("<%=txtPODt.ClientID%>").focus();

               return false;
           }
           
           
        
        
       }


   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
   
   <div align="center">
   <div id="wrapper">
    <div id="page-wrapper7">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Material Inward </h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart3">
                                 VendoreName&nbsp;<asp:DropDownList ID="cmbVendoreName" Width="173px"  runat="server"></asp:DropDownList>
                                  PONO &nbsp;&nbsp;&nbsp;  <asp:TextBox ID="txtPONO"   runat="server"></asp:TextBox>
                                  PO Date &nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPODt" Width="120" runat="server"></asp:TextBox >
                                  <asp:CalendarExtender id="ceAttDt"  runat="server" Format="dd-MM-yyyy"  TargetControlID="txtPODt" PopupButtonID="txtPODt"></asp:CalendarExtender>
                                 
                                 </div>
                                     <div id="Div1">
                                BillNo/RefNo&nbsp;<asp:TextBox ID="txtBillNo" runat="server"></asp:TextBox><asp:CalendarExtender id="CalendarExtender1"  runat="server" Format="dd-MM-yyyy"  TargetControlID="txtEntryDt" PopupButtonID="txtEntryDt"></asp:CalendarExtender>
                                   Remarks&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox>Inward Date <asp:TextBox ID="txtEntryDt" Width="120" runat="server"></asp:TextBox >
                                     </div>
                                     <div style=" font-size:medium;color:Teal">      Adding Items</div>
                                     <div id="Div3">
                                   
                     PartNo&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="cmbPartMaster" Width="180px"  runat="server"></asp:DropDownList>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              Total Qty &nbsp;&nbsp;
                              <asp:TextBox ID="txtTotalQty" MaxLength="6" onKeyPress="return checkNumber(event)" Width="90px"  runat="server"></asp:TextBox>  
                               <asp:ImageButton runat="server" ID="imbtnAddItems" ImageUrl="~/Images/Add-icon.png" ToolTip="Add The Items"
                                        Width="27" Height="25" onclick="imbtnAddItems_Click" />    
                                 </div>
                                
                          
                            
                           <div>
             
                            <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Images/save.png" Width="45px" Height="30" OnClientClick="return Validat()" OnClick="btnSave_Click" />

                            </div>
                            
                    
       
                        </div>
                    </div>
                </div>
            </div>
            
        
        </div>
   </div>
    
                        <div align="center">
                            
                    <div  style="overflow:scroll; height:100px; width:750px; background-color:White">
                   <asp:GridView ID="grdITEMView" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="5000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="CHID" AllowSorting="True" ShowFooter="true" 
                           onrowcommand="grdITEMView_RowCommand" onrowdatabound="grdITEMView_RowDataBound"> 
                         
                         
                                           
                        <Columns>
                          <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>
                        <asp:TemplateField HeaderText="ChID" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblCHId" runat="server" Text='<%#Eval("CHID")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                            <asp:TemplateField HeaderText="JOID" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblJobId" runat="server" Text='<%#Eval("JOBID")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                        
                        
                        
                          <asp:TemplateField HeaderText="PartNo">
                          <ItemTemplate>
                          <asp:Label id="lblPartNo" runat="server" Text='<%#Eval("PARTNO")%>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                          <asp:TextBox ID="txtPartNo" runat="server" Text='<%#Eval("PARTNO")%>'></asp:TextBox>
                          
                          </EditItemTemplate>
                          </asp:TemplateField>
                          
                          <asp:TemplateField HeaderText="Qty">
                          <ItemTemplate>
                          <asp:Label id="lblQty" runat="server" Text='<%#Eval("QTY")%>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                          <asp:TextBox ID="txtQty" runat="server" Text='<%#Eval("QTY")%>'></asp:TextBox>
                          </EditItemTemplate>
                          <FooterTemplate>
                            <asp:Label ID="lblGTotQty" runat="server" />
                           </FooterTemplate>
                          
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="InwardDt">
                          <ItemTemplate>
                          <asp:Label id="lblInwardDt" runat="server" Text='<%#Eval("INWARD_DT","{0:dd/MM/yyyy}")%>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                          <asp:TextBox ID="txtInwardDt" runat="server" Text='<%#Eval("INWARD_DT","{0:dd/MM/yyyy}")%>'></asp:TextBox>
                          </EditItemTemplate>
                          </asp:TemplateField>
            
                          
                       
                         <asp:TemplateField HeaderText="Remove" ItemStyle-Width="30px">
                            <ItemTemplate>
                            <asp:ImageButton id="btnItemRemove"   ImageUrl="~/images/Alarm-Error-icon.png" width="20px" runat="server" CommandArgument='<%#Eval("CHID") %>' CommandName="REMOVE"></asp:ImageButton>
                            </ItemTemplate>
                            <ItemStyle Width="30px" />
                           </asp:TemplateField>
                                    
                        </Columns>
                                     
                        <PagerStyle CssClass="pgr" />
                        <AlternatingRowStyle CssClass="alt" />
                   
                  </asp:GridView>
                  </div>
                     </ContentTemplate>
                     </asp:UpdatePanel>                               
                                
</asp:Content>

