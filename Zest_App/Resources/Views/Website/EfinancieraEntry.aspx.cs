using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Zest_App.Models;
using Zest_App.Resources.Layout;

namespace Zest_App.Resources.Views.Website
{
    public partial class EfinancieraEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                txtComentario.Text = "";
                loadData();
                loadComments();

           
            }
        }

        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string entry_url = RouteData.Values["entry_url"].ToString();

                var item = (from t in ctx.web_entry_blogs
                            where t.entry_url == entry_url
                            select t).FirstOrDefault();

                ltTitle.Text = item.titulo;
                ltDesc.Text = item.descrip;
                ltDate.Text = item.updated_at.Value.ToString("dd MMM yy", System.Globalization.CultureInfo.CreateSpecificCulture("es")) + " <span class='markk' style='display: list-item;margin-left:25px'>" + item.reading_time+" min lectura</span>";
                img_blog_profile.ImageUrl = item.users.url_img;
                ltProfileName.Text = item.users.name;
                ltBlogEntry.Text = item.entrada;
                rpTags.DataSource = item.tags.Split(',').GroupBy(x => x).ToDictionary(g => g.Key, g => g.Count()).OrderByDescending(o => o.Value);
                rpTags.DataBind();
                lbLike.CommandArgument = item.id.ToString();
                lbLike2.CommandArgument = item.id.ToString();
                likesitems.Text = item.views.ToString();
                lblikesitems2.Text = item.views.ToString();

                HtmlMeta meta = new HtmlMeta();
                meta.Attributes.Add("property", "og:image");
                meta.Name = "image";
                meta.Content = item.img_url;

               /* HtmlMeta meta2 = new HtmlMeta();
                meta2.Name = "og:image:secure_url";
                meta2.Content = item.img_url;*/

                MetaPlaceHolder.Controls.Add(meta);
                /*MetaPlaceHolder2.Controls.Add(meta2);*/

                var table = (from t in ctx.web_entry_blogs
                             where t.estado == "A"
                             select t).OrderByDescending(o => o.id).ToArray().OrderBy(a => Guid.NewGuid());

                rpBlogs.DataSource = table.Take(4);
                rpBlogs.DataBind();
                btnSaveComm.CommandArgument = item.id.ToString();
            }
        }

        public void loadComments()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string entry_url = RouteData.Values["entry_url"].ToString();

                var item = (from t in ctx.web_entry_blogs
                            where t.entry_url == entry_url
                            select t).FirstOrDefault();

                dgvComments.DataSource = item.web_entry_comments.Where(o=> o.estado == "A").OrderByDescending(o=> o.id).ToArray();
                dgvComments.DataBind();
            }
        }
        protected void lbGoEntry_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string url = btn.CommandArgument.ToString();

            Response.Redirect(GetRouteUrl("EntryRoute", new { entry_url = url }));
        }

        protected void lbLike_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument.ToString());
            using (var ctx = new zestapp_dbEntities())
            {
                var item = (from t in ctx.web_entry_blogs
                            where t.id == id
                            select t).FirstOrDefault();
                if (item.views == null)
                    item.views = 1;
                else
                    item.views = item.views+1;

                ctx.SaveChanges();
                likesitems.Text = item.views.ToString();
                lblikesitems2.Text = item.views.ToString();

            }

        }

        protected void dgvComments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            loadComments();
            dgvComments.PageIndex = e.NewPageIndex;
            dgvComments.DataBind();
        }

        protected void btnSaveComment_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument.ToString());
            using (var ctx = new zestapp_dbEntities())
            {
                var comm = new web_entry_comments
                {
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    comment = txtComentario.Text,
                    estado = "A",
                    web_entry_blog_id = id,
                    web_user_id = 1234
                };

                txtComentario.Text = "";
                ctx.web_entry_comments.Add(comm);
                ctx.SaveChanges();
                loadComments();
            }
        }
    }
}