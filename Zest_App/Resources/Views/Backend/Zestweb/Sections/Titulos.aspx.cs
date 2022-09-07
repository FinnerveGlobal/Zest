using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;
using Zest_App.Resources.Layout;

namespace Zest_App.Resources.Views.Backend.Zestweb.Sections
{
    public partial class Titulos : System.Web.UI.Page
    {
        [WebMethod]
        public static string heartbeat()
        {
            var heartbeat = DateTime.Now;
            HttpContext.Current.Session["Heartbeat"] = heartbeat;
            return heartbeat.ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var master = Master as backend;
            if (master != null)
            {
                master.load();
            }
            if (!this.IsPostBack)
            {

                loadData();
            }

        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var table = (from t in ctx.web_sections
                             where t.nombre == "Cifras"
                             select t).FirstOrDefault();

                txtVolumen.Text = table.desc1;
                txtIntereses.Text = table.desc2;
                txtTitulos.Text = table.desc3;
                txtFecha.Text = table.preview;
            }
        }

        protected void btnSaveV_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var table = (from t in ctx.web_sections
                             where t.nombre == "Cifras"
                             select t).FirstOrDefault();

                table.desc1 = txtVolumen.Text;
                ctx.SaveChanges();

                ShowMessage.success("Volumen editado", this);
            }
        }

        protected void btnSaveI_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var table = (from t in ctx.web_sections
                             where t.nombre == "Cifras"
                             select t).FirstOrDefault();

                table.desc2 = txtIntereses.Text;
                ctx.SaveChanges();

                ShowMessage.success("Intereses editados", this);
            }
        }

        protected void btnSaveT_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var table = (from t in ctx.web_sections
                             where t.nombre == "Cifras"
                             select t).FirstOrDefault();

                table.desc3 = txtTitulos.Text;
                ctx.SaveChanges();

                ShowMessage.success("Títulos editados", this);
            }
        }

        protected void btnSaveFecha_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var table = (from t in ctx.web_sections
                             where t.nombre == "Cifras"
                             select t).FirstOrDefault();

                table.preview = txtFecha.Text;
                ctx.SaveChanges();

                ShowMessage.success("Fecha editada", this);
            }
        }
    }
}