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
    
    public partial class web_entry_comments
    {
        public int id { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
        public string estado { get; set; }
        public Nullable<int> web_user_id { get; set; }
        public string comment { get; set; }
        public Nullable<int> web_entry_blog_id { get; set; }
    
        public virtual web_entry_blogs web_entry_blogs { get; set; }
    }
}
