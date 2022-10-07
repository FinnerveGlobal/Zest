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
    public partial class Catalog_item : System.Web.UI.Page
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
                txtVencimiento.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtLimite.Text = DateTime.Now.ToString("yyyy-MM-dd");
                loadData();
            }

        }

        public void loadData()
        {
            Session["detalle"] = new List<catalog_item_details>();
        }

        protected void btnSearchLogo_Click(object sender, EventArgs e)
        {
            string url = "";
            string search = txtPexel.Text.ToUpper();
            if (string.IsNullOrEmpty(search))
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "imageSearch('" + url + "');", true);
            }
            else
            {
                char[] charSeparators = new char[] { ',' };

                using (var ctx = new zestapp_dbEntities())
                {

                    var item = (from t in ctx.logos
                                where t.company.ToUpper().Contains(search)
                                select t).FirstOrDefault();

                    if (item != null)
                    {
                        url = item.url_img;
                        txtLogoImg.Text = url;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "imageSearch('" + url + "');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openImgModal();", true);
                    }

                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNombreAsset.Text))
                ShowMessage.warning("Nombre Obligatorio", this);
            else if (string.IsNullOrEmpty(txtDescAsset.Text))
                ShowMessage.warning("Descripción Obligatoria", this);
            else if (string.IsNullOrEmpty(txtLogoImg.Text))
                ShowMessage.warning("Debe seleccionar un logo", this);
            else
            {


                List<catalog_item_details> items = (List<catalog_item_details>)Session["detalle"];

                catalog_item_details newItem = new catalog_item_details
                {
                    created_at = DateTime.Now,
                    updated_at = DateTime.Now,
                    adicional = txtDescAsset.Text,
                    estado = "A",
                    nombre = txtNombreAsset.Text,
                    url_imt = Request.Form[txtLogoImg.UniqueID]
                };

                items.Add(newItem);

                Session["detalle"] = items;
                dgvTable.DataSource = items;
                dgvTable.DataBind();

                txtNombreAsset.Text = "";
                txtDescAsset.Text = "";
                txtLogoImg.Text = "";

                ShowMessage.success("Asset agregado", this);
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument.ToString());

            List<catalog_item_details> items = (List<catalog_item_details>)Session["detalle"];

            items.RemoveAt(id);

            Session["detalle"] = items;
            dgvTable.DataSource = items;
            dgvTable.DataBind();

            ShowMessage.success("Asset quitado", this);

        }

        protected void btnSaveNewImg_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string url = Request.Form[txtLogoTmp.UniqueID];

                var newLogo = new logo
                {
                    created_at = DateTime.Now,
                    company = Request.Form[txtSearchTmp.UniqueID],
                    dominio = Request.Form[txtSearchTmp.UniqueID],
                    estado = "A",
                    url_img = url

                };
                txtSearchTmp.Text = "";
                txtLogoTmp.Text = "";

                ctx.logos.Add(newLogo);
                ctx.SaveChanges();

                ShowMessage.success("Logo guardado", this);

                txtLogoImg.Text = url;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "imageSearch('" + url + "');", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string codigo = txtCodigo.Text;
            string isin = txtIsin.Text;
            DateTime vencimiento = DateTime.Parse(txtVencimiento.Text);
            DateTime limite = DateTime.Parse(txtLimite.Text);
            double inversion_minima = 0;

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
                using (var ctx = new zestapp_dbEntities())
                {
                    var newCatalog = new catalog_items
                    {
                        adicional = adicional,
                        barrera = barrera,
                        codigo_nota = codigo,
                        created_at = DateTime.Now,
                        updated_at = limite,
                        descripcion = desc,
                        emisor = emisor,
                        estado = "P",
                        inv_minima = inversion_minima,
                        isin = isin,
                        moneda = moneda,
                        riesgo = riesgo,
                        vencimiento = vencimiento,
                        catalog_item_details = (List<catalog_item_details>)Session["detalle"],
                        rentabilidad = txtRentabilidad.Text,
                        barrera_capital = txtBarreraCapital.Text
                    };



                    ctx.catalog_items.Add(newCatalog);
                    ctx.SaveChanges();

                    SendNotification.send("Nuevo Servicio", "Tenemos una nueva nota disponible para ti");
                    Session["mensaje"] = "Nuevo servicio guardado correctamente";
                    Response.Redirect("~/Resources/Views/Backend/Zestapp/Catalog.aspx");

                }
            }
        }
    }
}