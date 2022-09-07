using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Common;
using Zest_App.Models;

namespace Zest_App.Resources.Views.Backend
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["user"] != null)
                    Response.Redirect("~/Resources/Views/Backend/welcome.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string pass = txtPassword.Text;

            string hashpass = Authentication.GeneratePasswordHash(pass);

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(pass))
            {
                ShowMessage.error("Los campos son obligatorios", this);
            }
            else
            {
                using (var ctx = new zestapp_dbEntities())
                {
                    users us = (from t in ctx.users
                               where t.email == email
                               where t.estado == "A"
                               select t).FirstOrDefault();

                    if (us != null)
                    {
                        if (us.password == hashpass)
                        {
                            Session["user"] = us;
                            Response.Redirect("~/Resources/Views/Backend/welcome.aspx");

                        }
                        else
                        {
                            ShowMessage.warning("su contraseña es incorrecta", this);
                        }
                    }
                    else
                    {
                        ShowMessage.warning("Este email no se encuentra registrado", this);
                    }
                }
            }
        }


    }
}