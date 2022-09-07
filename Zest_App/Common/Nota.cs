using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Zest_App.Common
{
    public class Nota
    {
        public string nombre {get;set;}
        public DateTime fecha { get; set; }
        public double usd { get; set; }
        public double rent { get; set; }

        public Nota(string nombre,DateTime fecha, double usd, double rent)
        {
            this.nombre = nombre;
            this.fecha = fecha;
            this.usd = usd;
            this.rent = rent;
        }
    }
}