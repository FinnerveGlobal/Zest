//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Zest_App.Models
{
    using System;
    
    public partial class SP_MonthResume_Result
    {
        public int InvestorId { get; set; }
        public Nullable<int> Ano { get; set; }
        public Nullable<int> Mes { get; set; }
        public System.DateTime Fecha { get; set; }
        public decimal ValorPortafolio { get; set; }
        public Nullable<decimal> RentabilidadMensualPer { get; set; }
        public Nullable<decimal> RentabilidadMensualPerAcum { get; set; }
        public Nullable<decimal> RentabilidadAcumMesUSD { get; set; }
        public Nullable<decimal> Dividendos { get; set; }
        public Nullable<decimal> Retenciones { get; set; }
        public Nullable<decimal> ValorMesNet { get; set; }
        public Nullable<decimal> ValorMesAntNet { get; set; }
    }
}
