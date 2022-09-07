<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="Titulos.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestweb.Sections.Titulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12 justify-content-md-center">
                <div class="card">
                    <div class="card-header">
                        <h4>Editar Cifras</h4>
                        
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="upTable" runat="server">
                            <ContentTemplate>
                               <div class="row">
                                   <div class="col-md-3">
                                       <div class="form-group">
                                           <label>Volumen de inversión</label>
                                           <asp:TextBox ID="txtVolumen" CssClass="form-control" runat="server"></asp:TextBox>
                                       </div>
                                       <br />
                                       <div class="form-group">
                                           <asp:LinkButton ID="btnSaveV" CssClass="btn btn-block btn-primary" OnClick="btnSaveV_Click" runat="server">Editar Volumen</asp:LinkButton>
                                       </div>
                                   </div>
                                     <div class="col-md-3">
                                       <div class="form-group">
                                           <label>Intereses Pagados</label>
                                           <asp:TextBox ID="txtIntereses" CssClass="form-control" runat="server" ></asp:TextBox>
                                       </div>
                                       <br />
                                       <div class="form-group">
                                           <asp:LinkButton ID="btnSaveI" CssClass="btn btn-block btn-primary" OnClick="btnSaveI_Click" runat="server">Editar Intereses</asp:LinkButton>
                                       </div>
                                   </div>
                                    <div class="col-md-3">
                                       <div class="form-group">
                                           <label>Títulos</label>
                                           <asp:TextBox ID="txtTitulos" CssClass="form-control" runat="server" ></asp:TextBox>
                                       </div>
                                       <br />
                                       <div class="form-group">
                                           <asp:LinkButton ID="btnSaveT" CssClass="btn btn-block btn-primary" OnClick="btnSaveT_Click" runat="server">Editar Títulos</asp:LinkButton>
                                       </div>
                                   </div>
                                     <div class="col-md-3">
                                       <div class="form-group">
                                           <label>Fecha de actualización</label>
                                           <asp:TextBox ID="txtFecha" CssClass="form-control" runat="server" ></asp:TextBox>
                                       </div>
                                       <br />
                                       <div class="form-group">
                                           <asp:LinkButton ID="btnSaveFecha" CssClass="btn btn-block btn-primary" OnClick="btnSaveFecha_Click" runat="server">Editar Fecha</asp:LinkButton>
                                       </div>
                                   </div>
                               </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Modal" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
