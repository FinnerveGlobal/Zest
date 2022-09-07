<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Profile.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row mt-sm-4">
            <div class="col-12 col-md-12 col-lg-4">
                <div class="card author-box">
                    <div class="card-body">
                        <div class="author-box-center">
                            <asp:Image ID="imgProfile" AlternateText="Profile" CssClass="rounded-circle author-box-picture" runat="server" />
                            <div class="clearfix"></div>
                            <div class="author-box-name">
                                <a href="#">
                                    <asp:Literal ID="ltProfileName" runat="server"></asp:Literal>
                                </a>
                            </div>
                            <div class="author-box-job">
                                <asp:Literal ID="ltProfileRol" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h4>Detalles</h4>
                    </div>
                    <div class="card-body">
                        <div class="py-4">
                            <p class="clearfix">
                                <span class="float-left">Email
                                </span>
                                <span class="float-right text-muted">
                                    <asp:Literal ID="ltProfileEmail" runat="server"></asp:Literal>
                                </span>
                            </p>
                            <p class="clearfix">
                                <span class="float-left">Fecha Creación
                                </span>
                                <span class="float-right text-muted">
                                    <asp:Literal ID="ltProfileCreated" runat="server"></asp:Literal>
                                </span>
                            </p>

                        </div>
                    </div>
                </div>

            </div>
            <div class="col-12 col-md-12 col-lg-8">
                <div class="card">
                    <div class="padding-20">
                        <ul class="nav nav-tabs" id="myTab2" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab2" data-toggle="tab" href="#about" role="tab"
                                    aria-selected="true">Editar Perfil</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab2" data-toggle="tab" href="#log" role="tab"
                                    aria-selected="false">Log</a>
                            </li>
                        </ul>
                        <div class="tab-content tab-bordered" id="myTab3Content">
                            <div class="tab-pane fade show active" id="about" role="tabpanel" aria-labelledby="home-tab2">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="card-header">
                                            <h4>Editar Perfil</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Nombre</label>
                                                    <asp:TextBox ID="txtProfileName" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Rol</label>
                                                    <asp:TextBox ID="txtProfileRol" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-12 col-12">
                                                    <label>Email</label>

                                                    <asp:TextBox ID="txtProfileEmail" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-12 col-12">
                                                    <label>Seleccione imagen</label>
                                                    <div class="input-group">
                                                        <span class="input-group-btn"></span>
                                                        <asp:FileUpload ID="fuImagen" CssClass=" form-control" Style="width: 100%; height: auto;" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer text-right">
                                            <asp:Button ID="btnSave" runat="server" Text="Guardar Cambios" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                        </div>
                                        <div class="card-header">
                                            <h4>Editar Contraseña</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Antigua Contraseña</label>
                                                    <asp:TextBox ID="txtOldpass" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Nueva Contraseña</label>
                                                    <asp:TextBox ID="txtNewpass" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer text-right">
                                            <asp:Button ID="btnSavePass" runat="server" Text="Cambiar Contraseña" CssClass="btn btn-primary" OnClick="btnSavePass_Click" />
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnSave" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="tab-pane fade" id="log" role="tabpanel" aria-labelledby="profile-tab2">
                            </div>
                        </div>
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
