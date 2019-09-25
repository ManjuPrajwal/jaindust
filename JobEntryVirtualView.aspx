<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="JobEntryVirtualView.aspx.cs" Inherits="JobEntryVirtualView" Title="Job Entry View"%>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="Gridstyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <br />
     <div align="center">           
     PartNo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="cmbPartMaster" AutoPostBack="true" Width="180px"  runat="server" 
             onselectedindexchanged="cmbPartMaster_SelectedIndexChanged"></asp:DropDownList>
     
                           
                            
   
   <div id="wrapper">
    <div id="page-wrapper7">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">JobEntry View</h3>
                        </div>
                        <div class="panel-body">
                 
                            
                            
                            
                            <div  style="overflow:scroll; height:370px; width:737px; background-color:White">
                   <asp:GridView ID="grdJobEntryVView" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="50000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="VIRUTALID" ShowFooter="true" AllowSorting="True" onrowdatabound="grdJobEntryVView_RowDataBound"
                           > 
           
                                           
                        <Columns>
                              <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>

                        <asp:TemplateField HeaderText="Id" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblId" runat="server" Text='<%#Eval("VIRUTALID")%>'></asp:Label>
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
           
                          <asp:TemplateField HeaderText="Description">
                          <ItemTemplate>
                          <asp:Label id="lblDescription" runat="server" Text='<%#Eval("DESCRIPTION")%>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                          <asp:TextBox ID="txtDescription" runat="server" Text='<%#Eval("DESCRIPTION")%>'></asp:TextBox>
                          
                          </EditItemTemplate>
                          </asp:TemplateField>
                             
                          <asp:TemplateField HeaderText="Qty">
                          <ItemTemplate>
                          <asp:Label id="lblQty" runat="server" Text='<%#Eval("TOTCOUNT")%>'></asp:Label>
                          </ItemTemplate>
                          
                           <FooterTemplate> 
                            <asp:Label ID="lblGTotQty" runat="server" />
                           </FooterTemplate>
                                                 
                          </asp:TemplateField>
                          
                          <asp:TemplateField HeaderText="CreateDt">
                          <ItemTemplate>
                          <asp:Label id="lblUpdateDt" runat="server" Text='<%#Eval("UPDATEDDT","{0:dd/MM/yyyy}")%>'></asp:Label>
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
                    </div>
                </div>
            </div>
            
        
        </div>
   </div>
 </div>
  </ContentTemplate>
  </asp:UpdatePanel>

</asp:Content>

