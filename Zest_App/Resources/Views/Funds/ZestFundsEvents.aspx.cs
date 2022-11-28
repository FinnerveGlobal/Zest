using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Funds
{
    public partial class ZestFundsEvents : System.Web.UI.Page
    {
        private string symbol = "";

        public string Symbol { get => symbol; set => symbol = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string symbol = Request.QueryString["symbol"];
            if (symbol != null)
            {
                Symbol = symbol;
                System.Diagnostics.Debug.WriteLine("symbol: " + symbol);
                loadData();
            }
        }

        private void loadData()
        {
            var tempListFunds = (List<SP_App_FundData_Result>)Session["fund_list"];
            HttpCookie reqCookies = Request.Cookies["userInfo"];

            if (tempListFunds != null)
            {
                var currentFund = tempListFunds.Where(o => o.Symbol == Symbol).FirstOrDefault();
                if(currentFund != null)
                {
                    using (var ctx = new PivZestDevEntities())
                    {
                        int client = int.Parse(reqCookies["user_code"].ToString()); ;
                        int fundId = currentFund.FundId;

                        //client = 3214;
                        //fundId = 347;

                        var events = ctx.SP_FundEvent(client, fundId).ToArray();
                        System.Diagnostics.Debug.WriteLine("events: " + events.Length);
                        rpEventos.DataSource = events;
                        rpEventos.DataBind();
                    }
                }
            }
        }
    }
}