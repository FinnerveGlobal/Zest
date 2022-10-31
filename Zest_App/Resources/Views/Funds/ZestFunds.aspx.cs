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

        protected void Page_Load(object sender, EventArgs e)
        {
            // ... load data
            using (var ctx = new PivZestDevEntities())
            {
                // ctx.SP_FundData(5501, DateTime.Now.AddYears(-1), DateTime.Now);
            }
            this.Test = false;
        }
    }
}