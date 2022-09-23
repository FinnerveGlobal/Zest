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
            int id = int.Parse(Session["investor_id"].ToString());
            string pin = Request.Form[txtPIN.UniqueID];
            string[] HistoryPin;
            if (pin.Length == 4)
            {
                using (var ctx = new zestapp_dbEntities())
                {
                    investors inv = (from t in ctx.investors
                                     where t.id == id
                                     select t).FirstOrDefault();
                   
                }
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