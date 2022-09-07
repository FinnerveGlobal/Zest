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
    using System.Collections.Generic;
    
    public partial class note
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public note()
        {
            this.assets = new HashSet<asset>();
            this.events = new HashSet<@event>();
        }
    
        public int id { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
        public string nombre { get; set; }
        public Nullable<System.DateTime> vencimiento { get; set; }
        public Nullable<double> valor { get; set; }
        public Nullable<double> rentabilidad { get; set; }
        public string codigo { get; set; }
        public string tipo_nota { get; set; }
        public Nullable<System.DateTime> fecha_inicio { get; set; }
        public Nullable<System.DateTime> fecha_fin { get; set; }
        public string moneda { get; set; }
        public string emisor { get; set; }
        public string ISN { get; set; }
        public string riesgo { get; set; }
        public string barrera_europea { get; set; }
        public string adicional { get; set; }
        public Nullable<int> portfolio_id { get; set; }
        public Nullable<decimal> dividendos { get; set; }
        public Nullable<decimal> impuestos { get; set; }
        public Nullable<decimal> redencion { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<asset> assets { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<@event> events { get; set; }
        public virtual portfolio portfolio { get; set; }
    }
}