using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zest_App.Resources.Views.Auth
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAlgoParaTi_Click(object sender, EventArgs e)
        {
            Session["tmpUrl"] = "https://zest.pe/blog";

            Response.Redirect("~/Resources/Views/More/externalViewer.aspx?getBack=/Resources/Views/Auth/Home.aspx");
        }
    }
}