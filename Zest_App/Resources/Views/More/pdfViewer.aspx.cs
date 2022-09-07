using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Zest_App.Resources.Views.More
{
    public partial class pdfViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["pdf_url"] != null)
            {
                HtmlGenericControl myObject = new HtmlGenericControl();
                myObject.TagName = "iframe";
                myObject.ID = "pdfIframe";
                myObject.Attributes.Add("src", "https://docs.google.com/gview?url=https://zest.pe"+Session["pdf_url"].ToString()+ "&embedded=true&rm=minimal");
                myObject.Attributes.Add("style", "width: 100%; height: calc(100vh - 100px);border-radius:5px");
                upFrame.FindControl("pdfContainer").Controls.Add(myObject);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "function hideExternal(){" +
                    "let head = $('#pdfIframe').contents().find('head');" +
                    "let css = '<style>.ndfHFb-c4YZDc-Wrql6b{display:none !important}</style>';" +
                    "$(head).append(css);};", true);

                getBack.HRef = Session["getBack"].ToString();
            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.UrlReferrer.ToString());
        }
    }
}