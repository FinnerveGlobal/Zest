using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Layout
{
    public partial class web : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                loadData();
            }
        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {


                var news = (from t in ctx.news
                            where t.estado == "A"
                            where t.web_mobile.ToLower().Contains("web")
                            select t).OrderByDescending(o => o.id).Take(4).ToArray();
                rpNews.DataSource = news;
                rpNews.DataBind();

                var banner = (from t in ctx.web_banners
                              where t.estado == "A"
                              select t).FirstOrDefault();
                if (banner == null)
                {
                    secBanner.Visible = false;
                }
                else
                {
                    ltBannerImg.Text = " <img src=\"" + banner.url_img + "\" style=\"position: absolute; height: 100%;z-index: 1; right: 0; padding: 1px; \" />";
                    ltBannerTitulo.Text = banner.titulo;
                    ltBannerDesc.Text = banner.descripcion;
                    if (!string.IsNullOrEmpty(banner.cta))
                    {
                        ltBannerCta.Text = " <a class=\"btn-zest-black\" href=\"" + banner.cta + "\">Entérate más</a>";
                    }

                }

            }
        }

        protected void btnSendContact_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNombre.Text))
            {
                ShowMessage.warning("El campo nombre es obligatorio", this.Page);
            }
            else if (string.IsNullOrEmpty(txtApellidos.Text))
            {
                ShowMessage.warning("El campo apellido es obligatorio", this.Page);
            }
            else if (string.IsNullOrEmpty(txtMail.Text))
            {
                ShowMessage.warning("El campo correo electrónico es obligatorio", this.Page);
            }
            else if (string.IsNullOrEmpty(txtCelular.Text))
            {
                ShowMessage.warning("El campo teléfono es obligatorio", this.Page);
            }
            else if (string.IsNullOrEmpty(txtMensaje.Text))
            {
                ShowMessage.warning("El campo mensaje es obligatorio", this.Page);
            }
            else
            {
                using (var ctx = new zestapp_dbEntities())
                {
                    var item = new web_leads
                    {
                        nombre = txtNombre.Text,
                        apellido = txtApellidos.Text,
                        created_at = DateTime.Now,
                        updated_at = DateTime.Now,
                        email = txtMail.Text,
                        telefono = txtCelular.Text,
                        estado = "A",
                        mensaje = txtMensaje.Text
                    };
                    ctx.web_leads.Add(item);
                    ctx.SaveChanges();

                    bool tmp = true;
                    SendMail.sendMail("Zest Web, Contáctanos", "cs@zest.pe", "Lead de Zest Web, Contáctanos:\n Nombre: " + txtNombre.Text+ " "+txtApellidos.Text+ " \n Correo: "+txtMail.Text+ "\n Celular: " + txtCelular.Text+"\n Mensaje: "+txtMensaje.Text+"\n Gracias!");
                    if (tmp)
                    {
                        ltSuccess.Text = "Su mensaje ha sido enviado de manera correcta";
                    }
                    else
                    {
                        ltSuccess.Text = "ha ocurrido un error al enviar su mensaje intente más tarde";

                    }
                    txtNombre.Text = "";
                    txtMensaje.Text = "";
                    txtMail.Text = "";
                    txtCelular.Text = "";
                    txtApellidos.Text = "";

                    ShowMessage.success("Su mensaje se ha enviado correctamente", this.Page);

                }
            }
        }
    }
}