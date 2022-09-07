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
    public partial class EventosELN : System.Web.UI.Page
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

                var not = ctx.notifications.Where(o => o.estado == "A" && o.investor_id == idinv && o.notification1 == id).FirstOrDefault();
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
            "<a class=\"menu_item btn_load active\"  style='display:" + (active ? "unset" : "none") + "' href=\"Eventos" + type + ".aspx?id=" + id + "&type=" + Request.QueryString["type"] + "\"  > " +
                "Eventos" +
                "<span></span>" +
            "</a>" +
            "<a class=\"menu_item btn_load\" href =\"AnalisisELN.aspx?id=" + id + "&type=" + Request.QueryString["type"] + "\"  > " +
                "Análisis" +
                "<span></span>" +i_dot+
            "</a>";
        }
        public void loadData()
        {
            string id = Request.QueryString["id"];

            note nota;

            var tmp = (List<note>)Session["notas_list"];
            nota = tmp.Where(o => o.codigo == id).FirstOrDefault();

            using (var ctx = new zestapp_dbEntities())
            {

                nota_nombre.Text = "Nota "+nota.codigo;
                nota_vencimiento.Text = ((DateTime)nota.vencimiento).ToString("dd MMM yy");
                nota_valor.Text = ((Double)nota.valor).ToString("N0");
                nota_rentabilidad.Text = "<span style=\"color: #1ecd93\"><i class=\"fas fa-sort-up\"></i><i style=\"font - size:7px\"></i> " + (nota.dividendos == null ? "" : ((decimal)nota.dividendos).ToString("N0")) + " " + nota.moneda + "</ span >";

            }

            using (var ctx = new PivZestDevEntities())
            {
                if (nota.tipo_nota == "ELN")
                {

                    var eventos = ctx.SP_ReturnNoteEventELN(int.Parse(nota.adicional)).Where(o => o.Tipo == 1).ToArray();

                    decimal total = (decimal)nota.valor;
                   
                    rpEventos.DataSource = eventos.Select(o =>
                      new {
                          o.Fecha_Cupón,
                          o.Fecha_Observación,
                          o.FincomeEventId,
                          o.FincomeId,
                          o.PorcentajePagado,
                          o.Symbol,
                          o.Tasa,
                          o.Tipo,
                          o.TipoRedondeo,
                          o.Valor,
                          dividendos = total == 0?0:(o.PorcentajePagado*total)/100,
                          impuestos = total == 0 ? 0 : ((o.PorcentajePagado * total) / 100)*(decimal)(0.05),
                          redencion = total == 0 ? 0 : ((o.PorcentajePagado * total) / 100) * (decimal)(0.95),
                      }).ToArray();

                    rpEventos.DataBind();


                }
                else if (nota.tipo_nota == "CLN")
                {
                    var eventos = ctx.SP_ReturnNoteEventCLN(int.Parse(nota.adicional)).Where(o => o.Tipo == 1).ToArray();
                    rpEventos.DataSource = eventos;
                    rpEventos.DataBind();


                }
                else
                {
                    var eventos = ctx.SP_ReturnNoteEventELN(int.Parse(nota.adicional)).Where(o => o.Tipo == 1).ToArray();
                    rpEventos.DataSource = eventos;
                    rpEventos.DataBind();
                }


            }
              
        }
    }
}