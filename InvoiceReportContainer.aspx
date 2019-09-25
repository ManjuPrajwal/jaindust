<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="InvoiceReportContainer.aspx.cs" Inherits="InvoiceReportContainer" Title="Invoice Report Container" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />

<div align="center">
<div id="wrapper">
    <div id="page-wrapper5">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Invoice Report</h3>
                        </div>
                        <div class="panel-body">
                          
      <div id="Div1" style="margin-top:auto">
         <div align="center"> GST </div>
           <asp:ImageButton ID="ImageButton2"  PostBackUrl="~/IncSalesTaxRpt.aspx"  runat="server" ImageUrl="~/Images/report-icon.png" Width="50" Height="40"  ToolTip="SERVICE TAX"/>  
          </div>
         

         <div id="Div3" style="margin-top:auto">
           <div align="center">WITHOUT TAX </div> <asp:ImageButton ID="ImageButton1"  PostBackUrl="~/IncWithoutTaxRpt.aspx"  runat="server" ImageUrl="~/Images/reports-icon7.png" Width="50" Height="40"  ToolTip="WITHOUT Tax"/>  
          </div>
        
       
       
        

 </div>
 </div>
 </div>
 </div>
 </div>
 </div>
 </div>


</asp:Content>

