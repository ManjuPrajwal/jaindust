<%@ Page Title="DC Master Page" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="DCMaster.aspx.cs" Inherits="DCMaster" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="wrapper">
                <div id="page-wrapper7">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        DC Entry 
                                    </h3>
                                </div>
                                <br />
                                <table align="center" >
                                    <tr style="padding-bottom:25%">
                                        <td>
                                            VendoreName
                                        </td>
                                        <td>  
                                            <asp:DropDownList ID="cmbVendoreName" Width="220px"  Height="27" runat="server"></asp:DropDownList>
                                        </td>
                                        <td> PO NO</td>
                                        <td><asp:TextBox ID="txtPONO" Width="120" runat="server"></asp:TextBox></td>
                                        <td>DC NO</td>
                                        <td><asp:TextBox ID="txtDCNO" Width="120" runat="server"></asp:TextBox></td>
                                      

                                    </tr>
                                    <tr>
                                          <td>Bill Ref No</td>
                                        <td>
                                            <asp:TextBox ID="txtBillNo" runat="server" Width="220px"> </asp:TextBox>
                                       
                                        </td>
                                        <td>PODate</td>
                                        <td> <asp:TextBox ID="txtPODt" Width="120" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="ceAttDt" runat="server" Format="dd-MM-yyyy" TargetControlID="txtPODt"
                                            PopupButtonID="txtPODt">
                                        </asp:CalendarExtender></td>

                                        <td>DCDate</td>
                                        <td>  <asp:TextBox ID="txtDCDt" Width="120" runat="server"></asp:TextBox>

                                             <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy" TargetControlID="txtDCDt"
                                            PopupButtonID="txtDCDt">
                                        </asp:CalendarExtender>
                                        </td>

                                    </tr>
                                   



                                </table >
                                <br /><br />
                                <header><h3>Adding Items</h3> </header>
                                <table align="center">
                                  <tr>
                                      <td>PartNo  </td>
                                       <td> <asp:DropDownList AutoPostBack="true" ID="cmbPartMaster" Width="280px" runat="server">
                                        </asp:DropDownList>

                                       </td>   
                                         <td>DC Qty</td>    
                                      <td><asp:TextBox ID="txtDCQty" MaxLength="7" Width="55px"
                                            runat="server" ></asp:TextBox>

                                      </td>  
                                      <td></td>                                    
                                     <td><asp:ImageButton runat="server" ID="imbtnAddItems" OnClientClick="return Validat1()" ImageUrl="~/Images/Addbuttom.png"
                                            ToolTip="Add The Items" Width="27" Height="25" OnClick="imbtnAddItems_Click" />

                                     </td>


                                  </tr>




                                </table>
                                <br />
                                <div align="center"> 
             <asp:GridView ID="grdDcDetails" Width="60%"  runat="server" DataKeyNames="ID" Font-Size="Small"
              PageSize="50000" CssClass="Grid"  PagerStyle-CssClass="pgr" ShowFooter="True"  OnRowDeleting="grdDcDetails_RowDeleting"
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
                   <br />
                  <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Images/save.png" Width="45px"
                   Height="30" OnClientClick="return Validat()" OnClick="btnSave_Click" />



                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            
            
           </ContentTemplate>
         </asp:UpdatePanel>
</asp:Content>

