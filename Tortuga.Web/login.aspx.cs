using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Tortuga.Web
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
    }
}