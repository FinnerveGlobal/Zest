using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Funds
{
    public partial class ZestFundsAnalisis : System.Web.UI.Page
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
            string code = Symbol; // Symbol + ",";
            // code = "A4,";
            using (var ctx = new zestapp_dbEntities())
            {
                var reviews = (from t in ctx.reviews
                               where t.note_code.Contains(code)
                               orderby t.created_at descending
                               select t).ToArray();


                rpReviews.DataSource = reviews;
                rpReviews.DataBind();
            }
        }

        protected void btnPdf_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            Session["pdf_url"] = btn.CommandArgument;
            Session["getBack"] = "/Resources/Views/Funds/ZestFundsAnalisis.aspx?symbol=" + Symbol.Replace(" ", "+");
            Response.Redirect("~/Resources/Views/More/pdfViewerNew.aspx");
        }
    }
}