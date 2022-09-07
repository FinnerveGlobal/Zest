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
    public partial class Home : System.Web.UI.Page
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
                var table = (from t in ctx.web_sections
                             where t.estado != "R"
                             where t.web_menu_id == 1
                             where t.nombre.ToUpper().Contains(search) || t.desc1.ToUpper().Contains(search) || t.desc2.ToUpper().Contains(search) || t.desc3.ToUpper().Contains(search)
                             select t).OrderBy(o => o.id).ToArray();

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

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {

            }
        }

        protected void btnSaveNew_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {


            }
        }

        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                web_sections item = (from t in ctx.web_sections
                                     where t.id == id
                                     select t).FirstOrDefault();
                item.estado = "A";

                ctx.SaveChanges();
                loadData();
                ShowMessage.info("Sección Activa", this);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                web_sections item = (from t in ctx.web_sections
                                     where t.id == id
                                     select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Sección Inactiva", this);
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                web_sections item = (from t in ctx.web_sections
                                     where t.id == id
                                     select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Sección Eliminada", this);
            }
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {

            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
            txtSearch.Focus();
        }
    }
}