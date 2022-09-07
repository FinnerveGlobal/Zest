using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Layout
{
    public partial class backend : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ViewState["idFoldertmp"] = 0;
                loadDataImages();
            }
        }


        public void load()
        {
            users us = (users)Session["user"];
            if(us != null) { 
                ltUserName.Text = us.name;
                ltUserRol.Text = us.rol;
                ltUserWelcome.Text = "Bienvenido " + us.name;
                ltUserMin.Text = us.name.Substring(0, 2);
                profile_img.ImageUrl = us.url_img;
            }
            else
            {
                Response.Redirect("~/Resources/Views/Backend/Login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/Resources/Views/Backend/Login.aspx");

        }

        public void refreshAutopostback()
        {
            
            //Initialize link button for ajax
            foreach (RepeaterItem loItem in rpFolders.Items)
            {
                if (loItem.ItemType == ListItemType.Item || loItem.ItemType == ListItemType.AlternatingItem)
                {
                    LinkButton lbFavourites = (LinkButton)loItem.FindControl("btnFolder");
                    LinkButton lbFavourites2 = (LinkButton)loItem.FindControl("btnTrashFolder");

                    ScriptManager ScriptManager1 = (ScriptManager)FindControlRecursive(this, "ScriptManager1");
                    ScriptManager1.RegisterAsyncPostBackControl(lbFavourites);
                    ScriptManager1.RegisterAsyncPostBackControl(lbFavourites2);
                }
            }
            foreach (RepeaterItem loItem in rpImages.Items)
            {
                if (loItem.ItemType == ListItemType.Item || loItem.ItemType == ListItemType.AlternatingItem)
                {
                    LinkButton lbFavourites = (LinkButton)loItem.FindControl("btnImage");
                    LinkButton lbFavourites2 = (LinkButton)loItem.FindControl("btnTrashImage");

                    ScriptManager ScriptManager1 = (ScriptManager)FindControlRecursive(this, "ScriptManager1");
                    ScriptManager1.RegisterAsyncPostBackControl(lbFavourites);
                    ScriptManager1.RegisterAsyncPostBackControl(lbFavourites2);
                }
            }
        }

        public void loadDataImages()
        {
            using (var ctx = new zestapp_dbEntities())
            {

                string search = txtSearch.Text.ToUpper();
                int id = int.Parse(ViewState["idFoldertmp"].ToString());
                var folder = (from t in ctx.web_folders
                              where t.id == id
                              select t).FirstOrDefault();
                btnPrev.CommandArgument = folder == null ? "0" : (folder.web_folder_id.ToString() == "" ? "0" : folder.web_folder_id.ToString());

                if (folder == null)
                {
                    txtFolderName.Text = "Folder Raiz";
                    txtFolderName.Enabled = false;

                }
                else
                {
                    txtFolderName.Text = folder.title;
                    txtFolderName.Enabled = true;
                }
                if (string.IsNullOrEmpty(search))
                {
                



                    var table = (from t in ctx.web_folders
                                 where t.web_folder_id == null
                                 where t.estado == "A"
                                 select t).ToArray();

                    var images = (from t in ctx.web_images
                                  where t.web_folder_id == null
                                  where t.estado == "A"
                                  select t).ToArray();

                    if (id != 0)
                    {
                        table = (from t in ctx.web_folders
                                 where t.web_folder_id == id
                                 where t.estado == "A"
                                 select t).ToArray();

                        images = (from t in ctx.web_images
                                  where t.web_folder_id == id
                                  where t.estado == "A"
                                  select t).ToArray();
                    }


                    rpFolders.DataSource = table;
                    rpFolders.DataBind();
                    rpImages.DataSource = images;
                    rpImages.DataBind();

                    refreshAutopostback();

                }
                else
                {
                    var table = (from t in ctx.web_folders
                             where t.estado == "A"
                             where t.title.ToUpper().Contains(search)
                             select t).ToArray();

                    var images = (from t in ctx.web_images
                              where t.estado == "A"
                              where t.alt_text.ToUpper().Contains(search)
                              select t).ToArray();


                    rpFolders.DataSource = table;
                    rpFolders.DataBind();
                    rpImages.DataSource = images;
                    rpImages.DataBind();

                    refreshAutopostback();
                }


            }
        }

        public static Control FindControlRecursive(Control controlToStartFrom, string ctrlIdToFind)
        {
            Control found = controlToStartFrom.FindControl(ctrlIdToFind);

            if (found != null)
                return found;

            foreach (Control innerCtrl in controlToStartFrom.Controls)
            {
                found = FindControlRecursive(innerCtrl, ctrlIdToFind);

                if (found != null)
                    return found;
            }
            return null;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadDataImages();
            txtSearch.Focus();
        }

        protected void btnGoFolder_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);
            ViewState["idFoldertmp"] = id;
            loadDataImages();
        }

        protected void FileUploadComplete(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                String path = "/Files/Backend/imgs/";
                int id = int.Parse(ViewState["idFoldertmp"].ToString());
                string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);

                var newImage = new web_images
                {
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    estado = "A",
                    alt_text = txtAltText.Text
                };

                ctx.web_images.Add(newImage);
                ctx.SaveChanges();


                AsyncFileUpload1.SaveAs(Server.MapPath(path) + newImage.id + System.IO.Path.GetExtension(filename));
                string imgURL = path + newImage.id + System.IO.Path.GetExtension(filename);


                if (id != 0)
                    newImage.web_folder_id = id;

                if (!string.IsNullOrEmpty(imgURL))
                    newImage.url_img = imgURL;

                ctx.SaveChanges();
                txtAltText.Text = "";
                ShowMessage.success("Imagen Subida", this.Page);
                loadDataImages();


            }
        }

        protected void btnsaveFolder_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(ViewState["idFoldertmp"].ToString());
                var newFolder = new web_folders
                {
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    color = txtFolderColor.Text,
                    estado = "A",
                    title = txtFolderTitulo.Text
                };
                if (id != 0)
                    newFolder.web_folder_id = id;
                ctx.web_folders.Add(newFolder);
                ctx.SaveChanges();
                txtFolderTitulo.Text = "";
                ShowMessage.success("Folder Creado", this.Page);
                loadDataImages();

            }
        }



        protected void btnTrashImage_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);

            using (var ctx = new zestapp_dbEntities())
            {
                var img = (from t in ctx.web_images
                           where t.id == id
                           select t).FirstOrDefault();
                img.estado = "R";
                ShowMessage.success("Imagen Eliminada", this.Page);

                ctx.SaveChanges();
                loadDataImages();
            }
        }

        protected void btnTrashFolder_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);

            using (var ctx = new zestapp_dbEntities())
            {
                var folder = (from t in ctx.web_folders
                              where t.id == id
                              select t).FirstOrDefault();
                folder.estado = "R";

                ShowMessage.success("Folder Eliminado", this.Page);
                ctx.SaveChanges();
                loadDataImages();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            loadDataImages();
        }

        protected void btnImage_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            ShowMessage.info("Texto Copiado: "+ btn.CommandArgument, this.Page);

            Val = btn.CommandArgument;
            txtCopyLink.Text = Val;
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "CopyToClipboard();", true);

            /*Thread staThread = new Thread(new ThreadStart(copyClip));
            staThread.ApartmentState = ApartmentState.STA;
            staThread.Start();*/

            loadDataImages();
        }

        private static string _Val;
        public static string Val
        {
            get { return _Val; }
            set { _Val = value; }
        }
        public static void copyClip()
        {
            System.Windows.Forms.Clipboard.SetText(Val);
        }

        protected void txtFolderName_TextChanged(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(ViewState["idFolder"].ToString());
                var folder = (from t in ctx.web_folders
                              where t.id == id
                              select t).FirstOrDefault();
                folder.title = txtFolderName.Text;
                folder.updated_at = DateTime.Now;
                ctx.SaveChanges();
                ShowMessage.success("Nombre Editado", this.Page);

                refreshAutopostback();
            }
        }

        protected void btnImages_Click(object sender, EventArgs e)
        {
            loadDataImages();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "open_images();", true);
        }
    }
}