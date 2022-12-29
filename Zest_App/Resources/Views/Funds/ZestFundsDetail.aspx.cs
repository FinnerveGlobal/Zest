using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Funds
{
    public partial class ZestFundsDetail : System.Web.UI.Page
    {
        private string symbol = "";

        public string Symbol { get => symbol; set => symbol = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string symbol = Request.QueryString["symbol"];
                if (symbol != null)
                {
                    Symbol = symbol;
                    System.Diagnostics.Debug.WriteLine("symbol: " + symbol);
                    loadData();
                }
            }
        }

        private void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var funds = (from t in ctx.catalog_fund_items
                             where t.codigo_fondo.Equals(Symbol)
                             select t).ToArray();
                catalog_fund_items fund = funds.FirstOrDefault();
                if(fund != null)
                {
                    fondo_gestor.Text = fund.gestor;
                    fondo_auditor.Text = fund.auditor;
                    fondo_moneda.Text = fund.moneda;
                    fondo_administrador.Text = fund.administrador;
                    fondo_custodio.Text = fund.custodio;
                    fondo_riesgo.Text = fund.riesgo;
                }
            }
        }
    }
}