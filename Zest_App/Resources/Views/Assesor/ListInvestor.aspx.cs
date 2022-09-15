using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Assesor
{
    public partial class ListInvestor : System.Web.UI.Page
    {
        PivZestDevEntities pv = new PivZestDevEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!this.IsPostBack)
            {
             
                if (Session["investor_list"] == null) { 
                    Response.Redirect("~/Resources/Views/Auth/Home.aspx");
                }
                loadData();
            }
        }

        protected void loadData()
        {
            string search = txtSearch.Text.ToUpper();

            if(search.Length >= 3) { 
                var inv_list = ((List<investors>)Session["investor_list"]).Select(o => o.investor_code).ToList();
                var investor_list = 
                    (from t in pv.Investors
                     where inv_list.Contains(t.InvestorId.ToString())
                     where t.InterfaceCode.ToUpper().Contains(search) || t.Name.ToUpper().Contains(search)
                     select new {
                         id = t.InvestorId,
                         t.InterfaceCode,
                         t.Name,
                         t.IsActive,
                         email = t.Contact != null ? (t.Contact.ContactEmails.FirstOrDefault() != null ? t.Contact.ContactEmails.FirstOrDefault().Email : "") : "",
                         phone = t.Contact != null ? (t.Contact.ContactPhones.FirstOrDefault() != null ? t.Contact.ContactPhones.FirstOrDefault().Extension + "" + t.Contact.ContactPhones.FirstOrDefault().Number : "") : ""
                     }).ToArray();
                dgvInvestor.DataSource = investor_list;
                dgvInvestor.DataBind();
                ltMessage.Text = "";
            }
            else
            {

                dgvInvestor.DataSource = null;
                dgvInvestor.DataBind();
                ltMessage.Text = "Debe escribir como mínimo 3 letras para buscar";
            }

        }

        protected void dgvTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            loadData();
            dgvInvestor.PageIndex = e.NewPageIndex;
            dgvInvestor.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
           loadData();
        }

        protected void btnInv_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            var id = btn.CommandArgument;
            using (var ctx = new zestapp_dbEntities())
            {
                var inv = (from t in ctx.investors
                            where t.investor_code == id
                            select t).FirstOrDefault();

                HttpCookie userInfo = new HttpCookie("userInfo");
                userInfo["user_id"] = inv.id.ToString();
                userInfo["user_code"] = inv.investor_code.ToString();

                userInfo.Expires = DateTime.Now.AddDays(365);

                Response.Cookies.Add(userInfo);

                Response.Redirect("~/Resources/Views/Dashboard/Resumen.aspx");
            }
        }
    }
}