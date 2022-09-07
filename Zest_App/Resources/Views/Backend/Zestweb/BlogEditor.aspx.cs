using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;
using Zest_App.Resources.Layout;

namespace Zest_App.Resources.Views.Backend.Zestweb
{
    public partial class BlogEditor : System.Web.UI.Page
    {
        [WebMethod]
        public static string heartbeat()
        {
            var heartbeat = DateTime.Now;
            HttpContext.Current.Session["Heartbeat"] = heartbeat;
            return heartbeat.ToString();
        }

        [WebMethod]
        public static string saveBlog(string html, string tags, string keywords, string titulo,string desc,string url)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                users us = (users)HttpContext.Current.Session["user"];
                web_entry_blogs entradatmp = (web_entry_blogs)HttpContext.Current.Session["entradaTmp"];
                web_entry_blogs entrada = (from t in ctx.web_entry_blogs
                                           where t.id == entradatmp.id
                                           select t).FirstOrDefault();

                entrada.updated_at = DateTime.Now;
                entrada.estado = "A";
                entrada.keywords = keywords;
                entrada.tags = tags;
                entrada.titulo = titulo;
                entrada.entrada = html;
                entrada.descrip = desc;
                entrada.img_url = url;



                ctx.SaveChanges();
            }

            HttpContext.Current.Session["mensaje"] = "Blog Guardado Correctamente";
            return "saved";
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

                loadData();
            }
        }
        
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                web_entry_blogs entrada = (web_entry_blogs)Session["entradaTmp"];
                txtKeywords.Text = entrada.keywords;
                ltBlog.Text = entrada.entrada;
                txtTags.Text = entrada.tags;
                txtTitulo.Text = entrada.titulo;
                txtDescripcion.Text = entrada.descrip;
                txtUrl.Text = entrada.img_url;
            }
        }
      
      
    }
}