using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Catalog
{
    public partial class ZestItem : System.Web.UI.Page
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
            int id = int.Parse(Request.QueryString["id"]);
            using (var ctx = new zestapp_dbEntities())
            {
                var item = (from t in ctx.catalog_items
                               where t.id == id
                               select t).FirstOrDefault();



                ltCodigo.Text = item.codigo_nota;
                ltVenc.Text = item.vencimiento.Value.ToString("dd MMM yy");
                ltMoneda.Text = item.moneda;
                ltInv.Text = item.inv_minima.Value.ToString("N0");

                nota_emisor.Text = item.emisor;
                nota_isin.Text = item.isin;
                nota_adicional.Text = item.adicional;
                nota_barrera.Text = item.barrera;
                nota_moneda.Text = item.moneda;
                nota_riesgo.Text = item.riesgo;
                ltDesc.Text = item.descripcion;
                rentabilidad_Cupon.Text = item.rentabilidad;
                nota_barrera_capital.Text = item.barrera_capital;

                rpTable.DataSource = item.catalog_item_details.Where(o => o.estado == "A").ToArray();
                rpTable.DataBind();
            }
        }

        protected void btnMeInteresa_Click(object sender, EventArgs e)
        {
            btnMeInteresa.Enabled = false;
            btnMeInteresa.Text = "Enviando";
            btnMeInteresa.DataBind();
            int id = 0;
            int code = 0;
            using (var ctx = new PivZestDevEntities())
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];
               

                if (reqCookies != null)
                {
                    id = int.Parse(reqCookies["user_id"].ToString());
                    code = int.Parse(reqCookies["user_code"].ToString());


                }
                var advisor = ctx.SearchAdvisor(code).FirstOrDefault();

                if (SendMail.sendMail(advisor.contacto +" | " + ltCodigo.Text, advisor.Email, "El cliente "+advisor.contacto+", solicita más información sobre la nota " + ltCodigo.Text+"   <br><br> Zest App"))
                {
                    btnMeInteresa.Text = "Solicitud Enviada";
                }
                else
                {
                    btnMeInteresa.Text = "Intenta más tarde";
                }
            }

            using (var ctx = new zestapp_dbEntities())
            {
                var item = new interes_investors
                {
                    created_at = DateTime.Now,
                    investor_code = code.ToString(),
                    nota = ltCodigo.Text,
                    status = "A"
                };
                ctx.interes_investors.Add(item);
                ctx.SaveChanges();
            }
           
          
        }
    }
}