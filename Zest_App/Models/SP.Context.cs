﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class PivZestDevEntities : DbContext
    {
        public PivZestDevEntities()
            : base("name=PivZestDevEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<ContactEmail> ContactEmails { get; set; }
        public virtual DbSet<ContactPhone> ContactPhones { get; set; }
        public virtual DbSet<Investor> Investors { get; set; }
        public virtual DbSet<User> Users { get; set; }
    
        public virtual ObjectResult<SearchAdvisor_Result> SearchAdvisor(Nullable<int> investorId)
        {
            var investorIdParameter = investorId.HasValue ?
                new ObjectParameter("InvestorId", investorId) :
                new ObjectParameter("InvestorId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SearchAdvisor_Result>("SearchAdvisor", investorIdParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> SearchInvestor(string number, string login, string email)
        {
            var numberParameter = number != null ?
                new ObjectParameter("number", number) :
                new ObjectParameter("number", typeof(string));
    
            var loginParameter = login != null ?
                new ObjectParameter("login", login) :
                new ObjectParameter("login", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("SearchInvestor", numberParameter, loginParameter, emailParameter);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<SP_MonthResume_Result> SP_MonthResume(Nullable<int> investorId, Nullable<System.DateTime> date_ini, Nullable<System.DateTime> date_fin)
        {
            var investorIdParameter = investorId.HasValue ?
                new ObjectParameter("InvestorId", investorId) :
                new ObjectParameter("InvestorId", typeof(int));
    
            var date_iniParameter = date_ini.HasValue ?
                new ObjectParameter("date_ini", date_ini) :
                new ObjectParameter("date_ini", typeof(System.DateTime));
    
            var date_finParameter = date_fin.HasValue ?
                new ObjectParameter("date_fin", date_fin) :
                new ObjectParameter("date_fin", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_MonthResume_Result>("SP_MonthResume", investorIdParameter, date_iniParameter, date_finParameter);
        }
    
        public virtual ObjectResult<SP_PosicionAcciones_Result> SP_PosicionAcciones(Nullable<int> investorId)
        {
            var investorIdParameter = investorId.HasValue ?
                new ObjectParameter("InvestorId", investorId) :
                new ObjectParameter("InvestorId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_PosicionAcciones_Result>("SP_PosicionAcciones", investorIdParameter);
        }
    
        public virtual ObjectResult<SP_PosicionFondos_Result> SP_PosicionFondos(Nullable<int> investorId)
        {
            var investorIdParameter = investorId.HasValue ?
                new ObjectParameter("InvestorId", investorId) :
                new ObjectParameter("InvestorId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_PosicionFondos_Result>("SP_PosicionFondos", investorIdParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual ObjectResult<SP_ReturnEstructureNote_Result> SP_ReturnEstructureNote(string symbolFundFincome, Nullable<System.DateTime> positionDate)
        {
            var symbolFundFincomeParameter = symbolFundFincome != null ?
                new ObjectParameter("SymbolFundFincome", symbolFundFincome) :
                new ObjectParameter("SymbolFundFincome", typeof(string));
    
            var positionDateParameter = positionDate.HasValue ?
                new ObjectParameter("PositionDate", positionDate) :
                new ObjectParameter("PositionDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_ReturnEstructureNote_Result>("SP_ReturnEstructureNote", symbolFundFincomeParameter, positionDateParameter);
        }
    
        public virtual ObjectResult<SP_ReturnNoteEventCLN_Result> SP_ReturnNoteEventCLN(Nullable<int> fincomeId)
        {
            var fincomeIdParameter = fincomeId.HasValue ?
                new ObjectParameter("FincomeId", fincomeId) :
                new ObjectParameter("FincomeId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_ReturnNoteEventCLN_Result>("SP_ReturnNoteEventCLN", fincomeIdParameter);
        }
    
        public virtual ObjectResult<SP_ReturnNoteEventELN_Result> SP_ReturnNoteEventELN(Nullable<int> fincomeId)
        {
            var fincomeIdParameter = fincomeId.HasValue ?
                new ObjectParameter("FincomeId", fincomeId) :
                new ObjectParameter("FincomeId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_ReturnNoteEventELN_Result>("SP_ReturnNoteEventELN", fincomeIdParameter);
        }
    
        public virtual ObjectResult<SP_Subyacentes_Result> SP_Subyacentes(Nullable<int> fincomeId)
        {
            var fincomeIdParameter = fincomeId.HasValue ?
                new ObjectParameter("FincomeId", fincomeId) :
                new ObjectParameter("FincomeId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_Subyacentes_Result>("SP_Subyacentes", fincomeIdParameter);
        }
    
        public virtual ObjectResult<SP_TasaDescuentoNota_Result> SP_TasaDescuentoNota(Nullable<int> fincomeId)
        {
            var fincomeIdParameter = fincomeId.HasValue ?
                new ObjectParameter("FincomeId", fincomeId) :
                new ObjectParameter("FincomeId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_TasaDescuentoNota_Result>("SP_TasaDescuentoNota", fincomeIdParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual ObjectResult<string> spr_CopiaTabela(string origem, string destino, string tableName)
        {
            var origemParameter = origem != null ?
                new ObjectParameter("Origem", origem) :
                new ObjectParameter("Origem", typeof(string));
    
            var destinoParameter = destino != null ?
                new ObjectParameter("Destino", destino) :
                new ObjectParameter("Destino", typeof(string));
    
            var tableNameParameter = tableName != null ?
                new ObjectParameter("TableName", tableName) :
                new ObjectParameter("TableName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("spr_CopiaTabela", origemParameter, destinoParameter, tableNameParameter);
        }
    
        public virtual ObjectResult<getInvestorAccess_Result> getInvestorAccess(Nullable<int> user_id)
        {
            var user_idParameter = user_id.HasValue ?
                new ObjectParameter("user_id", user_id) :
                new ObjectParameter("user_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<getInvestorAccess_Result>("getInvestorAccess", user_idParameter);
        }
    }
}