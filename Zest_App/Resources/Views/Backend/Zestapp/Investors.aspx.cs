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
    public partial class Investors : System.Web.UI.Page
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
                var table = (from t in ctx.investors
                             where t.estado != "R"
                             where t.investor_code.ToUpper().Contains(search) || t.nombre.ToUpper().Contains(search) || t.email.ToUpper().Contains(search)
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

                investors item = (from t in ctx.investors
                                      where t.id == id
                                      select t).FirstOrDefault();
                item.estado = "I";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Usuario Inversor Eliminado", this);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            
        }

       
        string GetSortDirection(SortDirection sSortDirCmd)
        {
            string sSortDir;
            if ((SortDirection.Ascending == sSortDirCmd))
            {
                sSortDir = "asc";
            }
            else
            {
                sSortDir = "desc";
            }
            return sSortDir;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
            txtSearch.Focus();
        }

        protected void btnShowPin_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            ShowMessage.info("PIN de Seguridad: " + btn.CommandArgument,this);
        }
    }
}