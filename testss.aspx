<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testss.aspx.cs" Inherits="testss" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Auto</title>
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
                        url: "WebService.asmx/GetData",
                        data: "{'DName':'" + document.getElementById('txtSearch').value + "'}",
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
</head>
<body>
    <form id="form1" runat="server">
    Search Department :<asp:TextBox ID="txtSearch" runat="server" ></asp:TextBox>
    </form>
</body>
</html>
