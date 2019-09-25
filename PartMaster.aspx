
<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="PartMaster.aspx.cs" Inherits="PartMaster" Title="PartOrDrawing Master Page" %>
<%@ Register Assembly="AjaxControlToolkit" TagPrefix="asp" Namespace="AjaxControlToolkit"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
       function Validat()
       {
           if (document.getElementById("<%=txtPartNo.ClientID%>").value == "")
           {
               alert("Enter The Part No");
               document.getElementById("<%=txtPartNo.ClientID%>").focus();

               return false;
           }
           if (document.getElementById("<%=txtDescription.ClientID%>").value == "")
           {
               alert("Enter The Description");
               document.getElementById("<%=txtDescription.ClientID%>").focus();

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
  <asp:ImageButton ID="ImageButton17"  PostBackUrl="~/PartMasterView.aspx"  runat="server" ImageUrl="~/Images/view-icon.png" Width="30" Height="30"  ToolTip="PartMaster View"/>
          
  <div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Part Master</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart3">
                                Part No &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPartNo" runat="server"></asp:TextBox></div>
                             <div id="shieldui-chart3">
                               Description&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:TextBox ID="txtDescription" runat="server" ></asp:TextBox></div>
                            <div>
                            <div id="shieldui-chart3">
                               Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;
                               <asp:TextBox ID="txtPrice" runat="server" ></asp:TextBox></div>
                            <div>
                            
                            
                            
                            <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Images/save.png" Width="45px" Height="30" OnClientClick="return Validat()" OnClick="btnSave_Click" />

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
</asp:Content>

