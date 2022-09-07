using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using Zest_App.Models;

namespace Zest_App.Common
{
    public class Authentication
    {
        public static List<investors> login(string user, string pass)
        {
            List<investors> inves = null;
            List<Investor> allinvestors = new List<Investor>();
            User us = null;

            using (var ctx = new PivZestDevEntities())
            {

                us = (from t in ctx.Users
                      where t.Email == user
                      select t).FirstOrDefault();


                if (us == null)
                {
                    return null;
                }
                else
                {
                    if (us.AccessAllInvestors)
                    {
                        allinvestors = ctx.Investors.Where(o=>o.IsActive).ToList();
                    }
                    else
                    {
                        var result = ctx.getInvestorAccess(us.UserId).ToList();

                        if (result.Count() > 0)
                        {
                            var ss = result.Select(ox => ox.InterfaceCode).ToList();
                            allinvestors = ctx.Investors.Where(o => o.IsActive).Where(o => ss.Contains(o.InterfaceCode)).ToList();

                        }
                        if (us.Investor != null)
                        {
                            if(allinvestors == null)
                            {
                                allinvestors.Add(us.Investor);
                            }
                            else { 
                            if (allinvestors.Where(o => o.InterfaceCode == us.Investor.InterfaceCode).Count() == 0)
                            {
                                allinvestors.Add(us.Investor);
                            }
                            }
                        }
                    }
                }


            }


            using (var ctx = new zestapp_dbEntities())
            {


                foreach (var item in allinvestors)
                {
                    var iv = (from t in ctx.investors
                              where t.investor_code == item.InvestorId.ToString()
                              select t).FirstOrDefault();



                    if (iv == null)
                    {
                        ctx.investors.Add(new investors
                        {
                            created_at = DateTime.Now,
                            email = "",
                            estado = "A",
                            investor_code = item.InvestorId.ToString(),
                            nombre = item.Name,
                            token = "",
                            updated_at = DateTime.Now
                        });

                    }
                }
                ctx.SaveChanges();

                if(allinvestors.Count() > 1) { 
                var invp = (from t in ctx.investors
                            where t.email == user
                            select t).FirstOrDefault();

                if (invp == null)
                {
                    ctx.investors.Add(new investors
                    {
                        created_at = DateTime.Now,
                        email = user,
                        estado = "A",
                        investor_code = "0",
                        nombre = us.Name,
                        token = "",
                        updated_at = DateTime.Now
                    });
                }

                ctx.SaveChanges();

                }


                var innvesstring = allinvestors.Select(o => o.InvestorId.ToString()).ToList();

                inves = (from t in ctx.investors
                         where innvesstring.Contains(t.investor_code) || t.email == user
                         select t).ToList();
            }
            return inves;
        }


        public static string GeneratePasswordHash(string thisPassword)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] tmpSource;
            byte[] tmpHash;


            tmpSource = ASCIIEncoding.ASCII.GetBytes(thisPassword); // Turn password into byte array
            tmpHash = md5.ComputeHash(tmpSource);

            StringBuilder sOuput = new StringBuilder(tmpHash.Length);
            for (int i = 0; i < tmpHash.Length; i++)
            {
                sOuput.Append(tmpHash[i].ToString("X2"));  // X2 formats to hexadecimal
            }
            return sOuput.ToString();
        }
        public static Boolean VerifyHashPassword(string thisPassword, string thisHash)
        {
            Boolean IsValid = false;
            string tmpHash = GeneratePasswordHash(thisPassword); // Call the routine on user input
            if (tmpHash == thisHash) IsValid = true;  // Compare to previously generated hash
            return IsValid;
        }
    }
}