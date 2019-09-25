<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ReportContainer.aspx.cs" Inherits="ReportContainer" Title="Report Container"%>
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
                            <h3 class="panel-title">Reports</h3>
                        </div>
                        <div class="panel-body">
          <div> DC Report</div>
         <div id="Div3" style="margin-top:auto">
           <asp:ImageButton ID="ImageButton1"  PostBackUrl="~/DCReport.aspx"  runat="server" ImageUrl="~/Images/reports-icon7.png" Width="50" Height="40"  ToolTip="DC Report"/>  
          </div>
          
         <div> Invoice Report</div>
         <div id="Div1" style="margin-top:auto">
           <asp:ImageButton ID="ImageButton2"  PostBackUrl="~/InvoiceReportContainer.aspx"  runat="server" ImageUrl="~/Images/report-icon.png" Width="50" Height="40"  ToolTip="Invoice Report"/>  
          </div>

         <div> Quotation Report</div>
         <div id="Div2" style="margin-top:auto">
           <asp:ImageButton ID="ImageButton3"  PostBackUrl="~/QuotationReport.aspx"  runat="server" ImageUrl="~/Images/report-icon.png" Width="50" Height="40"  ToolTip="Quotation Report"/>  
          </div>

          </div>
          </div>
          </div>
          </div>
          </div>
          </div>
          </div>
          

</asp:Content>

