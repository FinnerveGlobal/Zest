using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;
using Zest_App.Resources.Layout;

namespace Zest_App.Resources.Views.Backend.Leads
{
    public partial class List : System.Web.UI.Page
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
                ddlEstado.SelectedValue = "A";
            }
            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(this.btnExport);

        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string estado = ddlEstado.SelectedValue;
                string search = txtSearch.Text.ToUpper();
                var table = (from t in ctx.web_leads
                             where t.estado != "R"
                             where t.estado == estado
                             where t.nombre.ToUpper().Contains(search) || t.apellido.ToUpper().Contains(search) || t.email.ToUpper().Contains(search) || t.telefono.ToUpper().Contains(search)
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


        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.web_leads
                            where t.id == id
                            select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Lead Eliminada", this);
            }
        }

        private void ExportGridToExcel()
        {
            using (var ctx = new zestapp_dbEntities())
            {


                dgvTable.AllowPaging = false;
                loadData();
                Response.Clear();
                Response.Buffer = true;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.Charset = "";
                string FileName = "Zes_Web_Leads_" + DateTime.Now + ".xls";
                StringWriter strwritter = new StringWriter();
                HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = "application/vnd.ms-excel";
                Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
                dgvTable.GridLines = GridLines.Both;
                dgvTable.HeaderStyle.Font.Bold = true;
                dgvTable.RenderControl(htmltextwrtter);

                dgvTable.AllowPaging = true;

                var items = (from t in ctx.web_leads
                             where t.estado == "A"
                             select t).ToList();
                items.ForEach(o => o.estado = "D");
                ctx.SaveChanges();
                loadData();

                Response.Write(strwritter.ToString());
                Response.End();


            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }

        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadData();
        }
    }
}