<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="DCMasterDetailsView.aspx.cs" Inherits="DCMasterDetailsView" Title="DC Master Details View" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="Gridstyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  
  <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <br />
    <div align="center">
    
   <asp:ImageButton ID="ImgBtn"  PostBackUrl="~/DCMasterView.aspx"  runat="server" ImageUrl="~/Images/back-icon.png" Width="30" Height="30"  ToolTip="Back to DC Master View"/>
    <div id="wrapper">
    <div id="page-wrapper7">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Dc Details View</h3>
                        </div>
                        <div class="panel-body">
                        
                            
                            
                            <div  style="overflow:scroll; height:370px; width:740px; background-color:White">
                   <asp:GridView ID="grdDCDetailsView" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="5000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="DCHID" AllowSorting="True" ShowFooter="true" onrowdatabound="grdDCDetailsView_RowDataBound"
                                  >
                                           
                        <Columns>
                           <asp:TemplateField HeaderText="SNo">
                              <ItemTemplate>
                              <%#Container.DataItemIndex+1 %>
                              </ItemTemplate>
                              </asp:TemplateField>
                        <asp:TemplateField HeaderText="DCHID" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblDCHID" runat="server" Text='<%#Eval("DCHID")%>'></asp:Label>
                        
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                          <asp:TemplateField HeaderText="DCNO">
                          <ItemTemplate>
                          <asp:Label id="lblDCNO" runat="server" Text='<%#Eval("DCNO")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                        
                          <%--<asp:TemplateField HeaderText="JobId" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblJobId" runat="server" Text='<%#Eval("JOBID")%>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                          <asp:TextBox ID="txtJobId" runat="server" Text='<%#Eval("JOBID")%>'></asp:TextBox>
                          
                          </EditItemTemplate>
                          </asp:TemplateField>
                          --%>
                        
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
                          
                          <asp:TemplateField HeaderText="DCQty">
                          <ItemTemplate>
                          <asp:Label id="lblDCQty" runat="server" Text='<%#Eval("DC_QTY")%>'></asp:Label>
                          </ItemTemplate>
                          <FooterTemplate> 
                            <asp:Label ID="lblGTotQty" runat="server" />
                           </FooterTemplate>
                          
                          
                          </asp:TemplateField>
                          <%--
                          <asp:TemplateField HeaderText="VendorName">
                          <ItemTemplate>
                          <asp:Label id="lblVendorName" runat="server" Text='<%#Eval("VENDORNAME")%>'></asp:Label>
                          </ItemTemplate>
                          
                          </asp:TemplateField>
                             --%>
                           
                          <asp:TemplateField HeaderText="InDCDt">
                          <ItemTemplate>
                          <asp:Label id="lblDCDt" runat="server" Text='<%#Eval("DCDATE","{0:dd/MM/yyyy}")%>'></asp:Label>
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

