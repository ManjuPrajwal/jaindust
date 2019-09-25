<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="InvoiceEntry.aspx.cs" Inherits="InvoiceEntry" Title="Invoice Entry"%>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Gridstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="Javascripts/Common.js"></script>

    <script type="text/javascript">
        function Validat() {
            if (document.getElementById("<%=txtPONO.ClientID%>").value == "") {
                alert("Enter The PoNo");
                document.getElementById("<%=txtPONO.ClientID%>").focus();

                return false;
            }
            if (document.getElementById("<%=txtInvoiceNo.ClientID%>").value == "") {
                alert("Enter The InvoiceNo");
                document.getElementById("<%=txtInvoiceNo.ClientID%>").focus();

                return false;
            }


            
            if (document.getElementById("<%=txtPODt.ClientID%>").value == "") 
            {
                alert("Enter The Po Date");
                document.getElementById("<%=txtPODt.ClientID%>").focus();

                return false;
            }

            if (document.getElementById("<%=txtINCDt.ClientID%>").value == "") {
                alert("Enter The Invoice Date");
                document.getElementById("<%=txtINCDt.ClientID%>").focus();

                return false;
            }

          

        }

    </script>
    
     <script type="text/javascript">
        function Validat1() 
        {
            if (document.getElementById("<%=txtPrice.ClientID%>").value == "") {
                alert("Enter The Price");
                document.getElementById("<%=txtPrice.ClientID%>").focus();

                return false;
            }
            if (document.getElementById("<%=txtInvoiceQty.ClientID%>").value == "") 
            {
                alert("Enter The Qty");
                document.getElementById("<%=txtInvoiceQty.ClientID%>").focus();

                return false;
            }

            if (document.getElementById("<%=txtTotalAmt.ClientID%>").value == "") {
                alert("Enter The TotalAmt");
                document.getElementById("<%=txtTotalAmt.ClientID%>").focus();

                return false;
            }

            if (document.getElementById("<%=txtGrandTotal.ClientID%>").value == "") {
                alert("Enter The GrandTotal");
                document.getElementById("<%=txtGrandTotal.ClientID%>").focus();

                return false;
            }

        }

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <div align="center">
        <div>
            <div id="wrapper">
                <div id="page-wrapper7">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                       Invoice Entry</h3>
                                </div>
                                <div class="panel-body">
                                     <div align="center">INVOICE NO &nbsp;&nbsp;<asp:TextBox ID="txtInvoiceNo" Width="45px" onKeyPress="return checkNumber(event)" runat="server"></asp:TextBox><asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy" TargetControlID="txtINCDt"
                                            PopupButtonID="txtINCDt">
                                        </asp:CalendarExtender>
                                        &nbsp;VendoreName&nbsp;&nbsp;<asp:DropDownList ID="cmbVendoreName" Width="220px"  Height="27" runat="server"></asp:DropDownList>
                                          PO NO&nbsp;&nbsp;<asp:TextBox ID="txtPONO"
                                            Width="180" runat="server"></asp:TextBox>
                                         PODate&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txtPODt" Width="75" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="ceAttDt" runat="server" Format="dd-MM-yyyy" TargetControlID="txtPODt"
                                            PopupButtonID="txtPODt">
                                        </asp:CalendarExtender>

                                         Invoice Date&nbsp;&nbsp;
                                        <asp:TextBox ID="txtINCDt" Width="75px" runat="server"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton2"  PostBackUrl="~/InvoiceView.aspx"  runat="server" ImageUrl="~/Images/view-icon.png" Width="30" Height="30"  ToolTip="Invoice View"/>
                                        
                                     </div>
                                    <div id="shieldui-chart3">
                                       
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                     
                                            
                                            
                                            </div>
                                    
                                    <div style="font-family:Times New Roman; font-size:medium; color:Blue">
                                        ADDING  ITEMS</div>
                                    <div id="Div3">
                                      <asp:TextBox ID="txtSearch" ClientIDMode="Static" runat="server"  Placeholder="Search Material"></asp:TextBox>
                                        <asp:Label ID="lblHSNCODE" runat="server"></asp:Label>
                                        <asp:Button ID="btnGetHSNCODE" runat="server" Text="Get HSNCODE" OnClick="btnGetHSNCODE_Click" />
                                    
                                        PartNo&nbsp;
                                        <asp:DropDownList AutoPostBack="true" ID="cmbPartMaster" Width="250px" Height="28px" runat="server" 
                                            onselectedindexchanged="cmbPartMaster_SelectedIndexChanged">
                                        </asp:DropDownList>
                                       
                                      
                                        <asp:TextBox ID="txtPrice"  MaxLength="7" Width="90px"
                                            runat="server" placeholder="Price"></asp:TextBox >
                                            
                                     
                                        <asp:TextBox ID="txtInvoiceQty" AutoPostBack="true" MaxLength="7" Width="55px" onKeyPress="return checkNumber(event)"
                                            runat="server" ontextchanged="txtInvoiceQty_TextChanged" placeholder="QTY" ></asp:TextBox>

                                        
                                  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton runat="server" ID="imbtnAddItems" OnClientClick="return Validat1()" ImageUrl="~/Images/Addbuttom.png"
                                            ToolTip="Add The Items" Width="30" Height="27" OnClick="imbtnAddItems_Click" />
                                    </div>
                                    
                                    <div>
                                         
                                   Total Amount  <asp:TextBox ID="txtTotalAmt" MaxLength="7" runat="server" ></asp:TextBox>
                                           
                                                                       
                                    
                                        Tax Amt&nbsp;&nbsp;
                                        <asp:TextBox ID="txtTaxAmount" MaxLength="12" 
                                            runat="server" ></asp:TextBox>
                                             Grand Total&nbsp;&nbsp;
                                        <asp:TextBox ID="txtGrandTotal" MaxLength="12"
                                            runat="server" ></asp:TextBox>
                                            
                                       <asp:RadioButton AutoPostBack="true" ID="rdWitoutTax" runat="server" GroupName="Tax" 
                                            oncheckedchanged="rdWitoutTax_CheckedChanged" /> WithoutTax 
                                         <asp:RadioButton ID="rdSTax" runat="server" GroupName="Tax" 
                                            oncheckedchanged="rdSTax_CheckedChanged" AutoPostBack="true"/> GST 
                                      
                                        
                                        </div>
                                    <div align="center"> 
             <asp:GridView ID="grdInvChild" Width="60%"  runat="server" DataKeyNames="ID" Font-Size="Small"
              PageSize="50000" CssClass="Grid"  PagerStyle-CssClass="pgr" ShowFooter="True" 
              EmptyDataText="No Such Items" AutoGenerateColumns="False" OnRowDeleting="grdInvChild_RowDeleting" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
             
             
             <Columns>
                            <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                     <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID">
                          <ItemTemplate>
                          <asp:Label id="lblID" runat="server" Text='<%#Eval("ID")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                        


                          <asp:TemplateField HeaderText="PartName" ItemStyle-Width="85px">
                          <ItemTemplate>
                          <asp:Label id="lblPartName1" runat="server" Text='<%#Eval("PARTNAME")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                        
                          <asp:TemplateField HeaderText="HSNCODE">
                          <ItemTemplate>
                          <asp:Label id="lblHSNCODE" runat="server" Text='<%#Eval("HSNCODE")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                       
                           <asp:TemplateField HeaderText="UOM">
                          <ItemTemplate>
                          <asp:Label id="lblUOM" runat="server" Text='<%#Eval("UOM")%>'></asp:Label>
                          </ItemTemplate>
                          <FooterTemplate>
                          <asp:Label ID="lblGTotQty" runat="server" />
                           </FooterTemplate>
                          </asp:TemplateField>

                         <asp:TemplateField HeaderText="QTY">
                          <ItemTemplate>
                          <asp:Label id="lblQTY" runat="server" Text='<%#Eval("QTY")%>'></asp:Label>
                          </ItemTemplate>
                     
                          </asp:TemplateField>
                          
                          
                          <asp:TemplateField HeaderText="Price">
                          <ItemTemplate>
                          <asp:Label id="lblPrice" runat="server" Text='<%#Eval("PRICE" ,"{0:n}")%>' DataFormatString="{d:F2}"></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                          <asp:TemplateField HeaderText="TOTAL">
                          <ItemTemplate>
                          <asp:Label id="lblTotal" runat="server" Text='<%#Eval("TOTAL","{0:n}")%>' DataFormatString="{D:2}"></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                          
                           <asp:TemplateField HeaderText="GST">
                          <ItemTemplate>
                          <asp:Label id="lblGST" runat="server" Text='<%#Eval("GST" ,"{0:n}")%>' DataFormatString="{0:n}"></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
            
                          
                         <asp:TemplateField HeaderText="GTotal">
                          <ItemTemplate>
                          <asp:Label id="lblGTotal" runat="server" Text='<%#Eval("GRANDTOTAL" ,"{0:n}")%>' DataFormatString="{0:F2}"></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
            
                      
                         <asp:CommandField ShowDeleteButton="True" DeleteText="Remove"  ControlStyle-ForeColor="Red"   >
                                    
                            <ControlStyle ForeColor="Red" />
                            </asp:CommandField>
                                    
                        </Columns>
             
                 
             
                 <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                 <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                 <PagerStyle BackColor="#99CCCC" CssClass="pgr" ForeColor="#003399" HorizontalAlign="Left" />
                 <RowStyle BackColor="White" ForeColor="#003399" />
                 <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                 <SortedAscendingCellStyle BackColor="#EDF6F6" />
                 <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                 <SortedDescendingCellStyle BackColor="#D6DFDF" />
                 <SortedDescendingHeaderStyle BackColor="#002876" />
             
                 
             
             </asp:GridView>
             
          </div>
                                        
                                    
                                    <div>
                                        <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Images/save.png" Width="45px"
                                            Height="30" OnClientClick="return Validat()" OnClick="btnSave_Click" />
                                    </div>
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
    <script src="jsnew/jquery-1.9.1.js" type="text/javascript"></script>
    <link href="jsnew/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="jsnew/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtSearch").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "WebService.asmx/GetMaterial",
                        data: "{'MATERIALNAME':'" + document.getElementById('txtSearch').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error......");
                        }
                    });
                }
            });
        });

    </script>
</asp:Content>

