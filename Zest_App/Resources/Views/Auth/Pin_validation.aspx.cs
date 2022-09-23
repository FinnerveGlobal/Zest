using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Auth
{
    public partial class Pin_validation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_send_Click(object sender, EventArgs e)
        {
            //string telefono = Session["telefono"].ToString();
            string redirect = Session["redirect"].ToString();
            int id = int.Parse(Session["investor_id"].ToString());
            string pin = Request.Form[txtPIN.UniqueID];

            string prvpin = Session["pin"].ToString();

            if (pin == prvpin)
            {
                using (var ctx = new zestapp_dbEntities())
                {
                    investors inv = (from t in ctx.investors
                                    where t.id == id
                                    select t).FirstOrDefault();

                    //inv.telefono = telefono;
                    inv.PIN = pin;
                    inv.updated_at = DateTime.Now;
                    inv.estado = "A";
                    ctx.SaveChanges();

                    HttpCookie userInfo = new HttpCookie("userInfo");
                    userInfo["user_id"] = inv.id.ToString();
                    userInfo["user_code"] = inv.investor_code.ToString();

                    userInfo["redirect"] = redirect;

                    userInfo.Expires = DateTime.Now.AddDays(365);


                    HttpCookie userAInfo = new HttpCookie("userAInfo");
                    userAInfo["user_id"] = inv.id.ToString();
                    userAInfo["user_code"] = inv.investor_code.ToString();

                    userAInfo["redirect"] = redirect;
                    userAInfo.Expires = DateTime.Now.AddDays(365);

                    Response.Cookies.Add(userInfo);
                    Response.Cookies.Add(userAInfo);

                    if (redirect == "ASSESOR")
                    {
                        Response.Redirect("~/Resources/Views/Assesor/ListInvestor.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Resources/Views/Dashboard/Resumen.aspx");
                    }
                }
            }
            else
            {
                ltError.Text = "Pin incorrecto";
            }
        }
    }
}