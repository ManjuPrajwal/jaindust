<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="QuotationReport.aspx.cs" Inherits="QuotationReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="Gridstyle.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
    function SelectSingleRadiobutton(rdbtnid) {
        var rdBtn = document.getElementById(rdbtnid);
        var rdBtnList = document.getElementsByTagName("input");
        for (i = 0; i < rdBtnList.length; i++) {
            if (rdBtnList[i].type == "radio" && rdBtnList[i].id != rdBtn.id) {
                rdBtnList[i].checked = false;
            }
        }
    }

</script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">
   <div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"> QUOTATION HEADER</h3>
                        </div>
                        <div class="panel-body">
                        
                            
                            
                            <div  style="overflow:scroll; height:370px; width:357px; background-color:White">
                   <asp:GridView ID="grdQUTReport" runat="server" AllowPaging="true" Font-Size="Small"
                       AutoGenerateColumns="False" PageSize="5000" CssClass="Grid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" EmptyDataText="No Such Data Found" 
                           DataKeyNames="QUTNO" AllowSorting="True">
                                           
                        <Columns>
                          <asp:TemplateField >
                              <ItemTemplate >
                              <asp:RadioButton ID="chk" runat ="server" OnClick="javascript:SelectSingleRadiobutton(this.id)" />                                        
                               </ItemTemplate>
                         </asp:TemplateField>
                   
                        <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>
                        
                          <asp:TemplateField HeaderText="QUTNO ">
                          <ItemTemplate>
                          <asp:Label id="lblQUTNO" runat="server" Text='<%#Eval("QUTNO")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                          <asp:TemplateField HeaderText="VID" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblVID" runat="server" Text='<%#Eval("VID")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                         
                        
                          <asp:TemplateField HeaderText="VendorName">
                          <ItemTemplate>
                          <asp:Label id="lblVendorName" runat="server" Text='<%#Eval("VENDORNAME")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                          <asp:TemplateField HeaderText="QUTDT">
                          <ItemTemplate>
                          <asp:Label id="lblQUTDT" runat="server" Text='<%#Eval("QUTDT","{0:dd/MM/yyyy}")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                         
                         
                         </Columns>
                                     
                        <PagerStyle CssClass="pgr" />
                        <AlternatingRowStyle CssClass="alt" />
                   
                  </asp:GridView>
                 
                  </div>
                  <br />
                    <asp:Button ID="btnReport" runat="server" Text="Report" 
                  onclick="btnReport_Click" />
   
                 
                 </div>
                    </div>
                </div>
            </div>
            
        
        </div>
   </div>
             
    
   </div>


    <div align="right">
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
      
   </div>
</asp:Content>

