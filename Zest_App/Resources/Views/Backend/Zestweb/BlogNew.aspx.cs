using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;
using Zest_App.Resources.Layout;

namespace Zest_App.Resources.Views.Backend.Zestweb
{
    public partial class BlogNew : System.Web.UI.Page
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


                txtKeywords.Text = "";
                //ltBlog.Text = "<h2>Escribe tu blog aqui</h2> <p>Ejemplo de Texto</p> ";
            }
        }

        [WebMethod]
        public static string saveBlog(string html, string tags, string keywords, string titulo,string miniatura,string descrip)
        {

            string entry_url = Regex.Replace(titulo, @"[^0-9a-zA-Z]+", "xxyyzz").Replace("xxyyzz", "-").ToLower();
            if (entry_url.EndsWith("-"))
            {
                entry_url = entry_url.Remove(entry_url.Length - 1);
            }


            using (var ctx = new zestapp_dbEntities())
            {
                users us = (users)HttpContext.Current.Session["user"];

                int url_count = (from t in ctx.web_entry_blogs
                                 where t.entry_url.Contains(entry_url)
                                 select t).Count();
                if(url_count > 0)
                {
                    entry_url += "-" + (url_count+1);
                }

                web_entry_blogs entrada = new web_entry_blogs
                {
                    created_at = DateTime.Now,
                    entrada = html,
                    estado = "A",
                    facebook = 1,
                    instagram = 1,
                    keywords = keywords,
                    linkedin = 1,
                    tags = tags,
                    titulo = titulo,
                    updated_at = DateTime.Now,
                    user_id = us.id,
                    img_url = miniatura,
                    descrip = descrip,
                    entry_url = entry_url

                };
                ctx.web_entry_blogs.Add(entrada);
                ctx.SaveChanges();
            }

            SendNotification.send("Blog Zest", "Hemos compartido un nuevo blog para ti");
            HttpContext.Current.Session["mensaje"] = "Blog Guardado Correctamente";
            return "Blog.aspx";
        }

        protected void btnSaveBlog_Click(object sender, EventArgs e)
        {
            //ltBlog.Text = blog_entry.InnerHtml;
        }
    }
}