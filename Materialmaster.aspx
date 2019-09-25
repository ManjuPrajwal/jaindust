<%@ Page Title="Material Master" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Materialmaster.aspx.cs" Inherits="Materialmaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <br />
   <div align="center">
  <asp:ImageButton ID="ImageButton17"  PostBackUrl="~/MaterialView.aspx"  runat="server" ImageUrl="~/Images/view-icon.png" Width="30" Height="30"  ToolTip="Material View"/>
          
  <div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Material Master</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart3">
                               Material  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtMaterialName" runat="server"></asp:TextBox></div>
                             <div id="Div1">
                               HSN Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:TextBox ID="txtHSNCode" runat="server" ></asp:TextBox></div>
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

