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
                    HistoryPin = (inv.HPIN != null) ? inv.HPIN.Split(',') : new string[] { "0" };
 
                    if (HistoryPin.Length < 3) {
                        inv.HPIN = "0" + "," + "0" + "," + "0";
                        ctx.SaveChanges();
                        Session["pin"] = pin;
                        Response.Redirect("~/Resources/Views/Auth/Pin_validation.aspx");
                    }
                    else
                    {
                       
                            if (pin == HistoryPin[0] || pin== HistoryPin[1] || pin == HistoryPin[2])
                            {
                                ltError.Text = "El pin ya se utilizó anteriormente";
                            }
                            else
                            {
                            //inv.HPIN = pin + "," + HistoryPin[0] + "," + HistoryPin[1];
                            //ctx.SaveChanges();

                            Session["pin"] = pin;
                                Response.Redirect("~/Resources/Views/Auth/Pin_validation.aspx");
                            }
                        
                        }
                    }
                }
                    
            else
            {
                ltError.Text = "El código debe tener 4 digitos";
            }
        }
    }
}