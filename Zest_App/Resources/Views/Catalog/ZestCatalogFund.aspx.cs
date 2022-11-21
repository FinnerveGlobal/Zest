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
            using (var ctx = new zestapp_dbEntities())
            {

                var items = (from t in ctx.catalog_fund_items
                             where t.estado == "A"
                             select t).OrderByDescending(o => o.id).ToArray();

                rpTable.DataSource = items;
                rpTable.DataBind();

                HttpCookie reqCookies = Request.Cookies["userInfo"];
                int id = int.Parse(reqCookies["user_id"].ToString());

                var not = ctx.notifications.Where(o => o.estado == "A" && o.investor_id == id && o.notification1 == "catalog").FirstOrDefault();
                if (not != null)
                {
                    not.estado = "R";
                    ctx.SaveChanges();
                }
            }
        }

        private void load_data()
        {

        }
    }
}