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

namespace Zest_App.Resources.Views.Backend.Zestweb.Aboutus
{
    public partial class Publi25k1k : System.Web.UI.Page
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
                var table = (from t in ctx.web_25k1k_publis
                             where t.estado != "R"
                             where t.titulo.ToUpper().Contains(search) || t.descripcion.ToUpper().Contains(search)
                             select t).OrderByDescending(o => o.id).ToArray();

                dgvTable.DataSource = table;
                dgvTable.DataBind();

                var text = (from t in ctx.web_25k1k select t).FirstOrDefault();
                if(text != null) { 
                txtGenTitle.Text = text.title;
                txtGenDesc.Text = text.description.Replace("<br/>", "\n").Replace("</b>", "**").Replace("<b>", "*"); ;
                }
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

                var item = (from t in ctx.web_25k1k_publis
                            where t.id == id
                            select t).FirstOrDefault();

                var activos = (from t in ctx.web_25k1k_publis
                               where t.estado == "A"
                               select t).ToArray();

                if(activos.Count()  >= 3)
                {

                    ShowMessage.warning("Puede tener un máximo de 3 activos, debe desactivar uno antes de continuar", this);
                }
                else
                {
                    item.estado = "A";

                    ctx.SaveChanges();
                    loadData();
                    ShowMessage.info("Activo", this);
                }
                    
              
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_25k1k_publis
                            where t.id == id
                            select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Desactivado", this);
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_25k1k_publis
                            where t.id == id
                            select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Eliminado", this);
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
                web_25k1k_publis new_item = new web_25k1k_publis
                {
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    estado = "P",
                    descripcion = txtDesc.Text,
                    titulo = txtTitulo.Text,
                    cta = txtCta.Text,
                    rrss = ddlRRSS.SelectedValue,
                    prioridad = int.Parse(ddlPrioridad.SelectedValue)
                };

                ctx.web_25k1k_publis.Add(new_item);
                ctx.SaveChanges();
                loadData();


                txtTitulo.Text = "";
                txtDesc.Text = "";
                txtCta.Text = "";

                ShowMessage.info("Guardado", this);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_new();", true);

            }
        }


        protected void btnEditar_Click(object sender, EventArgs e) {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                ViewState["tmpid"] = id;

                web_25k1k_publis item = (from t in ctx.web_25k1k_publis
                                         where t.id == id
                                    select t).FirstOrDefault();

                ddlRRSS.SelectedValue = item.rrss;
                txtTituloEdit.Text = item.titulo;
                txtDescEdit.Text = item.descripcion;
                txtCtaEdit.Text = item.cta;
                ddlPrioridadEdit.SelectedValue = item.prioridad.ToString(); ;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
            }
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(ViewState["tmpid"].ToString());
                web_25k1k_publis item = (from t in ctx.web_25k1k_publis
                                         where t.id == id
                                    select t).FirstOrDefault();

                item.rrss = ddlRRSS.SelectedValue;
                item.titulo = txtTituloEdit.Text;
                item.descripcion = txtDescEdit.Text;
                item.cta = txtCtaEdit.Text;
                item.updated_at = DateTime.Now;
                item.prioridad = int.Parse(ddlPrioridadEdit.SelectedValue);

                ctx.SaveChanges();
                loadData();

                txtTituloEdit.Text = "";
                txtDescEdit.Text = "";
                txtCtaEdit.Text = "";

                ShowMessage.success("Editado", this);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);
            }
        }

        protected void btnSaveGen_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var text = (from t in ctx.web_25k1k select t).FirstOrDefault();
                if(text == null) {
                    text = new web_25k1k();
                    text.title = txtGenTitle.Text;
                    text.description = txtGenDesc.Text.Replace("\n","<br/>").Replace("**","</b>").Replace("*","<b>");
                    text.updated_at = DateTime.Now;
                    ctx.web_25k1k.Add(text);
                }
                else
                {
                    text.title = txtGenTitle.Text;
                    text.description = txtGenDesc.Text.Replace("\n", "<br/>").Replace("**", "</b>").Replace("*", "<b>");
                    text.updated_at = DateTime.Now;
                }
                ctx.SaveChanges();
                ShowMessage.success("Editado", this);
            }
        }
    }
}