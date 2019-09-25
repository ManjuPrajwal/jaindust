<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="InwardDetailsView.aspx.cs" Inherits="InwardDetailsView" Title="Inward Details View"%>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="Gridstyle.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <br />
   <div align="center">
   <asp:ImageButton ID="ImgBtn"  PostBackUrl="~/MaterialInwardView.aspx"  runat="server" ImageUrl="~/Images/back-icon.png" Width="30" Height="30"  ToolTip="Back to InwardView"/>
   
   

     <div id="wrapper">
    <div id="page-wrapper7">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Inward Details View</h3>
                        </div>
                        <div class="panel-body">
                        
                            
                            
                            <div  style="overflow:scroll; height:370px; width:740px; background-color:White">
                   <asp:GridView ID="grdInwardDetailsView" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="5000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="MID" AllowSorting="True" ShowFooter="true"
                                    onrowdatabound="grdInwardDetailsView_RowDataBound">
                                           
                        <Columns>
                           <asp:TemplateField HeaderText="SNo">
                              <ItemTemplate>
                              <%#Container.DataItemIndex+1 %>
                              </ItemTemplate>
                              </asp:TemplateField>
                        <asp:TemplateField HeaderText="MID" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblMId" runat="server" Text='<%#Eval("MID")%>'></asp:Label>
                        
                          </ItemTemplate>
                          </asp:TemplateField>
                        
                          <asp:TemplateField HeaderText="JobId" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblJobId" runat="server" Text='<%#Eval("JOBID")%>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                          <asp:TextBox ID="txtJobId" runat="server" Text='<%#Eval("JOBID")%>'></asp:TextBox>
                          
                          </EditItemTemplate>
                          </asp:TemplateField>
                          
                        
                          <asp:TemplateField HeaderText="PONO">
                          <ItemTemplate>
                          <asp:Label id="lblPONO" runat="server" Text='<%#Eval("PONO")%>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                          <asp:TextBox ID="txtPONO" runat="server" Text='<%#Eval("PONO")%>'></asp:TextBox>
                          
                          </EditItemTemplate>
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
                          <asp:Label id="lblQty" runat="server" Text='<%#Eval("QTY")%>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                          <asp:TextBox ID="txtQty" runat="server" Text='<%#Eval("QTY")%>'></asp:TextBox>
                          
                          </EditItemTemplate>
                          <FooterTemplate> 
                            <asp:Label ID="lblGTotQty" runat="server" />
                           </FooterTemplate>
                          
                          
                          </asp:TemplateField>
                          
                          <asp:TemplateField HeaderText="VendorName">
                          <ItemTemplate>
                          <asp:Label id="lblVendorName" runat="server" Text='<%#Eval("VENDORNAME")%>'></asp:Label>
                          </ItemTemplate>
                          
                          </asp:TemplateField>
                             
                           
                          <asp:TemplateField HeaderText="InwardDt">
                          <ItemTemplate>
                          <asp:Label id="lblInwardDt" runat="server" Text='<%#Eval("INWARD_DT","{0:dd/MM/yyyy}")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                             
                         
                         <%-- <asp:TemplateField HeaderText="Remove" ItemStyle-Width="30px">
                            <ItemTemplate>
                            <asp:ImageButton id="btnItemRemove"   ImageUrl="~/images/Alarm-Error-icon.png" width="20px" runat="server" CommandArgument='<%#Eval("VENDORID") %>' CommandName="REMOVE"></asp:ImageButton>
                            </ItemTemplate>
                            <ItemStyle Width="30px" />
                           </asp:TemplateField>         --%> 
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

