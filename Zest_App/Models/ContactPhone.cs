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
    
    public partial class ContactPhone
    {
        public int ContactPhoneId { get; set; }
        public int ContactId { get; set; }
        public byte Type { get; set; }
        public string Number { get; set; }
        public string Extension { get; set; }
    
        public virtual Contact Contact { get; set; }
    }
}