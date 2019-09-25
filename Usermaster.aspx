<%@ Page Title="Usermaster" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Usermaster.aspx.cs" Inherits="Usermaster" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="CssFile/Hai.css"/>
     <link href="Gridstyle.css" rel="stylesheet" type="text/css" />

   <script type="text/javascript">
       function Validat()
       {
           if (document.getElementById("<%=txtUserName.ClientID%>").value == "")
           {
               alert("Enter UserName");
               document.getElementById("<%=txtUserName.ClientID%>").focus();

               return false;
           }
           if (document.getElementById("<%=txtPassword.ClientID%>").value == "")
           {
               alert("Enter Password");
               document.getElementById("<%=txtPassword.ClientID%>").focus();

               return false;
           }

          
       }


   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  <asp:UpdatePanel ID="Upanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div align=center>
  

    <div id="wrapper">
    <div id="page-wrapper">
    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"> User Master</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart3">
                                UserName <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                             
                            </div>
                             <div id="div1">
                                Password&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox></div>
                            <div>
                             <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/Images/save.png" Width="45px" Height="30" OnClientClick="return Validat()" OnClick="btnSave_Click" />

                            </div>
                            <div align="center">
                             <div  style="overflow:scroll; height:190px; width:370px; background-color:White" align="center">
     <asp:GridView ID="grdUserMaster" runat="server" BackColor="White"  
         AutoGenerateColumns="False" PageSize="5000" 
         BorderColor="#CCCCCC" BorderStyle="None" Font-Size="Medium" 
         BorderWidth="1px" CellPadding="3"  CssClass="Grid"
         EmptyDataText="No Such Data Found" DataKeyNames="UID" 
          AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" 
         onrowdatabound="grdUserMaster_RowDataBound"> 
           
       
         <%--<RowStyle ForeColor="#000066"/>
         <FooterStyle BackColor="White" ForeColor="#000066" />
         <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
         <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
     
     --%>
         <Columns>
                             <asp:TemplateField HeaderText="SNo">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                  </ItemTemplate>
                              </asp:TemplateField>
         
                          <asp:TemplateField HeaderText="UID" ItemStyle-HorizontalAlign="Center" Visible="false">
                          <ItemTemplate>
                          <asp:Label id="lblUID" runat="server" Text='<%#Eval("UID")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                                         
                        
                          
                        <asp:TemplateField HeaderText="UserName">
                          <ItemTemplate>
                          <asp:Label id="lblUserName" runat="server" Text='<%#Eval("USERNAME")%>'></asp:Label>
                          </ItemTemplate>
                          </asp:TemplateField>
                                         
                          <asp:TemplateField>
                          
                          
                          
                          <ItemTemplate>
                           <asp:LinkButton ID="lnkDelete" runat="server" OnClick="lnkDelete_Click">Delete </asp:LinkButton>
                          </ItemTemplate>
                                       
                          </asp:TemplateField>
                          
                          
                          
                          
           </Columns>                                                                          
                     
         
      </asp:GridView>
        
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

