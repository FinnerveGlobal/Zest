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

namespace Zest_App.Resources.Views.Backend.Images
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
                ViewState["idFolder"] = 0;
                loadData();
            }
            refreshAutopostback();
        }

        public void refreshAutopostback()
        {
            //Initialize link button for ajax
            foreach (RepeaterItem loItem in rpFolders.Items)
            {
                if (loItem.ItemType == ListItemType.Item || loItem.ItemType == ListItemType.AlternatingItem)
                {
                    LinkButton lbFavourites = (LinkButton)loItem.FindControl("btnFolder");
                    LinkButton lbTrash = (LinkButton)loItem.FindControl("btnTrashFolder");

                    ScriptManager ScriptManager1 = (ScriptManager)FindControlRecursive(this.Page, "ScriptManager1");
                    ScriptManager1.RegisterAsyncPostBackControl(lbFavourites);
                    ScriptManager1.RegisterAsyncPostBackControl(lbTrash);
                }
            }

            //Initialize link button for ajax
            foreach (RepeaterItem loItem in rpImages.Items)
            {
                if (loItem.ItemType == ListItemType.Item || loItem.ItemType == ListItemType.AlternatingItem)
                {
                    LinkButton lbFavourites = (LinkButton)loItem.FindControl("btnTrashImage");

                    ScriptManager ScriptManager1 = (ScriptManager)FindControlRecursive(this.Page, "ScriptManager1");
                    ScriptManager1.RegisterAsyncPostBackControl(lbFavourites);
                }
            }
        }

        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(ViewState["idFolder"].ToString());
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



                string search = txtSearch.Text.ToUpper();

                var table = (from t in ctx.web_folders
                             where t.web_folder_id == null
                             where t.estado == "A"
                             where t.title.ToUpper().Contains(search)
                             select t).ToArray();

                var images = (from t in ctx.web_images
                              where t.web_folder_id == null
                              where t.estado == "A"
                              where t.alt_text.ToUpper().Contains(search)
                              select t).ToArray();

                if (id != 0)
                {
                    table = (from t in ctx.web_folders
                             where t.web_folder_id == id
                             where t.estado == "A"
                             where t.title.ToUpper().Contains(search)
                             select t).ToArray();

                    images = (from t in ctx.web_images
                              where t.web_folder_id == id
                              where t.estado == "A"
                              where t.alt_text.ToUpper().Contains(search)
                              select t).ToArray();
                }


                rpFolders.DataSource = table;
                rpFolders.DataBind();
                rpImages.DataSource = images;
                rpImages.DataBind();



              
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

        }

        protected void btnGoFolder_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);
            ViewState["idFolder"] = id;
            loadData();
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
                ShowMessage.success("Nombre Editado", this);
            }
        }

        protected void btnsaveFolder_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(ViewState["idFolder"].ToString());
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
                ShowMessage.success("folder guardado", this);
                txtFolderTitulo.Text = "";
                loadData();

            }
        }


        protected void FileUploadComplete(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                String path = "/Files/Backend/imgs/";
                int id = int.Parse(ViewState["idFolder"].ToString());
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
                ShowMessage.success("Imagen guardada", this);
                txtAltText.Text = "";
                loadData();


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

                ctx.SaveChanges();
                ShowMessage.success("Imagen eliminada", this);
                loadData();
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

                ctx.SaveChanges();
                ShowMessage.success("Folder eliminado", this);
                loadData();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            loadData();
        }
    }
}