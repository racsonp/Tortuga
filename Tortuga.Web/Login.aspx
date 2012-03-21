<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Tortuga.Web.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="reset.css" />
    <style>
         body
        {
            background-color: #f1fbfd;
            font-family: Helvetica, Verdana, sans-serif;
            font: 1em;
        }
               #Login1
            {
                margin-left: auto;
                margin-right: auto;
                margin-top: 5%; 
                background-color: #fff;
            }
           .textL
            {
                font: 1em;
                 width: 75.22222%;
            }
        .LoginButt
        {
            
             width: 50%;
              margin-left: auto;
              margin-right: auto;
        }
           
/**------------------------------------------------------------------------**/           
/**------------------------------------------------------------------------**/           
/**------------------------------------------------------------------------**/           
           @media screen and (max-width:360px)
        {
                #Login1
            { 
                width: 80%;
                height: 95%;
            }
           .textL
            {
                width: 75.22222%;
            }
           
        }

/**------------------------------------------------------------------------**/           
/**------------------------------------------------------------------------**/           
/**------------------------------------------------------------------------**/           
        @media screen and (min-width:361px)
        {
                         #Login1
            { 
                width: 40%;
                height: 95%;
            }
         
        }
         
      
    </style>
    <title>nCosmos - Security</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
        <LayoutTemplate>
            <div>
                <asp:Label class="textL" ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                <asp:TextBox class="textL" ID="UserName" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label class="textL" ID="PasswordLabel" runat="server" AssociatedControlID="Password">
                        Password :</asp:Label>
                <asp:TextBox class="textL" ID="Password" runat="server" TextMode="Password">
                </asp:TextBox>
            </div>
            <div>
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
            </div>
            <div class="LoginButt" >
                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
            </div>
        </LayoutTemplate>
    </asp:Login>
    </form>
</body>
</html>
