using System;
using System.Web.Services;

namespace Tortuga.Web.Private
{
    public partial class AjaxDemo : System.Web.UI.Page
    {
        public static string[] UserNameArray;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserNameArray = new string[3] { "Oscar", "Andrea", "mercedez" };
        }
        [WebMethod()]
        public static bool CheckUserName(string sUserName)
        {
            foreach (var strUsername in UserNameArray) 
            { 
                if (sUserName == strUsername)         
                return true;
            } 
            return false;
        }
    }
}