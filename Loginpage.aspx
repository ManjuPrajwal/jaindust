<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Loginpage.aspx.cs" Debug="true" Inherits="Loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    	<link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/styles.css" rel="stylesheet" />
    <title> Log In Page</title>
</head>
<body>
    <form id="form1" runat="server">
  <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h1 class="text-center">Login</h1>
      </div>
      <div class="modal-body">
          <form class="form col-md-12 center-block">
            <div class="form-group">
             
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control input-lg" placeholder="UserName"></asp:TextBox>
            </div>
            <div class="form-group">
              <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control input-lg" TextMode="Password" placeholder="Password"></asp:TextBox>
            </div>
            <div class="form-group">
              
                <asp:Button ID="btnSave" CssClass="btn btn-primary btn-lg btn-block " runat="server" Text="Sign In" OnClick="btnSave_Click" />
             
            </div>
          </form>
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
         
		  </div>	
      </div>
  </div>
  </div>
</div>
    </form>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>

</body>
</html>
