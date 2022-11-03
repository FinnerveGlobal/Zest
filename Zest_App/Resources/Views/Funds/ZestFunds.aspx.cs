using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Funds
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private bool test;

        public bool Test { get => test; set => test = value; }
        

        private bool hasFunds = false;

        public bool HasFunds { get => hasFunds; set => hasFunds = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            loadData();
            if (!this.IsPostBack)
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];
                if (reqCookies == null)
                    Response.Redirect("~/Resources/Views/Auth/Home.aspx");
            }
            
        }

        private void loadData()
        {
            HttpCookie reqCookies = Request.Cookies["userInfo"];

            int id = 0;
            int code = 0;

            if (reqCookies != null)
            {
                id = int.Parse(reqCookies["user_id"].ToString());
                code = int.Parse(reqCookies["user_code"].ToString());
            }

            System.Diagnostics.Debug.WriteLine(id);
            System.Diagnostics.Debug.WriteLine(code);

            using (var ctx = new PivZestDevEntities())
            {
                // Header resume
                decimal naVDelDia = 0, valorNominalInversion = 0, rentabilidadAcumuladaBaseNav = 0, dividendosAcumulados = 0;
                var app_fundData_result = ctx.SP_App_FundData(5501).ToArray().FirstOrDefault();
                
                naVDelDia = Math.Round((decimal)(app_fundData_result.NaVDelDia == null ? 0 : app_fundData_result.NaVDelDia), 2);
                valorNominalInversion = Math.Round((decimal)(app_fundData_result.ValorNominalInversion == null ? 0 : app_fundData_result.ValorNominalInversion), 2);
                rentabilidadAcumuladaBaseNav = Math.Round((decimal)(app_fundData_result.RentabilidadAcumuladaBaseNav == null ? 0 : app_fundData_result.RentabilidadAcumuladaBaseNav), 2);
                dividendosAcumulados = Math.Round((decimal)(app_fundData_result.DividendosAcumulados == null ? 0 : app_fundData_result.DividendosAcumulados), 2);

                valor_nominal.Text = valorNominalInversion.ToString("N2");
                nav_del_dia.Text = naVDelDia.ToString("N2");
                rentabilidad_acumulada.Text = rentabilidadAcumuladaBaseNav.ToString("N2");
                dividendos_acumulados.Text = dividendosAcumulados.ToString("N2");


                // Linear graph
                // var fundTwrPerformance = ctx.Uf_FundTwrPerformance(5501, 347, new DateTime(2022, 2, 10), new DateTime(2022, 2, 17)).ToArray();
                var fundTwrPerformance = ctx.SP_App_FundPerformance_ByDay(5501);
                String labels = "[";
                String data = "[";
                string[] months = { "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" };

                foreach (var item in fundTwrPerformance)
                {
                    labels += "'" + item.HistoricalDate.Day + "-" + months[item.HistoricalDate.Month - 1] + "',";
                    var tempFundReturn = Math.Round((decimal)(item.FundReturn == null ? 0 : item.FundReturn), 2);
                    data += Math.Round(tempFundReturn, 2) + ",";
                }

                labels = labels.Remove(labels.Length - 1, 1);
                labels += "]";

                data = data.Remove(data.Length - 1, 1);
                data += "]";


                String chart = "";
                chart += "<canvas id=\"line-chart\" width=\"100%\" height=\"90\"></canvas>";
                chart += "<script>";

                chart += "new Chart(document.getElementById(\"line-chart\")," +
                    "{type: 'line'," +
                    "data:{labels: " + labels + ",datasets: [{ data: " + data + ",label: 'Rentabilidad', borderColor: '#d5b904',backgroundColor: 'rgba(213,185,4,.1)',fill: true, fontSize: 7,yAxisID: 'first-y-axis'}]}," +
                    "options: {title: {display: false},legend: { display: false }," +
                    "scales: { xAxes: [{ ticks: { fontSize: 10, fontColor: '#fff' } }], " +
                    "yAxes: [ { id: 'first-y-axis', type: 'linear', position: 'left', ticks: { fontSize: 10, fontColor: '#fff'," +
                    "callback: function (value, index, values) { return value + ' %'; }}}]}}});";

                chart += "</script>";

                ltChart.Text = chart;

                System.Diagnostics.Debug.WriteLine(labels);
                System.Diagnostics.Debug.WriteLine(data);
                System.Diagnostics.Debug.WriteLine(chart);


                // List of funds
                var fundData_result = ctx.SP_FundData(5501, new DateTime(2022, 2, 17), new DateTime(2022, 2, 17)).ToArray();
                if (fundData_result.Length == 0)
                {
                    this.HasFunds = false;
                    return;
                }
                this.HasFunds = true;

                rpFunds.DataSource = fundData_result.ToList();
                rpFunds.DataBind();

            }
        }
    }
}