using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Website
{
    public partial class FaQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Preguntas frecuentes | Zest";
            if (!this.IsPostBack)
            {
                loadData();
                txtSearch.Focus();
            }
        }
        public void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string search = txtSearch.Text.ToLower();
                var items = (from t in ctx.web_faq
                            where t.estado == "A"
                            where t.question.ToLower().Contains(search) || t.answer.ToLower().Contains(search)
                             select t).OrderByDescending(o => o.id).ToArray();

                rpFaqs.DataSource = items;
                rpFaqs.DataBind();
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
            txtSearch.Focus();
        }
    }
}