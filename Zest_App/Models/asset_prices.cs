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
    using System.Collections.Generic;
    
    public partial class asset_prices
    {
        public int id { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
        public Nullable<System.DateTime> fecha { get; set; }
        public Nullable<double> precio { get; set; }
        public Nullable<int> asset_id { get; set; }
    
        public virtual asset asset { get; set; }
    }
}
