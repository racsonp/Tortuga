<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxDemo.aspx.cs" Inherits="Tortuga.Web.AjaxDemo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/jquery-1.7.1.js" type="text/javascript"></script>
    

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $.ajaxSetup({
                cache: false, 
                dataType: "html",
                error: function (xhr, status, error) {
                    alert('An error occurred: ' + error);
                }, 
                timeout: 30000, type: "GET",
                beforeSend: function () {
                     console.log('In Ajax beforeSend function');
                },
                complete: function () {
                     console.log('In Ajax complete function');
                }
             });

             $("#btnGetHtml").click(function (e) {
                e.preventDefault();
                $.ajax({
                    url: "About.html",
                    success: function (data) {
                        $("#contentArea").html("").append(data);
                    }
                });
            });
        });
    </script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#Button1").click(function (e) {
                e.preventDefault();
                if ($("#txtUserName").val() == '')
                    alert("Please enter the UserName");
                else
                    sendData($("#txtUserName").val());
            });

            function sendData(sUserName) {
                var loc = window.location.href;
                loc = (loc.substr(loc.length - 1, 1) == "/") ? loc +
 "AjaxDemo.aspx" : loc;
                $.ajax({
                    type: "POST",
                    url: loc + "/CheckUserName",
                    data: '{"sUserName":"' + sUserName + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d)
                            alert("The User Name is valid");
                        else
                            alert("The User Name is invalid");
                    },
                    error: function () {
                        alert("An unexpected error has occurred during processing.");
                    }
                });
            }
        });
</script>
    <title>Ajax Demo</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div align="center">
                <p> On the button to initiate the AJAX request. You will see that the page content is updated 
    without any visible page refresh </p>
            <fieldset style="width: 400px; height: 200px;">
                <div id="contentArea">
                    <asp:Button ID="btnGetHtml" runat="server" Text="Click Here" />
                </div>
            </fieldset>
        </div>

        <div>
                  <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>     
                   <asp:Button ID="Button1" runat="server" Text="Check Data" />
        </div>
    </div>
    </form>
</body>
</html>
