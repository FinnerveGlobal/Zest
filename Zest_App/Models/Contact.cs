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
    
    public partial class Contact
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Contact()
        {
            this.ContactEmails = new HashSet<ContactEmail>();
            this.ContactPhones = new HashSet<ContactPhone>();
            this.Investors = new HashSet<Investor>();
        }
    
        public int ContactId { get; set; }
        public byte Type { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Nickname { get; set; }
        public int CountryId { get; set; }
        public System.DateTime RecordDate { get; set; }
        public int ContactStatusId { get; set; }
        public string RegisterId { get; set; }
        public Nullable<System.DateTime> ClientSince { get; set; }
        public int ContactCategoryId { get; set; }
        public Nullable<int> SalesAdvisorId { get; set; }
        public Nullable<int> RelationshipAdvisorId { get; set; }
        public Nullable<System.DateTime> LastSuitabilityReview { get; set; }
        public Nullable<byte> WorkflowProgress { get; set; }
        public Nullable<int> AccountManagerId { get; set; }
        public Nullable<int> RiskProfileId { get; set; }
        public Nullable<int> KnowledgeLevel { get; set; }
        public Nullable<byte> Classification { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ContactEmail> ContactEmails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ContactPhone> ContactPhones { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Investor> Investors { get; set; }
    }
}
