<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="NewsUpload.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestapp.NewsUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row justify-content-md-center">
            <div class="col-md-4 col-lg-3">
                <div class="card">
                    <div class="card-header">
                        <h4>Cargar Archivo de noticias</h4>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="upUpload" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        <asp:Button ID="btnUpload" runat="server" Text="Cargar" CssClass="btn btn-primary my-3 btn-block" OnClick="btnUpload_Click"/>
                                    </div>
                                    <div class="col-md-12">

                                        <asp:Label ID="Label1" runat="server" Text="Tiene encabezado ?" />
                                        <asp:RadioButtonList ID="rbHDR" runat="server">
                                            <asp:ListItem Text="Yes" Value="Yes" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnUpload" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-lg-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Lineas Cargadas</h4>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="upTable" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Insertar</label>
                                            <asp:Button ID="btnInsert" CssClass="btn btn-primary" Width="100%" runat="server" Text="Insertar Solicitudes" OnClientClick="return confirm('Seguro de Insertar?');" OnClick="btnInsert_Click"/>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="dgvTable" runat="server" CssClass="table table-pagination dataTable" OnPageIndexChanging="dgvTable_PageIndexChanging" AllowPaging="true" PageSize="15"
                                                GridLines="None">
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnUpload" />
                            </Triggers>
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
