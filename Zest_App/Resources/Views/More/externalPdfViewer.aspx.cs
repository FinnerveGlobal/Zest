using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zest_App.Resources.Views.More
{
    public partial class externalPdfViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Session["tmpUrl"].ToString();
            string back = Request.QueryString["getBack"];

            externalFrame.Src = "https://docs.google.com/gview?url=" + url + "&embedded=true&rm=minimal";
            externalFrame.DataBind();

            txtUrl.Text = url;
            getBack.HRef = back;

            //string embedHtml = "<object data=\""
            //    + url + "\""
            //    + "type=\"application/pdf\" style=\"background: #fff; width: 100%;border:none;height:calc(100vh - 38px)\"></object>";

            //ltEmbed.Text = embedHtml;
        }
    }
}