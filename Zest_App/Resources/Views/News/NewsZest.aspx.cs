using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.News
{
    public partial class NewsZest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];
                if (reqCookies == null)
                    Response.Redirect("~/Resources/Views/Auth/Home.aspx");
                loadData();
            }
        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {

                var news = (from t in ctx.news
                            where t.estado == "A"
                            where t.tipo == "ZEST"
                            where t.web_mobile.ToLower().Contains("mobile")
                            select
                            new
                            {
                                t.id,
                                t.created_at,
                                t.updated_at,
                                t.estado,
                                t.cta,
                                t.descripcion,
                                t.nota_codigo,
                                t.tags,
                                t.tipo,
                                t.titular,
                                t.url_img,
                                t.web_mobile
                            }).OrderByDescending(o => o.id).Take(15).ToArray();

                var blog = (from t in ctx.web_entry_blogs
                            where t.estado == "A"
                            select new
                            {
                                t.id,
                                t.created_at,
                                t.updated_at,
                                t.estado,
                                cta = "https://zest.pe/ef/" + t.entry_url,
                                descripcion = t.descrip,
                                nota_codigo = "",
                                t.tags,
                                tipo = "",
                                titular = t.titulo,
                                url_img = t.img_url,
                                web_mobile = "mobile"
                            }).OrderByDescending(o => o.id).Take(15).ToArray();

                rpTable.DataSource = news.Union(blog).OrderByDescending(o => o.created_at).ToArray();
                rpTable.DataBind();


                HttpCookie reqCookies = Request.Cookies["userInfo"];
                int id = int.Parse(reqCookies["user_id"].ToString());

                var not = ctx.notifications.Where(o => o.estado == "A" && o.investor_id == id && o.notification1 == "news").FirstOrDefault();
                if (not != null)
                {
                    not.estado = "R";
                    ctx.SaveChanges();
                }
            }
        }

        protected void btnExternal_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string url = (string)btn.CommandArgument;

            if (!string.IsNullOrEmpty(url))
            {
                Session["tmpUrl"] = url;

                Response.Redirect("~/Resources/Views/More/externalViewer.aspx?getBack=/Resources/Views/News/NewsZest.aspx");
            }
            else
            {
                Response.Redirect("~/Resources/Views/News/NewsZest.aspx");
            }
        }
    }
}