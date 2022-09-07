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
    public partial class Faqs : System.Web.UI.Page
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
                var table = (from t in ctx.web_faq
                             where t.estado != "R"
                             where t.question.ToUpper().Contains(search) || t.answer.ToUpper().Contains(search) 
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

                var item = (from t in ctx.web_faq
                             where t.id == id
                             select t).FirstOrDefault();
                item.estado = "A";

                ctx.SaveChanges();
                loadData();
                ShowMessage.info("Pregunta Publicada", this);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_faq
                             where t.id == id
                             select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Pregunta Desactivada", this);
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_faq
                             where t.id == id
                             select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Pregunta Eliminada", this);
            }
        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities()) {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                ViewState["tmpid"] = id;

                var faq = (from t in ctx.web_faq
                           where t.id == id
                           select t).FirstOrDefault();

                txtPreguntaEdit.Text = faq.question;
                txtRespuestaEdit.Text = faq.answer;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
            }
        }

        protected void btnSaveNew_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var newFaq = new web_faq
                {
                    estado = "A",
                    answer = txtRespuesta.Text,
                    question = txtPregunta.Text,
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now
                };
                ctx.web_faq.Add(newFaq);
                ctx.SaveChanges();
                loadData();

                txtPregunta.Text = "";
                txtRespuesta.Text = "";

                ShowMessage.success("Pregunta frecuente creada", this);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_new();", true);
            }
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(ViewState["tmpid"].ToString());

                var faq = (from t in ctx.web_faq
                           where t.id == id
                           select t).FirstOrDefault();

                faq.question = txtPreguntaEdit.Text;
                faq.answer = txtRespuestaEdit.Text;
                faq.updated_at = DateTime.Now;
                ctx.SaveChanges();

                loadData();

                txtPreguntaEdit.Text = "";
                txtRespuestaEdit.Text = "";


                ShowMessage.success("Pregunta frecuente editada", this);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);
            }
        }
    }
}