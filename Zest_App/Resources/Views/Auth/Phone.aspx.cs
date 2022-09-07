using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zest_App.Resources.Views.Auth
{
    public partial class Phone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            string telefono = Request.Form[txtPIN.UniqueID];

            Random random = new Random();
            int code = random.Next(1000, 9999);

            code = 1234;

            Session["code"] = code;
            Session["telefono"] = telefono;

            Response.Redirect("~/Resources/Views/Auth/Code.aspx");


        }
    }
}