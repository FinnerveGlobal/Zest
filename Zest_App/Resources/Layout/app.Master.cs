using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Layout
{
    public partial class app : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              HttpCookie reqCookies = Request.Cookies["userInfo"];
            HttpCookie reqACookies = Request.Cookies["userAInfo"];
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
                  ltNumber.Text = "<a href='tel:+51" + advisor.Number + "' target='_parent' class='left'>Llamar a mi asesor <i class='fas fa-chevron-right'></i></a>";
                  }
                  else
                  {
                      ltNumber.Text = "<a class='left'>Sin asesor asignado <i class='fas fa-chevron-right'></i></a>";
                  }
              }

            string red = reqACookies["redirect"].ToString();

            if (red == "ASSESOR")
            {
                ltReturn.Visible = true;
            }
            else
            {
                ltReturn.Visible = false;
            }

                using (var ctx = new zestapp_dbEntities())
            {
                var nots = ctx.notifications.Where(o => o.investor_id == 1);

                System.Diagnostics.Debug.WriteLine("Notifications: " + nots.ToArray().Length);

                if (nots.Where(o => o.estado == "A" && o.notification1 == "panel").FirstOrDefault() != null)
                {
                    not_panel.Attributes.Add("class", "fas fa-circle fa-active");
                }
                else
                {
                    not_panel.Attributes.Add("class", "fas fa-circle fa-inactive");
                }

                if (nots.Where(o => o.estado == "A" && o.notification1 == "catalog").FirstOrDefault() != null)
                {
                    not_catalog.Attributes.Add("class", "fas fa-circle fa-active");
                }
                else
                {
                    not_catalog.Attributes.Add("class", "fas fa-circle fa-inactive");
                }
                if (nots.Where(o => o.estado == "A" && o.notification1 == "news").FirstOrDefault() != null)
                {
                    not_news.Attributes.Add("class", "fas fa-circle fa-active");
                }
                else
                {
                    not_news.Attributes.Add("class", "fas fa-circle fa-inactive");
                }

            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Resources/Views/Auth/Home.aspx");
        }

        protected void btnLogoutAndDeleteInfo_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["userAInfo"] != null)
            {
                Response.Cookies["userAInfo"].Expires = DateTime.Now.AddDays(-1);
                if (Request.Cookies["userInfo"] != null)
                {
                    Response.Cookies["userInfo"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("/Resources/Views/Auth/Home.aspx");
            }
            if (Request.Cookies["userInfo"] != null)
            {
                Response.Cookies["userInfo"].Expires = DateTime.Now.AddDays(-1);
                if (Request.Cookies["userAInfo"] != null)
                {
                    Response.Cookies["userAInfo"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("/Resources/Views/Auth/Home.aspx");
            }
        }

        protected void btnCatalog_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var notifications = (from t in ctx.notifications
                                     where t.investor_id == 1
                                     where t.estado == "A"
                                     where t.notification1.Contains("catalog")
                                     select t).ToList();
                notifications.ForEach(o => o.estado = "R");
                System.Diagnostics.Debug.WriteLine("btnCatalog_Click: " + notifications.Count);
                ctx.SaveChanges();
            }
            Response.Redirect("/Resources/Views/Catalog/ZestCatalog.aspx");
        }

        protected void btnNews_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var notifications = (from t in ctx.notifications
                                     where t.investor_id == 1
                                     where t.estado == "A"
                                     where t.notification1.Contains("news")
                                     select t).ToList();
                notifications.ForEach(o => o.estado = "R");
                System.Diagnostics.Debug.WriteLine("btnNews_Click: " + notifications.Count);
                ctx.SaveChanges();
            }
            Response.Redirect("/Resources/Views/News/NewsZest.aspx");
        }

        protected void btnPanel_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var notifications = (from t in ctx.notifications
                                     where t.investor_id == 1
                                     where t.estado == "A"
                                     where t.notification1.Contains("panel")
                                     select t).ToList();
                notifications.ForEach(o => o.estado = "R");
                System.Diagnostics.Debug.WriteLine("btnPanel_Click: " + notifications.Count);
                ctx.SaveChanges();
            }
            Response.Redirect("/Resources/Views/Dashboard/Resumen.aspx");
        }

    }
}