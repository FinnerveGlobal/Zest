using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
             
                if (Session["investor_list"] == null)
                    Response.Redirect("~/Resources/Views/Auth/Home.aspx");
                loadData();
            }
        }

        protected void loadData()
        {
            string search = txtSearch.Text.ToUpper();
            var inv_list = ((List<investors>)Session["investor_list"]).Select(o => o.investor_code).ToList();

            var investor_list = pv.Investors.Where(o => inv_list.Contains(o.InvestorId.ToString())).Select(o =>
                    new
                    {
                        id = o.InvestorId,
                        o.InterfaceCode,
                        o.Name,
                        o.IsActive,
                        email = o.Contact != null ? (o.Contact.ContactEmails.FirstOrDefault() != null ? o.Contact.ContactEmails.FirstOrDefault().Email : "") : "",
                        phone = o.Contact != null ? (o.Contact.ContactPhones.FirstOrDefault() != null ? o.Contact.ContactPhones.FirstOrDefault().Extension + "" + o.Contact.ContactPhones.FirstOrDefault().Number : "") : ""
                    }
                ).Where(o => o.InterfaceCode.ToUpper().Contains(search) || o.Name.ToUpper().Contains(search) || o.email.ToUpper().Contains(search)).ToList();

            rpInvestors.DataSource = investor_list;
            rpInvestors.DataBind();

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