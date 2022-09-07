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

namespace Zest_App.Resources.Views.Backend.Zestweb
{
    public partial class Banner : System.Web.UI.Page
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
                var table = (from t in ctx.web_banners
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

                var item = (from t in ctx.web_banners
                            where t.id == id
                            select t).FirstOrDefault();

                var activos = (from t in ctx.web_banners
                               where t.estado == "A"
                               select t).ToArray();

                foreach (var act in activos)
                {
                    act.estado = "P";
                }

                item.estado = "A";

                ctx.SaveChanges();
                loadData();
                ShowMessage.info("Banner Activo", this);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_banners
                            where t.id == id
                            select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Banner Desactivado", this);
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_banners
                            where t.id == id
                            select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Banner Eliminado", this);
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
                web_banners new_item = new web_banners
                {
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    estado = "P",
                    descripcion = txtDesc.Text,
                    titulo = txtTitulo.Text,
                    cta = txtCta.Text,
                    url_img = txtUrl.Text
                };

                ctx.web_banners.Add(new_item);
                ctx.SaveChanges();
                loadData();


                txtUrl.Text = "";
                txtTitulo.Text = "";
                txtDesc.Text = "";
                txtCta.Text = "";

                ShowMessage.info("Banner Guardado", this);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_new();", true);

            }
        }


        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                ViewState["tmpid"] = id;

                web_banners item = (from t in ctx.web_banners
                                    where t.id == id
                                    select t).FirstOrDefault();

                txtUrlEdit.Text = item.url_img;
                txtTituloEdit.Text = item.titulo;
                txtDescEdit.Text = item.descripcion;
                txtCtaEdit.Text = item.cta;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
            }
        }
        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(ViewState["tmpid"].ToString());
                web_banners item = (from t in ctx.web_banners
                            where t.id == id
                            select t).FirstOrDefault();

                item.url_img = txtUrlEdit.Text;
                item.titulo = txtTituloEdit.Text;
                item.descripcion = txtDescEdit.Text;
                item.cta = txtCtaEdit.Text;
                item.updated_at = DateTime.Now;

                ctx.SaveChanges();
                loadData();

                txtUrlEdit.Text = "";
                txtTituloEdit.Text = "";
                txtDescEdit.Text = "";
                txtCtaEdit.Text = "";

                ShowMessage.success("Banner Editado", this);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);
            }
        }

    }
}