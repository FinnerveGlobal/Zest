using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Dashboard
{
    public partial class Resumen : System.Web.UI.Page
    {
        private bool hasNotes = false;

        public bool HasNotes { get => hasNotes; set => hasNotes = value; }

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

        public string returnNot(string codigo)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var item = ctx.notifications.Where(o => o.notification1.Contains(codigo) && o.estado == "A").FirstOrDefault();

                if(item == null)
                {
                    return "fas fa-circle fa-inactive";
                }
                else
                {
                    return "fas fa-circle fa-active";
                }
            }
        }

        public void loadData()
        {

            HttpCookie reqCookies = Request.Cookies["userInfo"];

            int id = 0;
            int code = 0;

            if (reqCookies != null)
            {
                id = int.Parse(reqCookies["user_id"].ToString());
                code = int.Parse(reqCookies["user_code"].ToString());
            }

            code = 3214;

            using (var ctx = new PivZestDevEntities())
            {
                string resumen = "",resumen_rent = "",resumen_rent_usd="";
                
                //var rent_months = ctx.SP_MonthResume(code, DateTime.Now.AddYears(-1), DateTime.Now).OrderBy(o => o.Fecha).ToArray();

                String labels = "[";
                String data = "[";
                int index = 1;
                decimal t1 = 0;
                decimal t2 = 0;
                decimal t3 = 0;
                decimal t4 = 0;

                decimal p1 = 0;
                decimal p2 = 0;
                decimal p3 = 0;
                decimal p4 = 0;
                decimal dataAcumulada = 0;
                decimal dataAcumuladaUSD = 0;

                string[] months = { "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" };

                //foreach (var item in rent_months)
                //{
                //    labels += "'" + item.Ano.ToString().Substring(2,2)+ "-" + months[item.Mes.Value - 1]+"',";
                //    dataAcumulada = Math.Round((decimal)(item.RentabilidadMensualPerAcum == null ? 0: item.RentabilidadMensualPerAcum), 2);
                //    dataAcumuladaUSD = Math.Round((decimal)(item.ValorMesNet == null ? 0 : item.ValorMesNet), 2);
                //    data += Math.Round(dataAcumulada, 2) + ",";


                //    resumen = item.ValorPortafolio.ToString("N2");
                //}

                //resumen_rent = dataAcumulada.ToString("N2");
                //resumen_rent_usd = dataAcumuladaUSD.ToString("N2");

                //foreach (var item in rent_months.OrderByDescending(o => o.Fecha))
                //{

                //    switch (index)
                //    {
                //        case 1:
                //            ltp1.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value-1]; 
                //            ltm1.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t1 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p1++;
                //            break;
                //        case 2:
                //            ltp2.Text = item.Ano.ToString().Substring(2, 2) + "-" +months[item.Mes.Value - 1];
                //            ltm2.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t1 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p1++;
                //            break;
                //        case 3:
                //            ltp3.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm3.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t1 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p1++;
                //            break;
                //        case 4:
                //            ltp4.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm4.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t2 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p2++;
                //            break;
                //        case 5:
                //            ltp5.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm5.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t2 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p2++;
                //            break;
                //        case 6:
                //            ltp6.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm6.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t2 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p2++;
                //            break;
                //        case 7:
                //            ltp7.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm7.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t3 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p3++;
                //            break;
                //        case 8:
                //            ltp8.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm8.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t3 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p3++;
                //            break;
                //        case 9:
                //            ltp9.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm9.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t3 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p3++;
                //            break;
                //        case 10:
                //            ltp10.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm10.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t4 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p4++;
                //            break;
                //        case 11:
                //            ltp11.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm11.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t4 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p4++;
                //            break;
                //        case 12:
                //            ltp12.Text = item.Ano.ToString().Substring(2, 2) + "-" + months[item.Mes.Value - 1];
                //            ltm12.Text = Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2).ToString();
                //            t4 += Math.Round((decimal)(item.RentabilidadMensualPer == null ? 0 : item.RentabilidadMensualPer), 2);
                //            p4++;
                //            break;
                //        default:
                //            break;

                //    };

                //    index++;
                //}

                //if(p1 != 0)
                //    t1 = t1 ;
                //if (p2 != 0)
                //    t2 = t2 +t1;
                //if (p3 != 0)
                //    t3 = t3 +t2;
                //if (p4 != 0)
                //    t4 = t4 +t3;

                /* lt1.Text = ((Double)t1).ToString("N2");
                 lt2.Text = ((Double)t2).ToString("N2");
                 lt3.Text = ((Double)t3).ToString("N2");
                 lt4.Text = ((Double)t4).ToString("N2");*/


                //lt1.Text = "";
                //lt2.Text = "";
                //lt3.Text = "";
                //lt4.Text = "";

                //labels = labels.Remove(labels.Length - 1, 1);
                //labels += "]";

                //data = data.Remove(data.Length - 1, 1);
                //data += "]";


                String chart = "";
                chart += "<canvas id=\"line-chart\" width=\"100%\" height=\"90\"></canvas>";
                chart += "<script>";

                chart += "new Chart(document.getElementById(\"line-chart\"), { type: 'line', data : {" +
                    " labels: " + labels + ", " +
                    "datasets: [{ " +
                    "data: " + data + ", " +
                    "label : \"Rentabilidad\", borderColor: \"#d5b904\",backgroundColor: 'rgba(213,185,4,.1)' ,fill: true,fontSize:7}]}," +
                    "options: {title: {display:false},legend : {display:false},scales :{ xAxes: [{ticks: { fontSize:10,fontColor:'#fff' }}],yAxes: [{ticks: { fontSize:10,fontColor:'#fff',  callback: function(value, index, values) { return value + '%';  }}}]}  } });";

                chart += "</script>";

                //ltChart.Text = chart;

                //rentabilidad_resumen.Text = resumen_rent;
                //usd_rentabilidad_resumen.Text = resumen_rent_usd ;

                var notas = ctx.SP_PosicionFondos(code).ToArray();

                // Check
                if (notas.Length == 0) return;
                HasNotes = true;

                dataAcumulada = 0;
                List<note> notas_list = new List<note>();
                foreach(var item in notas)
                {
                    System.Diagnostics.Debug.WriteLine(item.Symbol);
                    var tmp = ctx.SP_ReturnEstructureNote(item.Symbol, DateTime.Now).FirstOrDefault();
                    
                    if(tmp != null) { 
                        var note_tmp = notas_list.Where(o => o.nombre == tmp.Symbol).FirstOrDefault();
                        if(note_tmp != null)
                        {
                            System.Diagnostics.Debug.WriteLine(" != null: " + item.Symbol);
                            note_tmp.valor = note_tmp.valor + (double)item.ValorMercado;
                        
                        }
                        else {
                            notas_list.Add(new note { 
                                nombre = tmp.Symbol,
                                vencimiento = tmp.MaturityDate,
                                valor =(double)item.ValorMercado,
                                rentabilidad=(double) tmp.InterestCommissionRate,
                                codigo = tmp.NoteSymbol,
                                moneda = tmp.Currency,
                                tipo_nota = tmp.AssetClassName,
                                 fecha_inicio = tmp.IssueDate,
                                 fecha_fin = tmp.MaturityDate,
                                 emisor = tmp.Emisor,
                                 ISN = tmp.Isin,
                                 riesgo = tmp.KnockInBarrier == null ? "0":tmp.KnockInBarrier.Value.ToString("N0"),
                                barrera_europea = tmp.CouponBarrier == null ? "0":tmp.CouponBarrier.Value.ToString("N0"),
                                redencion = (item.DividendosIntereses == null? 0:item.DividendosIntereses) + (item.Retenciones == null?0:item.Retenciones),
                                impuestos = item.Retenciones == null ? 0 : item.Retenciones,
                                dividendos = item.DividendosIntereses == null ? 0 : item.DividendosIntereses,
                                 adicional = tmp.FincomeID.ToString()
                         
                            });;
                            dataAcumulada += (decimal)(item.ValorMercado);
                        }
                    }
                    else
                    {
                        notas_list.Add(new note
                        {
                            nombre = item.Symbol,
                            vencimiento = item.HistoricalDate,
                            valor = (double)item.ValorMercado,
                            rentabilidad = item.Rentabilidad,
                            codigo = item.Symbol,
                            moneda = "USD",
                            tipo_nota = "EQUITY",
                            fecha_inicio = item.HistoricalDate,
                            fecha_fin = item.HistoricalDate,
                            emisor = "",
                            ISN = "",
                            riesgo = "",
                            barrera_europea = "",
                            redencion = (item.DividendosIntereses == null ? 0 : item.DividendosIntereses) + (item.Retenciones == null ? 0 : item.Retenciones),
                            impuestos = item.Retenciones == null ? 0 : item.Retenciones,
                            dividendos = item.DividendosIntereses == null ? 0 : item.DividendosIntereses,
                            adicional = ""

                        }); ;
                        dataAcumulada += (decimal)(item.ValorMercado);
                    }
                }

                valor_resumen.Text = dataAcumulada.ToString("N2");
                System.Diagnostics.Debug.WriteLine(notas_list.Count);
                Session["notas_list"] = notas_list;

                rpNotas.DataSource = notas_list ;
                rpNotas.DataBind();

            }

          
        }
    }
}