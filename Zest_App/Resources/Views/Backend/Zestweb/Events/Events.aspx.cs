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

namespace Zest_App.Resources.Views.Backend.Zestweb.Events
{
    public partial class Events : System.Web.UI.Page
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
                string search = txtSearch.Text.ToUpper();
                var table = (from t in ctx.web_events
                             where t.estado != "R"
                             where t.titulo.ToUpper().Contains(search) || t.descripcion.ToUpper().Contains(search)
                             select t).OrderByDescending(o => o.id).ToArray();

                dgvTable.DataSource = table;
                dgvTable.DataBind();
            }
        }
        protected void dgvTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            loadData();
            dgvTable.PageIndex = e.NewPageIndex;
            dgvTable.DataBind();
        }
        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_events
                            where t.id == id
                            select t).FirstOrDefault();

           
                item.estado = "A";

                ctx.SaveChanges();
                loadData();
                ShowMessage.info("Evento Activo", this);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_events
                            where t.id == id
                            select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Evento Desactivado", this);
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_events
                            where t.id == id
                            select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Evento Eliminado", this);
            }
        }
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
            txtSearch.Focus();
        }

        protected void btnSaveNew_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                web_events new_item = new web_events
                {
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    estado = "A",
                    descripcion = txtDesc.Text,
                    titulo = txtTitulo.Text,
                    cta = txtCta.Text,
                    url_img = txtUrl.Text,
                    lugar = txtLugar.Text,
                    duracion = 1,
                    h_min = "h",
                    url_img_banner = txtUrl.Text,
                    event_date = DateTime.Parse(Request.Form[txtFecha.UniqueID])
            };

                ctx.web_events.Add(new_item);
                ctx.SaveChanges();
                loadData();


                txtUrl.Text = "";
                txtTitulo.Text = "";
                txtDesc.Text = "";
                txtCta.Text = "";
                txtLugar.Text = "";

                ShowMessage.info("evento Guardado", this);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_new();", true);

            }
        }
        protected void btnEditar_Click(object sender, EventArgs e) {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                Session["tmpid"] = id;

                var item = (from t in ctx.web_events
                             where t.id == id
                             select t).FirstOrDefault();

                txtUrlEdit.Text = item.url_img;
                txtTituloEdit.Text = item.titulo;
                txtDescEdit.Text = item.descripcion;
                txtLugarEdit.Text = item.lugar;
                txtCTAEdit.Text = item.cta;
                txtFechaEdit.Text = item.event_date.Value.ToString("yyyy-MM-dd HH:mm");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
            }
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(Session["tmpid"].ToString());
                var item = (from t in ctx.web_events
                             where t.id == id
                             select t).FirstOrDefault();


                item.url_img = txtUrlEdit.Text;
                item.url_img_banner = txtUrlEdit.Text;
                item.titulo = txtTituloEdit.Text;
                item.descripcion = txtDescEdit.Text;
                item.lugar = txtLugarEdit.Text;
                item.cta = txtCTAEdit.Text;
                item.event_date = DateTime.Parse(Request.Form[txtFechaEdit.UniqueID]);




                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Evento Editado", this);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);
            }
        }

        protected void btnSetDefault_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                ctx.web_events.ToList().ForEach(o => o.event_default = 0);

                var item = (from t in ctx.web_events
                            where t.id == id
                            select t).FirstOrDefault();
                item.event_default = 1;

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Evento por Defecto", this);
            }
        }
    }
}