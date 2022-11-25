using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Dashboard
{
    public partial class AnalisisELN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("es-ES");
            loadMenu();
            loadData();
        }

        public void loadMenu()
        {
            string id = Request.QueryString["id"];
            string type = Request.QueryString["type"];
            bool active = true;
            if (type != "ELN" && type != "CLN")
            {
                type = "ELN";
                active = false;
            }

            string i_dot = "";

            using (var ctx = new zestapp_dbEntities())
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];
                int idinv = int.Parse(reqCookies["user_id"].ToString());

                var not = ctx.notifications.Where(o => o.estado == "A" && o.investor_id == idinv && o.notification1.Contains(id)).FirstOrDefault();
                if (not != null)
                {
                    i_dot = "<div style='position: absolute; right: 0; top: 0; margin-top:-20px'>" +
                           "<i class='fas fa-circle fa-active'></i>" +
                           "</div>";
                }
            }

            notas_menu.Text = "<a class=\"menu_item btn_load\" href=\"Activos" + type + ".aspx?id=" + id + "&type=" + Request.QueryString["type"] + "\" >" +
            "Activos" +
            "<span></span>" +
            "</a>" +
            "<a class=\"menu_item btn_load\" style='display:" + (active ? "unset" : "none") + "' href=\"Eventos" + type + ".aspx?id=" + id + "&type=" + Request.QueryString["type"] + "\"  > " +
                "Eventos" +
                "<span></span>" +
            "</a>" +
            "<a class=\"menu_item btn_load active\" href =\"AnalisisELN.aspx?id=" + id + "&type=" + Request.QueryString["type"] + "\"  > " +
                "Análisis" +
                "<span></span>" + i_dot +
            "</a>";
        }

        public void loadData()
        {
            string id = Request.QueryString["id"] + ",";
            using (var ctx = new zestapp_dbEntities())
            {
                var reviews = (from t in ctx.reviews
                               where t.note_code.Contains(id)
                               orderby t.created_at descending
                               select t).ToArray();


                rpReviews.DataSource = reviews;
                rpReviews.DataBind();

                HttpCookie reqCookies = Request.Cookies["userInfo"];
                int idinv = int.Parse(reqCookies["user_id"].ToString());

                var not = ctx.notifications.Where(o => o.estado == "A" && o.investor_id == idinv && o.notification1.Contains(id)).FirstOrDefault();
                if (not != null)
                {
                    not.estado = "R";
                    ctx.SaveChanges();
                }
            }
        }

        protected void btnPdf_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            Session["pdf_url"] = btn.CommandArgument;
            System.Diagnostics.Debug.WriteLine(btn.CommandArgument);
            Session["getBack"] = "/Resources/Views/Dashboard/AnalisisELN.aspx?id=" + Request.QueryString["id"] + "&type=" + Request.QueryString["type"];
            Response.Redirect("~/Resources/Views/More/pdfViewer.aspx");
        }
    }
}