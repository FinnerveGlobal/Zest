using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Assesor
{
    public partial class Messages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {

                if (Session["investor_list"] == null)
                    Response.Redirect("~/Resources/Views/Auth/Home.aspx");
                loadData();
            }
        }
        protected void loadData()
        {
            using (var ctx = new zestapp_dbEntities())
            {
                string search = txtSearch.Text.ToUpper();

                var inv_list = ((List<investors>)Session["investor_list"]).Select(o => o.investor_code).ToList();

                var prospects = (from t in ctx.messages_investor
                                 where inv_list.Contains(t.investors.investor_code)
                                 where t.status == "A"
                                 select new
                                 {
                                     t.id,
                                     t.investors.nombre,
                                     t.mensaje,
                                     t.investors.telefono,
                                     t.created_at
                                 }).Where(o => o.nombre.ToUpper().Contains(search)).ToList();

                rpInvestors.DataSource = prospects;
                rpInvestors.DataBind();
            }

        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            int id = int.Parse(btn.CommandArgument);
            using (var ctx = new zestapp_dbEntities())
            {
                var item = (from t in ctx.messages_investor
                            where t.id == id
                            select t).FirstOrDefault();
                item.status = "P";
                ctx.SaveChanges();
                loadData();
            }
        }
    }
}