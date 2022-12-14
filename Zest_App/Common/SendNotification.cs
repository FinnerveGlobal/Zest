using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace Zest_App.Common
{
    public class SendNotification
    {
        public static bool send(string title, string msg)
        {
            //var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://fcm.googleapis.com/fcm/send");
            //httpWebRequest.ContentType = "application/json";
            //httpWebRequest.Headers.Add("Authorization", "key=AAAAqfujz7E:APA91bGrVSF5yfPyd_VRWcFNVe1t79PWS_nQjeTmFRgnYVzM2jehie2i0Zek2ca2-OseqCl72AvYQY3v7zdYOUD2koAcenmv0D2aQX59WLmXsCGZWNHhQtX79IlTk5QEgx1gSOAZufWC");
            //httpWebRequest.Method = "POST";

            //using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            //{
            //    string json = "{" +
            //     "\"to\" : \"/topics/all\"," +
            //     "\"notification\" : {" +
            //        "\"title\": \""+title+"\"," +
            //        "\"body\" : \""+msg+"\"," +
                  
            //         "}" +
            //     "}";

            //    streamWriter.Write(json);
            //}

            //var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            //using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            //{
            //    var result = streamReader.ReadToEnd();
            //    var x = 1;
            //}

            return true;
        }

    }
}