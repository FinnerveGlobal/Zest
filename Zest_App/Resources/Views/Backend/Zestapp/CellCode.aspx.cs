using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;
using Zest_App.Resources.Layout;

namespace Zest_App.Resources.Views.Backend.Zestapp
{
    public partial class CellCode : System.Web.UI.Page
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

                loadData();
            }

        }

        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var tmp_code = (from t in ctx.generals
                                where t.name == "cell_code"
                                select t).FirstOrDefault();

                txtCode.Text = tmp_code.value;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var tmp_code = (from t in ctx.generals
                                where t.name == "cell_code"
                                select t).FirstOrDefault();


                Random random = new Random();
                int new_code = random.Next(1000, 9999);

                tmp_code.value = new_code.ToString();
                ctx.SaveChanges();


                txtCode.Text = new_code.ToString();
            }
        }
    }
}