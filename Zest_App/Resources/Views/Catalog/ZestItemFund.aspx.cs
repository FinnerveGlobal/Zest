using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Catalog
{
    public partial class ZestItemFund : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("es-ES");
            if (!this.IsPostBack)
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];
                if (reqCookies == null)
                    Response.Redirect("~/Resources/Views/Auth/Home.aspx");
                loadData();
            }
        }

        private void loadData()
        {
            int id = int.Parse(Request.QueryString["id"]);
            using (var ctx = new zestapp_dbEntities())
            {
                catalog_fund_items item = (from t in ctx.catalog_fund_items
                            where t.id == id
                            select t).FirstOrDefault();
                if(item != null)
                {
                    ltCodigo.Text = item.codigo_fondo;
                    ltInv.Text = item.inv_minima.Value.ToString("N0");
                    ltMoneda.Text = item.moneda;
                    fondo_gestor.Text = item.gestor;
                    fondo_auditor.Text = item.auditor;
                    fondo_moneda.Text = item.moneda;
                    fondo_administrador.Text = item.administrador;
                    fondo_custodio.Text = item.custodio;
                    fondo_riesgo.Text = item.riesgo;
                    ltDesc.Text = item.descripcion;
                }
            }

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

            Session["pdf_url"] = btn.CommandArgument;
            System.Diagnostics.Debug.WriteLine(btn.CommandArgument);
            Session["getBack"] = "/Resources/Views/Catalog/ZestItemFund.aspx?id=" + Request.QueryString["id"];
            Response.Redirect("~/Resources/Views/More/pdfViewerNew.aspx");

            //LinkButton btn = (LinkButton)sender;
            //string url = (string)btn.CommandArgument;

            //if (!string.IsNullOrEmpty(url))
            //{
            //    Session["tmpUrl"] = url;

            //    Response.Redirect("~/Resources/Views/More/externalViewer.aspx?getBack=/Resources/Views/Catalog/ZestCatalogFund.aspx");
            //    Response.Redirect("~/Resources/Views/More/externalPdfViewer.aspx?getBack=/Resources/Views/Catalog/ZestCatalogFund.aspx");
            //}
        }

        protected void btnExternal_Click_Iframe(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string url = (string)btn.CommandArgument;

            if (!string.IsNullOrEmpty(url))
            {
                Session["tmpUrl"] = url;

                //Response.Redirect("~/Resources/Views/More/externalViewer.aspx?getBack=/Resources/Views/Catalog/ZestCatalogFund.aspx");
                Response.Redirect("~/Resources/Views/More/externalPdfViewer.aspx?getBack=/Resources/Views/Catalog/ZestCatalogFund.aspx");
            }
        }

        protected void btnExternal_Click_Object(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string url = (string)btn.CommandArgument;

            if (!string.IsNullOrEmpty(url))
            {
                Session["tmpUrl"] = url;

                //Response.Redirect("~/Resources/Views/More/externalViewer.aspx?getBack=/Resources/Views/Catalog/ZestCatalogFund.aspx");
                Response.Redirect("~/Resources/Views/More/externalPdfViewerObjectVer.aspx?getBack=/Resources/Views/Catalog/ZestCatalogFund.aspx");
            }
        }

        protected void btnExternal_Click_Embed(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string url = (string)btn.CommandArgument;

            if (!string.IsNullOrEmpty(url))
            {
                Session["tmpUrl"] = url;

                //Response.Redirect("~/Resources/Views/More/externalViewer.aspx?getBack=/Resources/Views/Catalog/ZestCatalogFund.aspx");
                Response.Redirect("~/Resources/Views/More/externalPdfViewerEmbedVer.aspx?getBack=/Resources/Views/Catalog/ZestCatalogFund.aspx");
            }
        }
    }


}