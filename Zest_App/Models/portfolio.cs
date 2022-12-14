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
    
    public partial class portfolio
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public portfolio()
        {
            this.notes = new HashSet<note>();
            this.rent_months = new HashSet<rent_months>();
        }
    
        public int id { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
        public Nullable<double> valor { get; set; }
        public Nullable<double> rentabilidad { get; set; }
        public Nullable<double> usd_rentabilidad { get; set; }
        public Nullable<int> investor_id { get; set; }
        public Nullable<int> subida { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<note> notes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<rent_months> rent_months { get; set; }
        public virtual investors investors { get; set; }
    }
}
