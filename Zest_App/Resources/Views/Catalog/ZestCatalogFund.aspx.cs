using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Catalog
{
    public partial class ZestCatalogFund : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMeInteresa_Click(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine("SomeText");
            //System.Diagnostics.Debug.WriteLine(btnMeInteresa.CommandArgument);

            btnMeInteresa.Enabled = false;
            btnMeInteresa.Text = "Enviando";
            btnMeInteresa.DataBind();

            int id = 0;
            int code = 0;
            using (var ctx = new PivZestDevEntities())
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];


                if (reqCookies != null)
                {
                    id = int.Parse(reqCookies["user_id"].ToString());
                    code = int.Parse(reqCookies["user_code"].ToString());


                }
                var advisor = ctx.SearchAdvisor(code).FirstOrDefault();

                if (SendMail.sendMail(advisor.contacto + " | " + ltCodigo.Text, advisor.Email, "El cliente " + advisor.contacto + ", solicita más información sobre la nota " + ltCodigo.Text + "   <br><br> Zest App"))
                {
                    btnMeInteresa.Text = "Solicitud Enviada";
                }
                else
                {
                    btnMeInteresa.Text = "Intenta más tarde";
                }
            }

            using (var ctx = new zestapp_dbEntities())
            {
                var item = new interes_investors
                {
                    created_at = DateTime.Now,
                    investor_code = code.ToString(),
                    nota = ltCodigo.Text,
                    status = "A"
                };
                ctx.interes_investors.Add(item);
                ctx.SaveChanges();
            }
        }

        protected void btnExternal_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string url = (string)btn.CommandArgument;

            if (!string.IsNullOrEmpty(url))
            {
                Session["tmpUrl"] = url;

                Response.Redirect("~/Resources/Views/More/externalViewer.aspx?getBack=/Resources/Views/Catalog/ZestCatalogFund.aspx");
            }

        }
    }
}