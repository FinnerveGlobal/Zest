using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Zest_App
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        void RegisterRoutes(RouteCollection routes)
        {
            /*=====================BACKEND ADMIN========================*/
            routes.MapPageRoute(
                "AdminLogin",
                "osp-admin",
                "~/Resources/Views/Backend/Login.aspx"
            );

            /*=====================WEBSITE========================*/
            routes.MapPageRoute(
                "HomeRoute",
                "",
                "~/Resources/Views/Website/Home.aspx"
            );
            routes.MapPageRoute(
               "AboutRoute",
               "nosotros",
                "~/Resources/Views/Website/Aboutus.aspx"
           );
            routes.MapPageRoute(
              "BlogRoute",
              "blog",
               "~/Resources/Views/Website/Efinanciera.aspx"
          );
            routes.MapPageRoute(
              "EntryRoute",
              "ef/{entry_url}",
               "~/Resources/Views/Website/EfinancieraEntry.aspx"
          );
            routes.MapPageRoute(
             "FaqRoute",
             "faq",
              "~/Resources/Views/Website/FaQ.aspx"
         );
            routes.MapPageRoute(
            "EventRoute",
            "events",
             "~/Resources/Views/Website/Events.aspx"
        );
            routes.MapPageRoute(
           "LegaRoute",
           "legal",
            "~/Resources/Views/Website/Legalinfo.aspx"
       );
            routes.MapPageRoute(
          "DisclaimerRoute",
          "legalfundacion",
           "~/Resources/Views/Website/Legalfundation.aspx"
      );
            routes.MapPageRoute(
             "apphowRoute",
             "apphow",
            "~/Resources/Views/Website/App.aspx"
 );

            routes.MapPageRoute(
          "newsRoute",
          "noticias",
         "~/Resources/Views/Website/News.aspx"
);
            /*======================APP=======================*/
            routes.MapPageRoute(
            "AppRoute",
            "osp-app-2020",
             "~/Resources/Views/Auth/Home.aspx"
        );
        }
    }
}