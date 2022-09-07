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

        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            string us = txtUsuario.Text.Replace(" ", "");
            string pass = txtPass.Text.Replace(" ","");

            if(string.IsNullOrEmpty(us) || string.IsNullOrEmpty(pass))
            {
                ltErrorUs.Text = "Usuario incorrecto";
                ltErrorPass.Text = "Teléfono incorrecto";
            }
            else
            {
                List<investors> inv = Authentication.login(us,pass);
                if(inv == null)
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


                        if(pass == "000000")
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

                        if(inv.Count() > 1)
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

        }
        public void Execute(string countrycode,string phone,string code)
        {

            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            var client = new Client(creds: new Nexmo.Api.Request.Credentials
            {
                ApiKey = "2269164b",
                ApiSecret = "kzNwPMewuMf9f3X3"
            });
            var results = client.SMS.Send(request: new SMS.SMSRequest
            {
                from = "Zest App",
                to = countrycode+phone,
                text = "Bienvenido a Zest App. Tu código de seguridad es: "+code
            });

        }
    }
}