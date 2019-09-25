<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="InvoiceView.aspx.cs" Inherits="InvoiceView" Title="Invoice View" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="Gridstyle.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
  <%-- <div id="Div3">                
    <asp:ImageButton ID="ImageButton1" PostBackUrl="~/StockView.aspx"  runat="server" ImageUrl="~/Images/app-stock-icon.png" Width="30" Height="30"  ToolTip="Over ALL Stock View"/>
             
   </div>--%>
   <div align="center">
   <div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"> Invoice View</h3>
                        </div>
                        <div class="panel-body">
                        
                            
                            
                            <div  style="overflow:scroll; height:370px; width:637px; background-color:White">
                   <asp:GridView ID="grdInvoiceView" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="5000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="INCID" AllowSorting="True">
                                           
                        <Columns>
                        <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>

                         <asp:TemplateField HeaderText="Details">
                          <ItemTemplate>
                          <asp:LinkButton id="lnkDCID" runat="server" PostBackUrl='<%#"InvoiceDetailsView.aspx?id="+Eval("INCID")%>' Text="Details" ></asp:LinkButton>
                          </ItemTemplate>
                          </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="InvoiceNO">
                          <ItemTemplate>
                          <asp:Label id="lblInvoiceNO" runat="server" Text='<%#Eval("INVOICENO")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                        
                                                 
                      
                          <asp:TemplateField HeaderText="VendorName">
                          <ItemTemplate>
                          <asp:Label id="lblVendorName" runat="server" Text='<%#Eval("VENDORNAME")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                                                    
                          
                          <asp:TemplateField HeaderText="InvoiceDt">
                          <ItemTemplate>
                          <asp:Label id="lblInvoiceDt" runat="server" Text='<%#Eval("INCDATE","{0:dd/MM/yyyy}")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                             
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

