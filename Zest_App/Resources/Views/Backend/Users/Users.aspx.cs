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

namespace Zest_App.Resources.Views.Backend.Users
{
    public partial class Users : System.Web.UI.Page
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
                var table = (from t in ctx.users
                             where t.estado != "R"
                             where t.name.ToUpper().Contains(search) || t.email.ToUpper().Contains(search)
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

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
            txtSearch.Focus();
        }

        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.users
                            where t.id == id
                            select t).FirstOrDefault();
                item.estado = "A";

                ctx.SaveChanges();
                loadData();
                ShowMessage.info("Publicado", this);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.users
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

                var item = (from t in ctx.users
                            where t.id == id
                            select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Eliminado", this);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                ViewState["tmpid"] = id;

                var item = (from t in ctx.users
                            where t.id == id
                            select t).FirstOrDefault();

                txtUrlEdit.Text = item.url_img;
                txtNombreEdit.Text = item.name;
                ddlRolEdit.SelectedValue = item.rol;
                txtEmailEdit.Text = item.email;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
            }
        }
        protected void btnSaveNew_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string newpass = Authentication.GeneratePasswordHash(txtPass.Text);
                var newItem = new users
                {
                    estado = "A",
                    name = txtNombre.Text,
                    email = txtEmail.Text,
                    rol = ddlRol.SelectedValue,
                    url_img = txtUrl.Text,
                    password = newpass,
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now
                };
                ctx.users.Add(newItem);
                ctx.SaveChanges();
                loadData();

                txtNombre.Text = "";
                txtEmail.Text = "";
                txtPass.Text = "";
                txtUrl.Text = "";

                ShowMessage.success("Creado", this);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_new();", true);
            }
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(ViewState["tmpid"].ToString());

                var item = (from t in ctx.users
                            where t.id == id
                            select t).FirstOrDefault();

                item.url_img = txtUrlEdit.Text;
                item.name = txtNombreEdit.Text;
                item.rol = ddlRolEdit.SelectedValue;
                item.email = txtEmailEdit.Text;
                item.updated_at = DateTime.Now;
                ctx.SaveChanges();

                loadData();

                txtNombreEdit.Text = "";
                txtEmailEdit.Text = "";
                txtUrlEdit.Text = "";


                ShowMessage.success("Editado", this);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);
            }
        }

    }
}