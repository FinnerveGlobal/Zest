using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Auth
{
    public partial class Pin_security : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_send_Click(object sender, EventArgs e)
        {

            string pin = Request.Form[txtPIN.UniqueID];
            if (pin.Length == 4)
            {
                Session["pin"] = pin;


                Response.Redirect("~/Resources/Views/Auth/Pin_validation.aspx");
            }
            else
            {
                ltError.Text = "El código debe tener 4 digitos";
            }
        }
    }
}