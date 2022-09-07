using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Catalog
{
    public partial class ZestCatalog : System.Web.UI.Page
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

        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {

                var items = (from t in ctx.catalog_items
                            where t.estado == "A"
                            select t).OrderByDescending(o => o.id).ToArray();

                rpTable.DataSource = items;
                rpTable.DataBind();

                HttpCookie reqCookies = Request.Cookies["userInfo"];
                int id  = int.Parse(reqCookies["user_id"].ToString());

                var not = ctx.notifications.Where(o => o.estado == "A" && o.investor_id == id && o.notification1 == "catalog").FirstOrDefault();
                if (not != null)
                {
                    not.estado = "R";
                    ctx.SaveChanges();
                }


            }
        }
    }
}