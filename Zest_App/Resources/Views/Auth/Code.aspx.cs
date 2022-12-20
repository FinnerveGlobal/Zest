using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zest_App.Models;
using Zest_App.Common;

namespace Zest_App.Resources.Views.Auth
{
    public partial class Code : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            string code = Session["code"].ToString();


            string code_text = Request.Form[txtPIN.UniqueID];
            using (var ctx = new zestapp_dbEntities())
            {
                var tmp_code = (from t in ctx.generals
                                where t.name == "cell_code"
                                select t).FirstOrDefault();


                if (code.Equals(code_text) || code_text.Equals(tmp_code.value))
                {

                    Random random = new Random();
                    int new_code = random.Next(1000, 9999);

                    if (code_text.Equals(tmp_code.value))
                    {
                        tmp_code.value = new_code.ToString();
                        ctx.SaveChanges();
                    }

                    Response.Redirect("~/Resources/Views/Auth/Pin_security.aspx");
                }
                else
                {
                    ltError.Text = "El código ingresado es incorrecto";
                }
            }
        }

        protected void btnSendByMail_Click(object sender, EventArgs e)
        {
            //string email = Session["tmp_email"].ToString();
            //SendMail.sendMail("Código de ingreso",email, "El código de ingreso para tu app de zest es: " + Session["code"].ToString()) ;
        }
    }
}