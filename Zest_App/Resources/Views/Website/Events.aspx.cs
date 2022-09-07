using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Website
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Conoce nuestros eventos | Zest";
            if (!this.IsPostBack)
            {
                loadData();
                loadPastData();
            }
        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                var today = DateTime.Now.Date;
                var events = (from t in ctx.web_events
                              where t.estado == "A"
                              where t.event_date >= today
                              select t).OrderByDescending(o => o.id).ToArray();
           
                if(events.Count() > 0) {
                    rpEvents.DataSource = events.Take(3);
                    rpEvents.DataBind();
                }
                else
                {
                    var eventsdef = (from t in ctx.web_events
                                  where t.event_default == 1
                                  select t).OrderByDescending(o => o.id).ToArray();

                    rpEvents.DataSource = eventsdef.Take(3);
                    rpEvents.DataBind();

                }

                rpFullEvents.DataSource = events;
                rpFullEvents.DataBind();
            }
        }
        
        public void loadPastData()
        {
            using (var ctx = new zestapp_dbEntities())
            {

                var today = DateTime.Now.Date;
                var events = (from t in ctx.web_events
                              where t.estado == "A"
                              where t.event_date < today
                              where t.event_default != 1
                              select t).OrderByDescending(o => o.id).ToArray();


                rpPastEvents.DataSource = events;
                rpPastEvents.DataBind();
            }
        }

      
    }
}