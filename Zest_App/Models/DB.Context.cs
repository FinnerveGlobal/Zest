﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class zestapp_dbEntities : DbContext
    {
        public zestapp_dbEntities()
            : base("name=zestapp_dbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<adviser> advisers { get; set; }
        public virtual DbSet<asset_prices> asset_prices { get; set; }
        public virtual DbSet<asset> assets { get; set; }
        public virtual DbSet<assets_logos> assets_logos { get; set; }
        public virtual DbSet<bloomberg_asset_prices> bloomberg_asset_prices { get; set; }
        public virtual DbSet<catalog_item_details> catalog_item_details { get; set; }
        public virtual DbSet<catalog_items> catalog_items { get; set; }
        public virtual DbSet<@event> events { get; set; }
        public virtual DbSet<general> generals { get; set; }
        public virtual DbSet<interes_investor_catalogs> interes_investor_catalogs { get; set; }
        public virtual DbSet<interes_investors> interes_investors { get; set; }
        public virtual DbSet<investor_advisers> investor_advisers { get; set; }
        public virtual DbSet<investor_reviews> investor_reviews { get; set; }
        public virtual DbSet<landing> landings { get; set; }
        public virtual DbSet<logo> logos { get; set; }
        public virtual DbSet<messages_investor> messages_investor { get; set; }
        public virtual DbSet<note> notes { get; set; }
        public virtual DbSet<notification> notifications { get; set; }
        public virtual DbSet<osp_crm_interactions> osp_crm_interactions { get; set; }
        public virtual DbSet<osp_crm_leads> osp_crm_leads { get; set; }
        public virtual DbSet<portfolio> portfolios { get; set; }
        public virtual DbSet<rent_months> rent_months { get; set; }
        public virtual DbSet<review> reviews { get; set; }
        public virtual DbSet<web_25k1k_publis> web_25k1k_publis { get; set; }
        public virtual DbSet<web_banners> web_banners { get; set; }
        public virtual DbSet<web_entry_blogs> web_entry_blogs { get; set; }
        public virtual DbSet<web_entry_comments> web_entry_comments { get; set; }
        public virtual DbSet<web_events> web_events { get; set; }
        public virtual DbSet<web_faq> web_faq { get; set; }
        public virtual DbSet<web_folders> web_folders { get; set; }
        public virtual DbSet<web_images> web_images { get; set; }
        public virtual DbSet<web_leads> web_leads { get; set; }
        public virtual DbSet<web_menu> web_menu { get; set; }
        public virtual DbSet<web_sections> web_sections { get; set; }
        public virtual DbSet<web_team_members> web_team_members { get; set; }
        public virtual DbSet<investors> investors { get; set; }
        public virtual DbSet<users> users { get; set; }
        public virtual DbSet<news> news { get; set; }
        public virtual DbSet<web_25k1k> web_25k1k { get; set; }
    }
}
