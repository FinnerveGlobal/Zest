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
    public partial class ActivosCLN : System.Web.UI.Page
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
                    i_dot = "<div style='position: absolute; right: 0; top: 0; margin - top:-20px'>" +
                            "<i class='fas fa-circle fa-active'></i>" +
                            "</div>";
                }
            }

            notas_menu.Text = "<a class=\"menu_item btn_load active\" href=\"Activos"+ type + ".aspx?id=" + id + "&type="+ Request.QueryString["type"] + "\" >" +
            "Activos" +
            "<span></span>" +
            "</a>" +
            "<a class=\"menu_item btn_load\" style='display:" + (active ? "unset" : "none") + "' href=\"Eventos" + type + ".aspx?id=" + id + "&type=" + Request.QueryString["type"] + "\"  > " +
                "Eventos" +
                "<span></span>" +
            "</a>" +
            "<a class=\"menu_item btn_load\" href =\"AnalisisELN.aspx?id=" + id + "&type=" + Request.QueryString["type"] + "\"  > " +
                "Análisis" +
                "<span></span>" + i_dot +
            "</a>";
        }

        public void loadData()
        {
            string id = Request.QueryString["id"];

            note nota;
            using (var ctx = new zestapp_dbEntities())
            {
                var tmp = (List<note>)Session["notas_list"];
                nota = tmp.Where(o => o.codigo == id).FirstOrDefault();

                nota_nombre.Text = "Nota " + nota.codigo;
                nota_vencimiento.Text = ((DateTime)nota.vencimiento).ToString("dd MMM yy");
                nota_valor.Text = nota.valor == null ? "0" : ((Double)nota.valor).ToString("N0");
                nota_rentabilidad.Text = "<span style=\"color: #1ecd93\"><i class=\"fas fa-sort-up\"></i><i style=\"font - size:7px\"></i> " + (nota.dividendos == null ? "" : ((decimal)nota.dividendos).ToString("N0")) + " " + nota.moneda + "</ span >";
                nota_emisor.Text = nota.emisor;
                nota_isin.Text = nota.ISN;
                nota_moneda.Text = nota.moneda;
                nota_barrera_cupon.Text = nota.barrera_europea;
                nota_barrera_capital.Text = nota.riesgo;
                nota_rent.Text = nota.rentabilidad.ToString();

                /* rpActivos.DataSource = nota.assets;
                 rpActivos.DataBind();*/
            }

            using (var ctx = new PivZestDevEntities())
            {
                var assets = ctx.SP_Subyacentes(int.Parse(nota.adicional)).ToArray();
                rpActivos.DataSource = assets;
                rpActivos.DataBind();


            }


        }
    }
}