using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Website
{
    public partial class Aboutus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { 
            Page.Title = "Quienes somos | Zest";
                loadData();
            }
        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var publis = (from t in ctx.web_25k1k_publis
                              where t.estado == "A"
                              select t).OrderBy(o=> o.prioridad).ToArray();
                rpPublicaciones.DataSource = publis;
                rpPublicaciones.DataBind();

                var team = (from t in ctx.web_team_members
                            where t.estado == "A"
                            select t).ToArray();
                rpTeam.DataSource = team;
                rpTeam.DataBind();

                var text = (from t in ctx.web_25k1k select t).FirstOrDefault();
                if (text != null)
                {
                    ltTitle.Text = text.title;
                    ltDesc.Text = text.description;
                }
            }
        }
    }

   
}