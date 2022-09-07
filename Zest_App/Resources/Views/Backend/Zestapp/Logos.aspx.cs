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
    public partial class Logos : System.Web.UI.Page
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
                var table = (from t in ctx.assets_logos
                             where t.estado != "R"
                             where t.asset_name.ToUpper().Contains(search) || t.asset_code.ToUpper().Contains(search)
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

                assets_logos item = (from t in ctx.assets_logos
                               where t.id == id
                               select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Logo eliminado", this);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                Session["tmpid"] = id;

                var item = (from t in ctx.assets_logos
                            where t.id == id
                            select t).FirstOrDefault();

                txtSymbolEdit.Text = item.asset_code;
                txtDescEdit.Text = item.asset_name;



                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
            }
        }
        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.assets_logos
                               where t.id == id
                               select t).FirstOrDefault();
                item.estado = "A";

                ctx.SaveChanges();
                loadData();
                ShowMessage.info("Logo Publicado", this);
            }
        }
        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                review item = (from t in ctx.reviews
                               where t.id == id
                               select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Logo Desactivado", this);
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
            txtSearch.Focus();
        }

       

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(Session["tmpid"].ToString());
                var item = (from t in ctx.assets_logos
                            where t.id == id
                            select t).FirstOrDefault();


                String path = "\\Files\\asset_logo\\";
                Boolean fileOK = false;
                string fileURL = "";

                if (fuLogoEdit.HasFile)
                {
                    String fileExtension =
                        System.IO.Path.GetExtension(fuLogoEdit.FileName).ToLower();
                    String[] allowedExtensions =
                        { "jpg", "jpeg", "png",".svg"};
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                item.updated_at = DateTime.Now;
                item.asset_code = txtSymbolEdit.Text;
                item.asset_name = txtDescEdit.Text;

                if (fileOK)
                {
                    try
                    {
                        fuLogoEdit.PostedFile.SaveAs(Server.MapPath("~/Files/asset_logo/") + fuLogoEdit.FileName);
                        fileURL = path + fuLogoEdit.FileName;
                        item.img_url = fileURL;

                        ShowMessage.success("Logo Editado", this);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);

                    }
                    catch (Exception exe)
                    {
                        ShowMessage.error(exe.ToString(), this);
                    }
                }



                ctx.SaveChanges();
                loadData();
            }
        }

        protected void btnSaveNewLogo_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var item = new assets_logos
                {
                    asset_code = txtSymbolNew.Text,
                    asset_name = txtDescNew.Text,
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    estado = "A"
                };
                ctx.assets_logos.Add(item);
                ctx.SaveChanges();
                txtSymbolNew.Text = "";
                txtDescNew.Text = "";

                ShowMessage.success("Logo cread", this);
                loadData();
            }
        }
    }
}