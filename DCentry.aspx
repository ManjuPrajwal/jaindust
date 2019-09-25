<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="DCentry.aspx.cs"
    Inherits="DCentry" Title="DC Entry" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Gridstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Javascripts/Common.js"></script>

    <script type="text/javascript">
        function Validat() {
            if (document.getElementById("<%=txtPONO.ClientID%>").value == "") {
                alert("Enter The PoNo");
                document.getElementById("<%=txtPONO.ClientID%>").focus();

                return false;
            }
            if (document.getElementById("<%=txtPODt.ClientID%>").value == "") 
            {
                alert("Enter The Po Date");
                document.getElementById("<%=txtPODt.ClientID%>").focus();

                return false;
            }

            if (document.getElementById("<%=txtDCDt.ClientID%>").value == "") {
                alert("Enter The DC Date");
                document.getElementById("<%=txtDCDt.ClientID%>").focus();

                return false;
            }

            if (document.getElementById("<%=txtDCDt.ClientID%>").value == "") {
                alert("Enter The DC Date");
                document.getElementById("<%=txtDCDt.ClientID%>").focus();

                return false;
            }
            
            


        }

    </script>
    
     <script type="text/javascript">
        function Validat1() 
        {
           
            if (document.getElementById("<%=txtDCQty.ClientID%>").value == "") 
            {
                alert("Enter The  DC Qty");
                document.getElementById("<%=txtDCQty.ClientID%>").focus();

                return false;
            }

        }

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="wrapper">
                <div id="page-wrapper7">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        DC Entry</h3>
                                </div>
                                <div class="panel-body">
                                    <div id="shieldui-chart3">
                                       &nbsp; VendoreName&nbsp;&nbsp;
                                        <asp:TextBox ID="txtVendorName" Width="177px" runat="server"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PO NO&nbsp;&nbsp;<asp:TextBox ID="txtPONO"
                                            Width="120" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;DC NO &nbsp;&nbsp;<asp:TextBox ID="txtDCNO" Width="120" runat="server"></asp:TextBox></div>
                                    <div id="Div1">
                                        &nbsp;&nbsp;&nbsp;&nbsp;Bill Ref No&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txtBillNo" runat="server" Width="177px">
                                        </asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PODate&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txtPODt" Width="120" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="ceAttDt" runat="server" Format="dd-MM-yyyy" TargetControlID="txtPODt"
                                            PopupButtonID="txtPODt">
                                        </asp:CalendarExtender>
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy" TargetControlID="txtDCDt"
                                            PopupButtonID="txtDCDt">
                                        </asp:CalendarExtender>
                                        &nbsp;&nbsp;
                                        DCDate&nbsp;&nbsp;
                                        <asp:TextBox ID="txtDCDt" Width="120" runat="server"></asp:TextBox>
                                    </div>
                                    <div style="font-family:Times New Roman; font-size:medium; color:Blue">
                                        ADDING  ITEMS</div>
                                    <div id="Div3">
                                        PartNo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:DropDownList AutoPostBack="true" ID="cmbPartMaster" Width="280px" runat="server" 
                                            >
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    
                                            &nbsp;&nbsp;&nbsp;
                                        DC Qty&nbsp;&nbsp;
                                        <asp:TextBox ID="txtDCQty" MaxLength="7" Width="55px"
                                            runat="server" ></asp:TextBox>
                                        &nbsp;&nbsp;
                                        <asp:ImageButton runat="server" ID="imbtnAddItems" OnClientClick="return Validat1()" ImageUrl="~/Images/Addimage.jpg"
                                            ToolTip="Add The Items" Width="27" Height="25" OnClick="imbtnAddItems_Click" />
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


               

                  <div align="center"> 
             <asp:GridView ID="grdDcDetails" Width="60%"  runat="server" DataKeyNames="ID" Font-Size="Small"
              PageSize="50000" CssClass="Grid"  PagerStyle-CssClass="pgr" ShowFooter="True" 
              EmptyDataText="No Such Items" AutoGenerateColumns="False"  BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
             
             
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
                        
                          <asp:TemplateField HeaderText="DC QTY">
                          <ItemTemplate>
                          <asp:Label id="lblDCQTY" runat="server" Text='<%#Eval("DC_QTY")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                       
                        
                      
                         <asp:CommandField ShowDeleteButton="True" DeleteText="Remove"  ControlStyle-ForeColor="Red">
                                    
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
                                        





            </div>
       
       
          
                                       
                
           
            
           
           

                
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
