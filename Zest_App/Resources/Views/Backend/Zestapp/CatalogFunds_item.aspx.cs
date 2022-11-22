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
    public partial class CatalogFunds_item : System.Web.UI.Page
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
                //txtVencimiento.Text = DateTime.Now.ToString("yyyy-MM-dd");
                //txtLimite.Text = DateTime.Now.ToString("yyyy-MM-dd");
                loadData();
            }

        }

        public void loadData()
        {
            Session["detalle"] = new List<catalog_item_details>();
        }

        protected void btnSave_Click(object sender, EventArgs e)
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
            }else if (!FileUpload1.HasFile)
            {
                ShowMessage.warning("Campo archivo es obligatorio", this);
            }
            else
            {
                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);

                if (Extension != ".pdf")
                {
                    ShowMessage.warning("Ingresar un archivo formato .pdf", this);
                }
                else
                {
                    using (var ctx = new zestapp_dbEntities())
                    {
                        // Save file
                        string FolderPath = "/newsfile/";
                        string FilePath = Server.MapPath(FolderPath + FileName);
                        FileUpload1.SaveAs(FilePath);

                        var newFund = new catalog_fund_items();
                        newFund.created_at = DateTime.Now;
                        newFund.updated_at = DateTime.Now;
                        newFund.estado = "P";
                        newFund.codigo_fondo = codigo;
                        newFund.inv_minima = inversion_minima;
                        newFund.moneda = moneda;
                        newFund.gestor = gestor;
                        newFund.administrador = administrador;
                        newFund.auditor = auditor;
                        newFund.custodio = custodio;
                        newFund.riesgo = riesgo;
                        newFund.descripcion = descripcion;
                        newFund.nombre_archivo = FileName;

                        ctx.catalog_fund_items.Add(newFund);
                        int result = ctx.SaveChanges();
                        System.Diagnostics.Debug.WriteLine(result);

                        SendNotification.send("Nuevo Servicio", "Tenemos un nuevo fondo disponible para ti");
                        Session["mensaje"] = "Nuevo servicio (fondo) guardado correctamente";
                        Response.Redirect("~/Resources/Views/Backend/Zestapp/CatalogFunds.aspx");

                    }
                }

            }
        }
    }
}