using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Zest_App.Common
{
    public class SendMail
    {
       

        public static bool sendMail(string subject,string mail, string mensaje)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.office365.com", 587);
            smtpClient.EnableSsl = true;

            smtpClient.Credentials = new System.Net.NetworkCredential("cs@zest.pe", "Yob92967");
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            MailMessage mailMessage = new MailMessage("cs@zest.pe", mail);
            mailMessage.Subject = subject;
            mailMessage.Body = mensaje;

            try
            {
                smtpClient.Send(mailMessage);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}