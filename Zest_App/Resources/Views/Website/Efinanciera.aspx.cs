using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Website
{
    public partial class Efinanciera : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Educación Financiera | Zest";
            if (!this.IsPostBack)
            {
                loadData();
            }
        }

        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {

                var table = (from t in ctx.web_entry_blogs
                             where t.estado == "A"
                             select t).OrderByDescending(o => o.id).ToArray();

                dgvTable.DataSource = table;
                dgvTable.DataBind();

                ltFirstTitle.Text = table.FirstOrDefault().titulo;
                ltFirstText.Text = table.FirstOrDefault().descrip;
                img_firstEntry.ImageUrl = table.FirstOrDefault().img_url;
                lbFirstEntry.CommandArgument = table.FirstOrDefault().entry_url.ToString();



                var tags = string.Join(",", table.Select(o => o.tags).ToList()).Split(',').GroupBy(x=>x).ToDictionary(g => g.Key, g => g.Count()).OrderByDescending(o => o.Value).Take(20);
                /*dgvTags.DataSource = tags;
                dgvTags.DataBind();*/
                rpTags.DataSource = tags;
                rpTags.DataBind();


                var events = (from t in ctx.web_events
                              where t.estado == "A"
                              select t).OrderByDescending(o => o.id).Take(3).ToArray();

                dgvEvents.DataSource = events;
                dgvEvents.DataBind();

              

            }
        }
        protected void dgvTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            loadData();
            dgvTable.PageIndex = e.NewPageIndex;
            dgvTable.DataBind();
        }

        protected void lbGoEntry_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string url = btn.CommandArgument.ToString();

            Response.Redirect(GetRouteUrl("EntryRoute", new { entry_url = url }));
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            string search = txtSearch.Text.ToLower();
            using (var ctx = new zestapp_dbEntities())
            {
                var table = (from t in ctx.web_entry_blogs
                             where t.estado == "A"
                             where t.descrip.ToLower().Contains(search) || t.titulo.ToLower().Contains(search)
                             select t).OrderByDescending(o => o.id).ToArray();

                dgvTable.DataSource = table;
                dgvTable.DataBind();
            }
        }

        protected void lbSearchTag_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string tag = btn.CommandArgument.ToString().ToLower();

            using (var ctx = new zestapp_dbEntities())
            {
                var table = (from t in ctx.web_entry_blogs
                             where t.estado == "A"
                             where t.tags.ToLower().Contains(tag) 
                             select t).OrderByDescending(o => o.id).ToArray();

                dgvTable.DataSource = table;
                dgvTable.DataBind();
            }
        }

        protected void lbEvent_Click(object sender, EventArgs e)
        {

        }
    }
}