<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="DashBoard.aspx.cs" Inherits="DashBoard" Title="DashBoard Page" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="Gridstyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div align="center">
 <div id="page-wrapper5">
 <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Stock Count</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-grid1">
                            <div align="center">
                             <div  style="overflow:scroll; height:200px; width:300px; background-color:White">
                   <asp:GridView ID="grdStockCount" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="5000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="JOBID" AllowSorting="True">
                                           
                        <Columns>
                        
                         
                        <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>

                     
                         <asp:TemplateField HeaderText="JobId" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblJobid" runat="server" Text='<%#Eval("JOBID")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                        
                                                 
                      
                          <asp:TemplateField HeaderText="PartN0">
                          <ItemTemplate>
                          <asp:Label id="lblPartNo" runat="server" Text='<%#Eval("PARTNO")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                                                    
                          
                          <asp:TemplateField HeaderText="COUNT">
                          <ItemTemplate>
                          <asp:Label id="lblCount" runat="server" Text='<%#Eval("TOTCOUNT")%>'></asp:Label>
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
                
                
               <div class="col-lg-8">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">DC Completed Count </h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart2">
                            
                            <div  style="overflow:scroll; height:200px; width:200px; background-color:White">
                   <asp:GridView ID="grdDCCount" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="5000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="JOBID" AllowSorting="True">
                                           
                        <Columns>
                        
                         
                        <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>

                     
                         <asp:TemplateField HeaderText="JobId">
                          <ItemTemplate>
                          <asp:Label id="lblJobid" runat="server" Text='<%#Eval("JOBID")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                        
                                                 
                      
                         <%-- <asp:TemplateField HeaderText="PartN0">
                          <ItemTemplate>
                          <asp:Label id="lblPartNo" runat="server" Text='<%#Eval("PARTNO")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          --%>
                                                    
                          
                          <asp:TemplateField HeaderText="COUNT">
                          <ItemTemplate>
                          <asp:Label id="lblCount" runat="server" Text='<%#Eval("QTY")%>'></asp:Label>
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
           
                                 
  
               <div class="col-lg-8">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Emp Completed Count </h3>
                        </div>
                        <div class="panel-body">
                            <div id="Div1">
                            
                    
                       <div  style="overflow:scroll; height:200px; width:200px; background-color:White">
                   <asp:GridView ID="grdVirtualCount" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="5000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="JOBID" AllowSorting="True">
                                           
                        <Columns>
                        
                         
                        <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>

                     
                         <asp:TemplateField HeaderText="JobId" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblJobid" runat="server" Text='<%#Eval("JOBID")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                        
                                                 
                      
                          <asp:TemplateField HeaderText="PartN0">
                          <ItemTemplate>
                          <asp:Label id="lblPartNo" runat="server" Text='<%#Eval("PARTNO")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                                                    
                          
                          <asp:TemplateField HeaderText="COUNT">
                          <ItemTemplate>
                          <asp:Label id="lblCount" runat="server" Text='<%#Eval("TOTCOUNT")%>'></asp:Label>
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
     
  
</asp:Content>

