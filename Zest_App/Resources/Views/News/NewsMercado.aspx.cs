using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.News
{
    public partial class NewsMercado : System.Web.UI.Page
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
                            where t.tipo == "MERCADO"
                            where t.web_mobile.ToLower().Contains("mobile")
                            select t).OrderByDescending(o => o.id).Take(50).ToArray();
                rpTable.DataSource = news;
                rpTable.DataBind();

            }
        }
        protected void btnExternal_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string url = (string)btn.CommandArgument;

            if (!string.IsNullOrEmpty(url))
            {
                Session["tmpUrl"] = url;

                Response.Redirect("~/Resources/Views/More/externalViewer.aspx?getBack=/Resources/Views/News/NewsMercado.aspx");
            }
            else
            {
                Response.Redirect("~/Resources/Views/News/NewsMercado.aspx");
            }
        }
    }
}