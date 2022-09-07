using Nexmo.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.More
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadData();
            if (!this.IsPostBack)
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];
                if (reqCookies == null)
                    Response.Redirect("~/Resources/Views/Auth/Home.aspx");
            }
        }

        public void loadData()
        {
            HttpCookie reqCookies = Request.Cookies["userInfo"];
            int id = 0;
            int code = 0;

            if (reqCookies != null)
            {
                id = int.Parse(reqCookies["user_id"].ToString());
                code = int.Parse(reqCookies["user_code"].ToString());
            }

            using (var ctx = new PivZestDevEntities())
            {
                var advisor = ctx.SearchAdvisor(code).FirstOrDefault();

                if(advisor != null) { 
                ltTelefono.Text = "<a href='tel: +51"+advisor.Number+"' class='left'>Llamar</a>";
                ltAdvisor.Text = advisor.Name;
                ltAdvisorEmail.Text = advisor.Email;
                ltAdvisorNumber.Text = advisor.Number;
                txtMensaje.Attributes.Add("placeholder", "Tu mensaje será enviado a '"+advisor.Name+"'");
                }
            }
        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            txtMensaje.Text = "";
            ltEnviado.Text = "Su mensaje ha sido enviado";
        }


        public void Execute(string phone, string code)
        {
            var client = new Client(creds: new Nexmo.Api.Request.Credentials
            {
                ApiKey = "cb2b1eda",
                ApiSecret = "e1H2MnrewOSmIeW2"
            });
            var results = client.SMS.Send(request: new SMS.SMSRequest
            {
                from = "Zest App",
                to = "51" + phone,
                text = "El usuario : " + code
            });

        }
    }
}