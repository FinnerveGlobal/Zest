using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Website
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Notas de prensa | Zest";
            if (!this.IsPostBack)
            {
                loadData();
            }
        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string search = txtSearch.Text.ToLower();

                var news = (from t in ctx.news
                            where t.estado == "A"
                            where t.web_mobile.ToLower().Contains("web")
                            where t.titular.ToLower().Contains(search) || t.descripcion.ToLower().Contains(search)
                            select t).OrderByDescending(o => o.id).ToArray();
                rpNews.DataSource = news;
                rpNews.DataBind();

            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
        }
    }
}