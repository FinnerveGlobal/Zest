using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Views.More
{
    public partial class Algoparati : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

                    bool tmp = true;//SendMail.sendMail("Zest Web, Contáctanos","kraysgs@live.com","El usuario: "+txtNombre.Text+ " "+txtApellidos.Text+ " \n correo: "+txtMail+"\n celular: "+txtCelular.Text+"\n mensaje: "+txtMensaje.Text);
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

                }
            }
        }
    }
}