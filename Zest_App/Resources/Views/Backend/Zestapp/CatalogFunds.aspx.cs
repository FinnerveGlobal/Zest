using System;
using System.Collections.Generic;
using System.IO;
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
    public partial class CatalogFunds : System.Web.UI.Page
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

                loadData();
            }

        }

        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string search = txtSearch.Text.ToUpper();

                var table = (from t in ctx.catalog_fund_items
                             where t.estado != "R"
                             where t.codigo_fondo.ToUpper().Contains(search)
                            select t).OrderByDescending(o => o.id).ToArray();

                System.Diagnostics.Debug.WriteLine(table.Length);

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

        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                catalog_fund_items item = (from t in ctx.catalog_fund_items
                                      where t.id == id
                                      select t).FirstOrDefault();

                if(item != null)
                {
                    item.estado = "A";
                    item.updated_at = DateTime.Now;
                    ctx.SaveChanges();
                    loadData();

                    //SendNotification.send("Catálogo Zest", "Tenemos una propuesta de inversión para ti");
                    ShowMessage.info("Servicio Publicado", this);
                }

            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                catalog_fund_items item = (from t in ctx.catalog_fund_items
                                           where t.id == id
                                           select t).FirstOrDefault();

                if(item != null)
                {
                    item.estado = "P";
                    item.updated_at = DateTime.Now;
                    ctx.SaveChanges();
                    loadData();
                    ShowMessage.warning("Servicio Desactivado", this);
                }
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                catalog_fund_items item = (from t in ctx.catalog_fund_items
                                           where t.id == id
                                           select t).FirstOrDefault();

                if(item != null)
                {
                    item.estado = "R";
                    item.updated_at = DateTime.Now;
                    ctx.SaveChanges();
                    loadData();
                    ShowMessage.success("Servicio Eliminado", this);
                }
            }
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openDetail();", true);

            //using (var ctx = new zestapp_dbEntities())
            //{
            //    LinkButton btn = (LinkButton)sender;
            //    int id = int.Parse(btn.CommandArgument.ToString());

            //    Session["tmpid"] = id;

            //    catalog_items item = (from t in ctx.catalog_items
            //                          where t.id == id
            //                          select t).FirstOrDefault();
            //    dgvDetalle.DataSource = item.catalog_item_details.Where(o => o.estado == "A").ToArray();
            //    dgvDetalle.DataBind();
            //}
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                Session["tmpid"] = id;

                catalog_fund_items item = (from t in ctx.catalog_fund_items
                                           where t.id == id
                                           select t).FirstOrDefault();

                if(item != null)
                {
                    txtCodigo.Text = item.codigo_fondo;
                    txtInversion.Text = item.inv_minima.Value.ToString("N0");
                    ddlMoneda.SelectedValue = item.moneda;
                    txtGestor.Text = item.gestor;
                    txtAdministrador.Text = item.administrador;
                    txtAuditor.Text = item.auditor;
                    txtCustodio.Text = item.custodio;
                    txtRiesgo.Text = item.riesgo;
                    txtDesc.Text = item.descripcion;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
                }
            }
        }
        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(Session["tmpid"].ToString());

                catalog_fund_items item = (from t in ctx.catalog_fund_items
                                           where t.id == id
                                           select t).FirstOrDefault();
                if(item != null)
                {
                    string codigo = txtCodigo.Text;
                    double inversion_minima = 0;
                    string moneda = ddlMoneda.SelectedValue;
                    string gestor = txtGestor.Text;
                    string administrador = txtAdministrador.Text;
                    string auditor = txtAuditor.Text;
                    string custodio = txtCustodio.Text;
                    string riesgo = txtRiesgo.Text;
                    string descripcion = txtDesc.Text;

                    if (string.IsNullOrEmpty(codigo))
                    {
                        ShowMessage.warning("Campo código es obligatorio", this);
                    }
                    else if (!double.TryParse(txtInversion.Text, out inversion_minima))
                    {
                        ShowMessage.warning("Campo inversión mínima es obligatorio y debe ser un número", this);
                    }
                    else if (string.IsNullOrEmpty(gestor))
                    {
                        ShowMessage.warning("Campo gestor es obligatorio", this);
                    }
                    else if (string.IsNullOrEmpty(administrador))
                    {
                        ShowMessage.warning("Campo emisor es obligatorio", this);
                    }
                    else if (string.IsNullOrEmpty(auditor))
                    {
                        ShowMessage.warning("Campo auditor es obligatorio", this);
                    }
                    else if (string.IsNullOrEmpty(custodio))
                    {
                        ShowMessage.warning("Campo custodio es obligatorio", this);
                    }
                    else if (string.IsNullOrEmpty(riesgo))
                    {
                        ShowMessage.warning("Campo riesgo es obligatorio", this);
                    }
                    else
                    {
                        if (FileUpload1.HasFile)
                        {
                            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                            string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);

                            if (Extension != ".pdf")
                            {
                                ShowMessage.warning("Ingresar un archivo formato .pdf", this);
                                return;
                            }

                            // Save file
                            string FolderPath = "/Files/";
                            string FilePath = Server.MapPath(FolderPath + FileName);
                            FileUpload1.SaveAs(FilePath);

                            item.nombre_archivo = FileName;
                        }


                        item.updated_at = DateTime.Now;
                        item.codigo_fondo = codigo;
                        item.inv_minima = inversion_minima;
                        item.moneda = moneda;
                        item.gestor = gestor;
                        item.administrador = administrador;
                        item.auditor = auditor;
                        item.custodio = custodio;
                        item.riesgo = riesgo;
                        item.descripcion = descripcion;

                        ctx.SaveChanges();
                        loadData();
                        ShowMessage.success("Servicio Editado", this);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);
                    }
                }
            }
        }


        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
            txtSearch.Focus();
        }

        protected void btnSaveNewDet_Click(object sender, EventArgs e)
        {
            //using (var ctx = new zestapp_dbEntities())
            //{
            //    int id = int.Parse(Session["tmpid"].ToString());

            //    var item = new catalog_item_details
            //    {
            //        adicional = txtTexto.Text,
            //        nombre = txtTitulo.Text,
            //        url_imt = txtImagen.Text,
            //        estado = "A",
            //        created_at = DateTime.Now,
            //        updated_at = DateTime.Now,
            //        catalog_item_id = id
            //    };

            //    ctx.catalog_item_details.Add(item);
            //    ctx.SaveChanges();


            //    catalog_items itemdet = (from t in ctx.catalog_items
            //                             where t.id == id
            //                             select t).FirstOrDefault();
            //    dgvDetalle.DataSource = itemdet.catalog_item_details.Where(o => o.estado == "A").ToArray();
            //    dgvDetalle.DataBind();


            //    ShowMessage.success("Activo Editado", this);
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit_det();", true);
            //}
        }

        protected void btnSaveEditDet_Click(object sender, EventArgs e)
        {
            //using (var ctx = new zestapp_dbEntities())
            //{
            //    int id = int.Parse(Session["tmpiddet"].ToString());
            //    var item = (from t in ctx.catalog_item_details
            //                where t.id == id
            //                select t).FirstOrDefault();


            //    item.url_imt = txtImagenEdit.Text;
            //    item.nombre = txtTituloEdit.Text;
            //    item.adicional = txtTextoEdit.Text;

            //    ctx.SaveChanges();


            //    catalog_items itemdet = (from t in ctx.catalog_items
            //                          where t.id == item.catalog_item_id
            //                          select t).FirstOrDefault();
            //    dgvDetalle.DataSource = itemdet.catalog_item_details.Where(o => o.estado == "A").ToArray();
            //    dgvDetalle.DataBind();


            //    ShowMessage.success("Activo Editado", this);
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit_det();", true);
            //}
        }

        protected void btnEditarDet_Click(object sender, EventArgs e)
        {
            //using (var ctx = new zestapp_dbEntities())
            //{
            //    LinkButton btn = (LinkButton)sender;
            //    int id = int.Parse(btn.CommandArgument.ToString());

            //    Session["tmpiddet"] = id;

            //    var item = (from t in ctx.catalog_item_details
            //                where t.id == id
            //                select t).FirstOrDefault();

            //    txtImagenEdit.Text = item.url_imt;
            //    txtTituloEdit.Text = item.nombre;
            //    txtTextoEdit.Text = item.adicional;


            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit_det();", true);
            //}
        }

        protected void btnRemoveDet_Click(object sender, EventArgs e)
        {
            //using (var ctx = new zestapp_dbEntities())
            //{
            //    LinkButton btn = (LinkButton)sender;
            //    int id = int.Parse(btn.CommandArgument.ToString());

            //    var item = (from t in ctx.catalog_item_details
            //                where t.id == id
            //                select t).FirstOrDefault();


            //    item.estado = "R";

            //    ctx.SaveChanges();


            //    catalog_items itemdet = (from t in ctx.catalog_items
            //                             where t.id == item.catalog_item_id
            //                             select t).FirstOrDefault();
            //    dgvDetalle.DataSource = itemdet.catalog_item_details.Where(o => o.estado == "A").ToArray();
            //    dgvDetalle.DataBind();


            //    ShowMessage.success("Activo eliminado", this);
            //}
        }
    }
}