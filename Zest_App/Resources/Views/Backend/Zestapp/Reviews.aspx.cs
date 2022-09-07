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
    public partial class Reviews : System.Web.UI.Page
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
                var table = (from t in ctx.reviews
                             where t.estado != "R"
                             where t.titulo.ToUpper().Contains(search) || t.texto.ToUpper().Contains(search) 
                             select new
                             {
                                 t.id,
                                 t.titulo,
                                 t.texto,
                                 t.created_at,
                                 t.estado,
                                 t.url,
                                 t.note_code
                             }).OrderByDescending(o => o.id).ToArray();


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

                review item = (from t in ctx.reviews
                                where t.id == id
                                        select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Analisis eliminado", this);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                Session["tmpid"] = id;

                var item = (from t in ctx.reviews
                             where t.id == id
                             select t).FirstOrDefault();

                txtTituloEdit.Text = item.titulo;
                txtAnalisisEdit.Text = item.texto;
                txtNotaEdit.Text = item.note_code.Remove(item.note_code.Length - 1);
                txtFechaEdit.Text = item.created_at.Value.ToString("yyyy-MM-dd");



                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
            }
        }
        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                review item = (from t in ctx.reviews
                                where t.id == id
                                        select t).FirstOrDefault();
                item.estado = "A";

                ctx.SaveChanges();
                loadData();
                ShowMessage.info("Analisis Publicado", this);
            }
        }
        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                review item = (from t in ctx.reviews
                                where t.id == id
                                        select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Analisis Desactivado", this);
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
                String path = "\\Files\\Backend\\reviews\\";
                Boolean fileOK = false;
                string fileURL = "";

                if (fuUrl.HasFile)
                {
                    String fileExtension =
                        System.IO.Path.GetExtension(fuUrl.FileName).ToLower();
                    String[] allowedExtensions =
                        {".pdf", "jpg", "jpeg", "png"};
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                if (fileOK)
                {
                    try
                    {
                        fuUrl.PostedFile.SaveAs(Server.MapPath("~/Files/Backend/reviews/") + fuUrl.FileName);
                        fileURL = path + fuUrl.FileName;
                    }
                    catch (Exception exe)
                    {
                        ShowMessage.error(exe.ToString(), this);
                    }
                }

                var newItem = new review
                {
                    created_at = DateTime.Parse(txtFecha.Text),
                    estado = "A",
                    note_code = txtNotaZ.Text+",",
                    texto = txtTexto.Text,
                    titulo = txtTitulo.Text,
                    updated_at = DateTime.Now,
                    url = fileURL
                };
                ctx.reviews.Add(newItem);
                ctx.SaveChanges();


                string nn = txtNotaZ.Text+",";

               /* var invs = (from t in ctx.investors
                            select t).ToArray();

                foreach (var item in invs)
                {
                    var not = (from t in ctx.notifications
                               where t.notification1 == nn && t.investor_id == item.id
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
                            notification1 = nn,
                            updated_at = DateTime.Now
                        };
                        ctx.notifications.Add(newnot);
                    }
                    ctx.SaveChanges();
                }
               */


                txtNotaZ.Text = "";
                txtTexto.Text = "";
                txtTitulo.Text = "";
                ShowMessage.info("Analisis Guardado", this);

                //SendNotification.send("Análisis Zest", "Revisa el análisis de la nota "+ txtNotaZ.Text);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_new();", true);
                loadData();
            }
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(Session["tmpid"].ToString());
                var item = (from t in ctx.reviews
                             where t.id == id
                             select t).FirstOrDefault();


                String path = "\\Files\\Backend\\reviews\\";
                Boolean fileOK = false;
                string fileURL = "";

                if (fuUrlEdit.HasFile)
                {
                    String fileExtension =
                        System.IO.Path.GetExtension(fuUrlEdit.FileName).ToLower();
                    String[] allowedExtensions =
                        {".pdf", "jpg", "jpeg", "png"};
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                if (fileOK)
                {
                    try
                    {
                        fuUrlEdit.PostedFile.SaveAs(Server.MapPath("~/Files/Backend/reviews/") + fuUrlEdit.FileName);
                        fileURL = path + fuUrlEdit.FileName;
                        item.url = fileURL;
                    }
                    catch (Exception exe)
                    {
                        ShowMessage.error(exe.ToString(), this);
                    }
                }


                item.updated_at = DateTime.Now;
                item.titulo = txtTituloEdit.Text;
                item.texto = txtAnalisisEdit.Text;
                item.note_code = txtNotaEdit.Text + ",";
                item.created_at = DateTime.Parse(txtFechaEdit.Text);

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Analisis Editado", this);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);
            }
        }
    }
}