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

namespace Zest_App.Resources.Views.Backend.Zestapp
    {
    public partial class News : System.Web.UI.Page
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
                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }

        }

        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string search = txtSearch.Text.ToUpper();
                var table = (from t in ctx.news
                             where t.estado != "R"
                             where t.tipo == "ZEST"
                             where t.titular.ToUpper().Contains(search) || t.tipo.ToUpper().Contains(search) || t.descripcion.ToUpper().Contains(search) || t.tags.ToUpper().Contains(search)
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

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                Session["tmpid"] = id;

                news item = (from t in ctx.news
                             where t.id == id
                             select t).FirstOrDefault();

                img_edit.ImageUrl = item.url_img;
                txtNotaEdit.Text = item.nota_codigo;
                txtTitularEdit.Text = item.titular;
                txtNoticiaEdit.Text = item.descripcion;
                txtTagEdit.Text = item.tags;
                ddlTipoEdit.SelectedValue = item.tipo;
                ddlPublicarEdit.SelectedValue = item.web_mobile;
                txtMiniaturaedit.Text = item.url_img;
                txtCTAEdit.Text = item.cta;
                txtFechaEdit.Text = item.created_at.Value.ToString("yyyy-MM-dd");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
            }
        }

        protected void btnSaveNew_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {

                string url_img = Request.Form[txtMiniatura.UniqueID];

                if (string.IsNullOrEmpty(url_img))
                {
                    if (!string.IsNullOrEmpty(txtNota.Text))
                    {
                        var asset_logo = (from t in ctx.assets_logos
                                          where t.asset_code == txtNota.Text
                                          select t).FirstOrDefault();
                        if(asset_logo != null) { 
                            url_img = asset_logo.img_url;
                        }
                    }
                }

                news new_item = new news { 
                    created_at = DateTime.Now,
                    updated_at = DateTime.Parse(txtFecha.Text),
                    estado = "P",
                    descripcion = txtNoticia.Text,
                    nota_codigo = txtNota.Text,
                    tags = txtTags.Text,
                    tipo = ddlTipo.SelectedValue,
                    titular = txtTitular.Text,
                    url_img = url_img ,
                    web_mobile = ddlPublicar.SelectedValue,
                    cta = txtCTA.Text
                };

                ctx.news.Add(new_item);
                ctx.SaveChanges();
                ShowMessage.info("Noticia Guardada", this);

               /* var invs = (from t in ctx.investors
                            select t).ToArray();


                foreach (var item in invs)
                {
                    var not = (from t in ctx.notifications
                               where t.notification1 == "news" && t.investor_id == item.id
                               select t).FirstOrDefault();

                    if (not != null)
                    {
                        not.estado = "A";
                    }
                    else
                    {
                        var newnot = new notification
                        {
                            created_at = DateTime.Now,
                            estado = "A",
                            investor_id = item.id,
                            notification1 = "news",
                            updated_at = DateTime.Now
                        };
                        ctx.notifications.Add(newnot);
                    }
                    ctx.SaveChanges();
                }*/

                loadData();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_new();", true);

            }
        }

        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                news item = (from t in ctx.news
                             where t.id == id
                             select t).FirstOrDefault();
                item.estado = "A";

                SendNotification.send("Noticias Zest", "Revisa los eventos macroeconómicos más importantes del día");

                ctx.SaveChanges();
                loadData();
                ShowMessage.info("Noticia Publicada", this);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                news item = (from t in ctx.news
                             where t.id == id
                             select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Noticia Desactivada", this);
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                news item = (from t in ctx.news
                             where t.id == id
                             select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Noticia Eliminada", this);
            }
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(Session["tmpid"].ToString());
                news item = (from t in ctx.news
                             where t.id == id
                             select t).FirstOrDefault();


                string url_img = txtMiniaturaedit.Text;

                if (string.IsNullOrEmpty(url_img))
                {
                    if (!string.IsNullOrEmpty(txtNotaEdit.Text))
                    {
                        var asset_logo = (from t in ctx.assets_logos
                                          where t.asset_code == txtNotaEdit.Text
                                          select t).FirstOrDefault();
                        if (asset_logo != null)
                        {
                            url_img = asset_logo.img_url;
                        }
                    }
                }


                item.titular = txtTitularEdit.Text;
                item.descripcion = txtNoticiaEdit.Text;
                item.updated_at = DateTime.Parse(txtFechaEdit.Text);
                item.tags = txtTagEdit.Text;
                item.tipo = ddlTipoEdit.SelectedValue;
                item.nota_codigo = txtNotaEdit.Text;
                item.web_mobile = ddlPublicarEdit.SelectedValue;
                item.url_img = url_img;
                item.cta = txtCTAEdit.Text;





                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Noticia Editada", this);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
            txtSearch.Focus();
        }
    }
}