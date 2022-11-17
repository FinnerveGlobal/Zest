using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zest_App.Resources.Views.Funds
{
    public partial class ZestFundsDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string symbol = Request.QueryString["symbol"];
            System.Diagnostics.Debug.WriteLine("symbol: "  + symbol);
        }
    }
}