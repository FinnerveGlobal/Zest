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
    public partial class Blog : System.Web.UI.Page
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

                if (Session["mensaje"] != null)
                {
                    ShowMessage.success(Session["mensaje"].ToString(), this);
                    Session["mensaje"] = null;
                }
                loadData();
            }

        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string search = txtSearch.Text.ToUpper();
                var table = (from t in ctx.web_entry_blogs
                             where t.estado != "R"
                             where t.titulo.ToUpper().Contains(search) || t.tags.ToUpper().Contains(search) || t.keywords.ToUpper().Contains(search)
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

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                web_entry_blogs item = (from t in ctx.web_entry_blogs
                                 where t.id == id
                                 select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Entrada de educación financiera eliminada", this);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                web_entry_blogs entrada = (from t in ctx.web_entry_blogs
                                           where t.id == id
                                           select t).FirstOrDefault();

                Session["entradaTmp"] = entrada;

                Response.Redirect("~/Resources/Views/Backend/Zestweb/BlogEditor.aspx");
            }
        }
        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                web_entry_blogs item = (from t in ctx.web_entry_blogs
                                        where t.id == id
                                      select t).FirstOrDefault();
                item.estado = "A";

                ctx.SaveChanges();
                loadData();
                ShowMessage.info("Servicio Publicado", this);
            }
        }
        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                web_entry_blogs item = (from t in ctx.web_entry_blogs
                                        where t.id == id
                                      select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Entrada de educación financiera Desactivado", this);
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
            txtSearch.Focus();
        }
    }
}