using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Website
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Democratizando la banca privada | Zest";
            Page.MetaKeywords = "Finanzas, Zest, Bolsa de inversión";
            Page.MetaDescription = "Brindamos acceso global al mercado de capitales, conectándote a través de tecnología y asesorí personalizada";

            loadData();
        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var sections = (from t in ctx.web_sections
                                where t.estado == "A"
                                where t.web_menu_id == 1
                                select t) ;

                var landing = (web_sections)sections.Where(o => o.nombre == "Landing").FirstOrDefault();
                if (landing != null)
                {
                    secLanding.Visible = true;
                    ltLandingTitle.Text = landing.desc1;
                    ltLandingDesc.Text = landing.desc2;
                }
                else
                {
                    secLanding.Visible = false;
                }

                var resumen = (web_sections)sections.Where(o => o.nombre == "Resumen").FirstOrDefault();
                if (resumen != null)
                {
                    secResumen.Visible = true;
                    ltResumenCita.Text = resumen.desc1;
                    ltResumenAuthor.Text = resumen.desc2;
                }
                else
                {
                    secResumen.Visible = false;
                }

                var cifra = (web_sections)sections.Where(o => o.nombre == "Cifras").FirstOrDefault();
                if (cifra != null)
                {
                    secCifras.Visible = true;
                    ltCifra1.Text = "<div class=\"counter\" data-target=\""+ cifra.desc1 + "\">0</div>";
                    ltCifra2.Text = "<div class=\"counter2\" data-target=\"" + cifra.desc2 + "\">0</div>";
                    ltCifra3.Text = "<div class=\"counter\" data-target=\"" + cifra.desc3 + "\">0</div>";
                    ltCifrasFecha.Text = cifra.preview;

                }
                else
                {
                    secCifras.Visible = false;
                }

            }
        }

    }
}