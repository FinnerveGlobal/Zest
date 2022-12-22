using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;

namespace Zest_App.Resources.Layout
{
    public partial class appAssesor : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie reqCookies = Request.Cookies["userInfo"];
            int id = 0;
            int code = 0;

            if (reqCookies != null)
            {
                id = int.Parse(reqCookies["user_id"].ToString());
               // code = int.Parse(reqCookies["user_code"].ToString());
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Resources/Views/Auth/Home.aspx");
        }

        protected void btnLogoutAndDeleteInfo_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["userAInfo"] != null)
            {
                Response.Cookies["userAInfo"].Expires = DateTime.Now.AddDays(-1);
                if (Request.Cookies["userInfo"] != null)
                {
                    Response.Cookies["userInfo"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("/Resources/Views/Auth/Home.aspx");
            }
            if (Request.Cookies["userInfo"] != null)
            {
                Response.Cookies["userInfo"].Expires = DateTime.Now.AddDays(-1);
                if (Request.Cookies["userAInfo"] != null)
                {
                    Response.Cookies["userAInfo"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("/Resources/Views/Auth/Home.aspx");
            }
        }

    }
}