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
    
    public partial class SP_ReturnNoteEventCLN_Result
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
        public Nullable<int> NroDefaults { get; set; }
        public Nullable<decimal> PorcentajePagado { get; set; }
    }
}
