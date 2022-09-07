using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Zest_App.Common
{
    public class ShowMessage
    {
        public enum MessageType { Success, Error, Info, Warning };
        public static void error(string Message, Page pg)
        {
            var tt = MessageType.Error;
            ScriptManager.RegisterStartupScript(pg, pg.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + tt + "');", true);
        }
        public static void success(string Message, Page pg)
        {
            var tt = MessageType.Success;
            ScriptManager.RegisterStartupScript(pg, pg.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + tt + "');", true);
        }
        public static void warning(string Message, Page pg)
        {
            var tt = MessageType.Warning;
            ScriptManager.RegisterStartupScript(pg, pg.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + tt + "');", true);
        }
        public static void info(string Message, Page pg)
        {
            var tt = MessageType.Info;
            ScriptManager.RegisterStartupScript(pg, pg.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + tt + "');", true);
        }
    }
}