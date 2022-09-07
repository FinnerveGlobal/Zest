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

namespace Zest_App.Resources.Views.Backend.Profile
{
    public partial class Profile : System.Web.UI.Page
    {
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
            users us = (users)Session["user"];
            ltProfileName.Text = us.name;
            ltProfileRol.Text = us.rol;
            imgProfile.ImageUrl = us.url_img;
            ltProfileEmail.Text = us.email;
            txtProfileName.Text = us.name;
            txtProfileRol.Text = us.rol;
            txtProfileEmail.Text = us.email;

            ltProfileCreated.Text = us.created_at.Value.ToShortDateString();
        }

        [WebMethod]
        public static string heartbeat()
        {
            var heartbeat = DateTime.Now;
            HttpContext.Current.Session["Heartbeat"] = heartbeat;
            return heartbeat.ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            String path = "~\\Files\\Backend\\User\\";
            Boolean imgOK = false;
          
            if (fuImagen.HasFile)
            {
                String fileExtension =
                    System.IO.Path.GetExtension(fuImagen.FileName).ToLower();
                String[] allowedExtensions =
                    {".jpg", ".jpeg", ".png"};
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        imgOK = true;
                    }
                }
            }

            string imgURL = "";
            if (imgOK)
            {
                try
                {
                    fuImagen.PostedFile.SaveAs(Server.MapPath("~/Files/Backend/User/") + fuImagen.FileName);
                    imgURL = path + fuImagen.FileName;
                }
                catch (Exception exe)
                {
                    ShowMessage.error(exe.ToString(), this);
                }
            }

          


            using (var ctx = new zestapp_dbEntities())
            {
                users us = (users)Session["user"];
                users uss = (from t in ctx.users
                            where t.id == us.id
                            select t).FirstOrDefault();
                uss.name = txtProfileName.Text;
                if(imgOK)
                    uss.url_img = imgURL;
                ctx.SaveChanges();
                loadData();
                Session["user"] = uss;
                ShowMessage.success("Nombre actualizado", this);
                
            }
        }

        protected void btnSavePass_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                users us = (users)Session["user"];
                string oldpass = Authentication.GeneratePasswordHash(txtOldpass.Text);
                string newpass = Authentication.GeneratePasswordHash(txtNewpass.Text);

                if (us.password == oldpass)
                {

                    users uss = (from t in ctx.users
                                where t.id == us.id
                                select t).FirstOrDefault();
                    uss.password = newpass;
                    loadData();
                    ctx.SaveChanges();
                    Session["user"] = uss;
                    ShowMessage.success("Contraseña actualizada", this);
                }
                else
                {

                    ShowMessage.warning("Contraseña anterior incorrecta", this);
                }

            }
        }
    }
}