<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MaterialInwardView.aspx.cs" Inherits="MaterialInwardView" Title="MaterialInward View"%>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="Gridstyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
   <div align="center"> 
   <br />
    <asp:ImageButton ID="ImageButton1" PostBackUrl="~/StockView.aspx"  runat="server" ImageUrl="~/Images/app-stock-icon.png" Width="30" Height="30"  ToolTip="Over ALL Stock View"/>
           
   
   <div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"> Material Inward View</h3>
                        </div>
                        <div class="panel-body">
                        
                            
                            
                            <div  style="overflow:scroll; height:370px; width:637px; background-color:White">
                   <asp:GridView ID="grdInwardMasterView" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="5000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="MID" AllowSorting="True">
                                           
                        <Columns>
                        <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>
                        <asp:TemplateField HeaderText="MID">
                          <ItemTemplate>
                          <%--<asp:Label id="lblMId" runat="server" Text='<%#Eval("MID")%>'></asp:Label>--%>
                          <asp:LinkButton id="lnkMID" runat="server" PostBackUrl='<%#"InwardDetailsView.aspx?id="+Eval("MID")%>' Text="Details"></asp:LinkButton>
                          
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
                          
                          <asp:TemplateField HeaderText="PoDate">
                          <ItemTemplate>
                          <asp:Label id="lblPoDate" runat="server" Text='<%#Eval("PODATE","{0:dd/MM/yyyy}")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                          <asp:TemplateField HeaderText="VendorName">
                          <ItemTemplate>
                          <asp:Label id="lblVendorName" runat="server" Text='<%#Eval("VENDORNAME")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                                                    
                          
                          <asp:TemplateField HeaderText="InwardDT">
                          <ItemTemplate>
                          <asp:Label id="lblInwardDT" runat="server" Text='<%#Eval("INWARD_DT","{0:dd/MM/yyyy}")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                                                   
                          <asp:TemplateField HeaderText="Move TO DC">
                          <ItemTemplate>
                          
                          <asp:LinkButton id="lnkMID" runat="server" PostBackUrl='<%#"DCentry.aspx?id="+Eval("MID")%>' Text="Move To DC"></asp:LinkButton>
                          
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

