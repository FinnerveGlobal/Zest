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
    
    public partial class web_entry_blogs
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public web_entry_blogs()
        {
            this.web_entry_comments = new HashSet<web_entry_comments>();
        }
    
        public int id { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
        public string estado { get; set; }
        public string titulo { get; set; }
        public string entrada { get; set; }
        public Nullable<int> user_id { get; set; }
        public string tags { get; set; }
        public Nullable<int> facebook { get; set; }
        public Nullable<int> instagram { get; set; }
        public Nullable<int> linkedin { get; set; }
        public string keywords { get; set; }
        public string img_url { get; set; }
        public string descrip { get; set; }
        public string entry_url { get; set; }
        public Nullable<int> views { get; set; }
        public Nullable<int> shares { get; set; }
        public Nullable<int> reading_time { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<web_entry_comments> web_entry_comments { get; set; }
        public virtual users users { get; set; }
    }
}
