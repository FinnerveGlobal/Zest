//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Zest_App.Models
{
    using System;
    
    public partial class SP_FundEvent_Result
    {
        public int FundId { get; set; }
        public System.DateTime PaymentDate { get; set; }
        public System.DateTime ExDate { get; set; }
        public Nullable<int> Year { get; set; }
        public Nullable<int> Month { get; set; }
        public Nullable<decimal> Dividend { get; set; }
        public Nullable<decimal> Tax { get; set; }
        public Nullable<decimal> Redemption { get; set; }
        public Nullable<decimal> PeriodPerformance { get; set; }
        public int Historic { get; set; }
    }
}