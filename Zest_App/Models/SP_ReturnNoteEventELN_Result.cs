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
    
    public partial class SP_ReturnNoteEventELN_Result
    {
        public int FincomeEventId { get; set; }
        public int FincomeId { get; set; }
        public string Symbol { get; set; }
        public System.DateTime Fecha_Observación { get; set; }
        public System.DateTime Fecha_Cupón { get; set; }
        public int Tipo { get; set; }
        public Nullable<decimal> Valor { get; set; }
        public Nullable<decimal> Tasa { get; set; }
        public byte TipoRedondeo { get; set; }
        public Nullable<decimal> PorcentajePagado { get; set; }
    }
}
