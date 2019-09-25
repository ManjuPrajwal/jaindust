<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="VendorMaster.aspx.cs" Inherits="VendorMaster" Title="VendorMaster Page" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="Javascripts/Common.js"></script>
   <script type="text/javascript">
       function Validat()
       {
           if (document.getElementById("<%=txtAuthority.ClientID%>").value == "")
           {
               alert("Enter Authority Name");
               document.getElementById("<%=txtAuthority.ClientID%>").focus();

               return false;
           }
           if (document.getElementById("<%=txtVendorName.ClientID%>").value == "")
           {
               alert("Enter VendorName");
               document.getElementById("<%=txtVendorName.ClientID%>").focus();

               return false;
           }



           if (document.getElementById("<%=txtAdd1.ClientID%>").value == "") {
               alert("Enter Street Name");
               document.getElementById("<%=txtAdd1.ClientID%>").focus();

               return false;
           }
           if (document.getElementById("<%=txtAdd2.ClientID%>").value == "") {
               alert("Enter Area Name");
               document.getElementById("<%=txtAdd2.ClientID%>").focus();

               return false;
           }
           if (document.getElementById("<%=txtPlace.ClientID%>").value == "") {
               alert("Enter Place");
               document.getElementById("<%=txtPlace.ClientID%>").focus();

               return false;
           }
          
       }


   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
  <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
 <br />
 <div align="center">
 <asp:ImageButton ID="ImageButton1"  PostBackUrl="~/VendorMasterView.aspx"  runat="server" ImageUrl="~/Images/view-icon.png" Width="30" Height="30"  ToolTip="VendorMaster View"/>
             
<div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"> Vendor Master</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart3">
                                Authority Name <asp:TextBox ID="txtAuthority" runat="server"></asp:TextBox>
                                                 
                            </div>
                             <div id="shieldui-chart3">
                               Vendor Name&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtVendorName" runat="server"></asp:TextBox></div>
                            <div>
                            
                            <div id="shieldui-chart3">
                                Address1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtAdd1" runat="server"></asp:TextBox>
                                             
                            </div>
                            <div id="shieldui-chart3">
                                Address2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtAdd2" runat="server"></asp:TextBox>
                                             
                            </div>
                            
                            <div id="shieldui-chart3">
                                Place&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPlace" runat="server"></asp:TextBox>
                                             
                            </div>
                            
                            <div id="shieldui-chart3">
                                Pincode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:TextBox ID="txtPincode" MaxLength="6" onKeyPress="return checkNumber(event)" runat="server"></asp:TextBox>
                                             
                            </div>
                            
         <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Images/save.png" Width="45px" Height="30" OnClientClick="return Validat()" OnClick="btnSave_Click" />

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

