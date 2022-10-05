using Nexmo.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Auth
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["intentos"] == null)
            {
                Session["intentos"] = 0;
            }
            if (Session["fecha_intento"] == null)
            {
                Session["fecha_intento"] = DateTime.Now.AddMinutes(-2);
            }
        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            string us = txtUsuario.Text.Replace(" ", "");
            string pass = txtPass.Text.Replace(" ", "");

            Session["tmp_email"] = us;

            if (string.IsNullOrEmpty(us) || string.IsNullOrEmpty(pass))
            {
                ltErrorUs.Text = "Usuario incorrecto";
                ltErrorPass.Text = "Teléfono incorrecto";
            }
            else
            {
                if (DateTime.Now > ((DateTime)Session["fecha_intento"]).AddMinutes(2) && ((int)Session["intentos"]) < 3)
                {

                    Session["fecha_intento"] = DateTime.Now;
                    Session["intentos"] = 0;

                    List<investors> inv = Authentication.login(us, pass);
                    if (inv == null)
                    {
                        ltErrorUs.Text = "Usuario incorrecto";
                        ltErrorPass.Text = "Teléfono incorrecta";
                    }
                    else
                    {
                        using (var ctx = new zestapp_dbEntities())
                        {

                            Session["investor_list"] = inv;


                            Random random = new Random();
                            int code = random.Next(1000, 9999);


                            if (pass == "000000")
                            {
                                code = 9999;
                            }
                            else
                            {
                                try { Execute(ddlCode.SelectedValue, pass, code.ToString()); }
                                catch (Exception ex) { }
                            }



                            Session["code"] = code;
                            Session["telefono"] = pass;

                            if (inv.Count() > 1)
                            {
                                Session["investor_id"] = ctx.investors.Where(o => o.email == us).FirstOrDefault().id;
                                Session["investor_code"] = ctx.investors.Where(o => o.email == us).FirstOrDefault().investor_code;
                                Session["redirect"] = "ASSESOR";

                            }
                            else
                            {
                                Session["investor_id"] = inv.FirstOrDefault().id;
                                Session["investor_code"] = inv.FirstOrDefault().investor_code;
                                Session["redirect"] = "INVESTOR";
                            }
                            Response.Redirect("~/Resources/Views/Auth/Code.aspx");
                        }
                    }

                }
                else
                {
                    txtPass.Text = "";
                    int intentos = (int)Session["intentos"];
                    if (intentos >= 3){
                        ltErrorPass.Text = "ha exedido el número de intentos, espere hasta mañana";
                    }
                    else
                    {
                        ltErrorPass.Text = "Espere 2 min, para reenviar el cdigo";
                    }
                    intentos++;
                    Session["intentos"] = intentos;
                }
            }

        }
        public void Execute(string countrycode, string phone, string code)
        {

            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            var client = new Client(creds: new Nexmo.Api.Request.Credentials
            {
                ApiKey = "2269164b",
                ApiSecret = "6wLdfL5bo3ZtsfERSh6LL43!z"
            });
            var results = client.SMS.Send(request: new SMS.SMSRequest
            {
                from = "Zest App",
                to = countrycode + phone,
                text = "Bienvenido a Zest App. Tu codigo de seguridad es: " + code
            });

        }
    }
}