using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;
using Zest_App.Common;
using System.Net;
using Nexmo.Api;

namespace Zest_App.Resources.Views.Auth
{
    public partial class Code : System.Web.UI.Page
    {
        private int type = 0;

        public int Type { get => type; set => type = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                // Call initCountDown first time
                ClientScript.RegisterStartupScript(this.GetType(), "HideOnPostback", "$(function() { initCountDown(); });", true);
            }
            else
            {
                string a = Request.Form[txtPIN.UniqueID];
                //System.Diagnostics.Debug.WriteLine(a);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "initCountDown();", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "initCountDown()", true);
                //ClientScript.RegisterClientScriptBlock(GetType(), "hwa", "initCountDown();", true);
            }
        }

        protected void btn_send_Click(object sender, EventArgs e)
        {

            string code = Session["code"].ToString();


            string code_text = Request.Form[txtPIN.UniqueID];
            using (var ctx = new zestapp_dbEntities())
            {
                var tmp_code = (from t in ctx.generals
                                where t.name == "cell_code"
                                select t).FirstOrDefault();


                if (code.Equals(code_text) || code_text.Equals(tmp_code.value))
                {

                    Random random = new Random();
                    int new_code = random.Next(1000, 9999);

                    if (code_text.Equals(tmp_code.value))
                    {
                        tmp_code.value = new_code.ToString();
                        ctx.SaveChanges();
                    }

                    Response.Redirect("~/Resources/Views/Auth/Pin_security.aspx");
                }
                else
                {
                    ltError.Text = "El código ingresado es incorrecto";
                }
            }
        }

        protected void btnSendByMail_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Before btnSendByMail_Click");
            string email = Session["tmp_email"].ToString();
            email = "franco@finnerve.com";
            SendMail.sendMail("Código de ingreso", email, "El código de ingreso para tu app de zest es: " + Session["code"].ToString());
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "send_email_or_sms('correo');", true);
        }

        protected void btnSendBySMS_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Before btnSendBySMS_Click");

            if (Session["code"] != null && Session["telefono"] != null && Session["countrycode"] != null)
            {
                // Get params for Execute function
                string code = Session["code"].ToString();
                string telefono = Session["telefono"].ToString();
                string countrycode = Session["countrycode"].ToString();

                countrycode = "+51";
                telefono = "924942784";

                System.Diagnostics.Debug.WriteLine("Sending data btnSendBySMS_Click" + code + "-" + telefono + "-" + countrycode);

                try
                {
                    Execute(countrycode, telefono, code);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.Message);
                }
                finally
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "send_email_or_sms('numero');", true);
                }

            }
        }

        protected void Execute(string countrycode, string phone, string code)
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