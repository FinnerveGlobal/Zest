using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Auth
{
    public partial class Pin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie reqCookies = Request.Cookies["userAInfo"];

                int id = 0;

                if (reqCookies != null)
                {
                    id = int.Parse(reqCookies["user_id"].ToString());
                }

                if (id == 0)
                {
                    Response.Redirect("~/Resources/Views/Auth/Login.aspx");
                }

                using (var ctx = new zestapp_dbEntities())
                {
                    var investor = (from t in ctx.investors
                                    where t.id == id
                                    select t).FirstOrDefault();
                    if (investor != null) { 
                    if (investor.estado == "P")
                    {
                        Response.Redirect("~/Resources/Views/Auth/Login.aspx");
                    }
                    }
                }
            }
        }

        protected void btn_send_Click(object sender, EventArgs e)
        {

            HttpCookie reqCookies = Request.Cookies["userAInfo"];

            int id = 0;

            if (reqCookies != null)
            {
                id = int.Parse(reqCookies["user_id"].ToString());
            }


            using (var ctx = new zestapp_dbEntities())
            {
                var investor = (from t in ctx.investors
                                where t.id == id
                                select t).FirstOrDefault();


                string pin = investor.PIN;
                string pin_login = Request.Form[txtPIN.UniqueID];

                if (pin == pin_login)
                {
                    var redirect = reqCookies["redirect"].ToString();
                    if (redirect == "ASSESOR")
                    {
                        Session["investor_list"] = Authentication.login(investor.email,"");
                        Response.Redirect("~/Resources/Views/Assesor/ListInvestor.aspx");
                    }
                    else { 
                        Response.Redirect("~/Resources/Views/Dashboard/Resumen.aspx");
                    }
                }
                else
                {
                    txtPIN.Text = "";
                    ltError.Text = "El pin ingresado es incorrecto";
                }

            }

        }
    }
}