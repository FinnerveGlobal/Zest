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
    
    public partial class Uf_FundTwrPerformance_Result
    {
        public System.DateTime HistoricalDate { get; set; }
        public Nullable<int> InvestorId { get; set; }
        public Nullable<int> FundId { get; set; }
        public Nullable<double> Nav { get; set; }
        public Nullable<double> Deposits { get; set; }
        public Nullable<double> Withdrawal { get; set; }
        public Nullable<double> AccruedReturnFactor { get; set; }
        public Nullable<double> FundReturn { get; set; }
    }
}