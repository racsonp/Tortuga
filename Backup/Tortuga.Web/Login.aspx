<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    private void LoginAction_Click(object sender, EventArgs e)
    {
        
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        Page.Validate();
        if (!Page.IsValid) return;
        if (FormsAuthentication.Authenticate(this.Login1.UserName, Login1.Password)) 
        {
            // Create the authentication cookie
            HttpCookie AuthCookie;
            AuthCookie = FormsAuthentication.GetAuthCookie(
            Login1.UserName, true);
            AuthCookie.Expires = DateTime.Now.AddDays(10);
            // Add the cookie to the response
            Response.Cookies.Add(AuthCookie);
            // Redirect to the originally requested page
            Response.Redirect(FormsAuthentication.GetRedirectUrl(
           Login1.UserName, Login1.RememberMeSet));
        }
        else
        {
            // User name and password are not correct
            //LegendStatus.Text = "Invalid username or password!";
        }

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>nCosmos - Login </title>
    <STYLE type="text/css">
      .textos {

          text-align: center;
          width: 120px;


      }
     </STYLE>

</head>
<body>
    <form id="HtmlForm" runat="server">
    
    <asp:Login ID="Login1" runat="server" onauthenticate="Login1_Authenticate">
    </asp:Login>
    
    </form>
</body>
</html>
