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
    
    public partial class Investor
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Investor()
        {
            this.Users = new HashSet<User>();
        }
    
        public int InvestorId { get; set; }
        public int ContactId { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
        public string InterfaceCode { get; set; }
        public int Type { get; set; }
        public int CurrencyId { get; set; }
        public int CountryId { get; set; }
        public int CalendarCode { get; set; }
        public Nullable<int> UserId { get; set; }
        public bool OnlyShareholder { get; set; }
        public string CultureName { get; set; }
        public byte ProcessingType { get; set; }
        public string IntegrationCode { get; set; }
        public Nullable<int> ContactRoleId { get; set; }
        public bool IsActiveToReports { get; set; }
        public Nullable<byte> VotingAuthority { get; set; }
        public Nullable<byte> DiscretionType { get; set; }
        public bool TaxExempt { get; set; }
        public Nullable<System.DateTime> W8StartDate { get; set; }
        public Nullable<System.DateTime> W8EndDate { get; set; }
    
        public virtual Contact Contact { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<User> Users { get; set; }
    }
}