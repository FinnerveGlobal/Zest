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
    public partial class Catalog : System.Web.UI.Page
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

                var table = (from t in ctx.catalog_items
                             where t.estado != "R"
                             where t.codigo_nota.ToUpper().Contains(search) || t.isin.ToUpper().Contains(search) || t.adicional.ToUpper().Contains(search) || t.barrera.ToUpper().Contains(search) || t.emisor.ToUpper().Contains(search) || t.riesgo.ToUpper().Contains(search)
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

        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                catalog_items item = (from t in ctx.catalog_items
                                      where t.id == id
                                      select t).FirstOrDefault();
                item.estado = "A";

                ctx.SaveChanges();
                loadData();

                //SendNotification.send("Catálogo Zest", "Tenemos una propuesta de inversión para ti");
                ShowMessage.info("Servicio Publicado", this);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                catalog_items item = (from t in ctx.catalog_items
                                      where t.id == id
                                      select t).FirstOrDefault();
                item.estado = "P";

                ctx.SaveChanges();
                loadData();
                ShowMessage.warning("Servicio Desactivado", this);
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                catalog_items item = (from t in ctx.catalog_items
                                      where t.id == id
                                      select t).FirstOrDefault();
                item.estado = "R";

                ctx.SaveChanges();
                loadData();
                ShowMessage.success("Servicio Eliminado", this);
            }
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openDetail();", true);

            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                Session["tmpid"] = id;

                catalog_items item = (from t in ctx.catalog_items
                                      where t.id == id
                                      select t).FirstOrDefault();
                dgvDetalle.DataSource = item.catalog_item_details.Where(o => o.estado == "A").ToArray();
                dgvDetalle.DataBind();
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                Session["tmpid"] = id;

                var item = (from t in ctx.catalog_items
                            where t.id == id
                            select t).FirstOrDefault();
                txtCodigo.Text = item.codigo_nota;
                txtVencimiento.Text = item.vencimiento.Value.ToString("yyyy-MM-dd");
                txtInversion.Text = item.inv_minima.Value.ToString("N0");
                txtRiesgo.Text = item.riesgo;
                txtEmisor.Text = item.emisor;
                txtBarrera.Text = item.barrera;
                ddlMoneda.SelectedValue = item.moneda;
                txtAdicional.Text = item.adicional;
                txtDesc.Text = item.descripcion;
                txtIsin.Text = item.isin;
                txtBarreraCapital.Text = item.barrera_capital;
                txtRentabilidad.Text = item.rentabilidad;
                txtLimite.Text = "";
                txtLimite.Text = item.updated_at.Value.ToString("yyyy-MM-dd");

                System.Diagnostics.Debug.WriteLine(txtLimite.Text);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit();", true);
            }
        }
        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(Session["tmpid"].ToString());
                var item = (from t in ctx.catalog_items
                            where t.id == id
                            select t).FirstOrDefault();

                string codigo = txtCodigo.Text;
                string isin = txtIsin.Text;
                DateTime vencimiento = DateTime.Parse(txtVencimiento.Text);
                
                double inversion_minima = 0;
                DateTime limite = DateTime.Parse(txtLimite.Text);
                string moneda = ddlMoneda.SelectedValue;
                string barrera = txtBarrera.Text;
                string emisor = txtEmisor.Text;
                string riesgo = txtRiesgo.Text;
                string adicional = txtAdicional.Text;
                string desc = txtDesc.Text;


                if (string.IsNullOrEmpty(codigo))
                {
                    ShowMessage.warning("Campo código es obligatorio", this);
                }
                else if (string.IsNullOrEmpty(isin))
                {
                    ShowMessage.warning("Campo ISIN es obligatorio", this);
                }
                else if (!double.TryParse(txtInversion.Text, out inversion_minima))
                {
                    ShowMessage.warning("Campo inversión mínima es obligatorio y debe ser un número", this);
                }
                else if (string.IsNullOrEmpty(barrera))
                {
                    ShowMessage.warning("Campo barrera es obligatorio", this);
                }
                else if (string.IsNullOrEmpty(emisor))
                {
                    ShowMessage.warning("Campo emisor es obligatorio", this);
                }
                else if (string.IsNullOrEmpty(riesgo))
                {
                    ShowMessage.warning("Campo riesgo es obligatorio", this);
                }
                else
                {
                    item.codigo_nota = codigo;
                    item.vencimiento = vencimiento;
                    item.updated_at = limite;
                    item.inv_minima = inversion_minima;
                    item.riesgo = riesgo;
                    item.emisor = emisor;
                    item.barrera = barrera;
                    item.moneda = moneda;
                    item.adicional = adicional;
                    item.descripcion = desc;
                    item.isin = isin;
                    item.barrera_capital = txtBarreraCapital.Text;
                    item.rentabilidad = txtRentabilidad.Text;


                    ctx.SaveChanges();
                    loadData();
                    ShowMessage.success("Servicio Editado", this);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit();", true);


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
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(Session["tmpid"].ToString());

                var item = new catalog_item_details
                {
                    adicional = txtTexto.Text,
                    nombre = txtTitulo.Text,
                    url_imt = txtImagen.Text,
                    estado = "A",
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    catalog_item_id = id
                };

                ctx.catalog_item_details.Add(item);
                ctx.SaveChanges();


                catalog_items itemdet = (from t in ctx.catalog_items
                                         where t.id == id
                                         select t).FirstOrDefault();
                dgvDetalle.DataSource = itemdet.catalog_item_details.Where(o => o.estado == "A").ToArray();
                dgvDetalle.DataBind();


                ShowMessage.success("Activo Editado", this);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit_det();", true);
            }
        }

        protected void btnSaveEditDet_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                int id = int.Parse(Session["tmpiddet"].ToString());
                var item = (from t in ctx.catalog_item_details
                            where t.id == id
                            select t).FirstOrDefault();


                item.url_imt = txtImagenEdit.Text;
                item.nombre = txtTituloEdit.Text;
                item.adicional = txtTextoEdit.Text;

                ctx.SaveChanges();


                catalog_items itemdet = (from t in ctx.catalog_items
                                      where t.id == item.catalog_item_id
                                      select t).FirstOrDefault();
                dgvDetalle.DataSource = itemdet.catalog_item_details.Where(o => o.estado == "A").ToArray();
                dgvDetalle.DataBind();


                ShowMessage.success("Activo Editado", this);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "close_edit_det();", true);
            }
        }

        protected void btnEditarDet_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                Session["tmpiddet"] = id;

                var item = (from t in ctx.catalog_item_details
                            where t.id == id
                            select t).FirstOrDefault();

                txtImagenEdit.Text = item.url_imt;
                txtTituloEdit.Text = item.nombre;
                txtTextoEdit.Text = item.adicional;


                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "open_edit_det();", true);
            }
        }

        protected void btnRemoveDet_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                LinkButton btn = (LinkButton)sender;
                int id = int.Parse(btn.CommandArgument.ToString());

                var item = (from t in ctx.catalog_item_details
                            where t.id == id
                            select t).FirstOrDefault();


                item.estado = "R";

                ctx.SaveChanges();


                catalog_items itemdet = (from t in ctx.catalog_items
                                         where t.id == item.catalog_item_id
                                         select t).FirstOrDefault();
                dgvDetalle.DataSource = itemdet.catalog_item_details.Where(o => o.estado == "A").ToArray();
                dgvDetalle.DataBind();


                ShowMessage.success("Activo eliminado", this);
            }
        }
    }
}