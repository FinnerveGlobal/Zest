using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Resources.Layout;

namespace Zest_App.Resources.Views.Backend
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as backend;
            if (master != null)
            {
                master.load();
            }


        }

        [WebMethod]
        public static string heartbeat()
        {
            var heartbeat = DateTime.Now;
            HttpContext.Current.Session["Heartbeat"] = heartbeat;
            return heartbeat.ToString();
        }

    }
}