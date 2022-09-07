<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestweb.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Entradas de Educación Financiera</h4>
                        <div class="card-header-action">
                            <asp:UpdatePanel ID="upSearch" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtSearch" placeholder="Buscar Entrada" onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <a href="BlogNew.aspx" runat="server" class="btn btn-light" style="margin-left: 20px">Nueva entrada
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="upTable" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="dgvTable" runat="server" CssClass="table table-hover table-pagination dataTable" AutoGenerateColumns="false" OnPageIndexChanging="dgvTable_PageIndexChanging" AllowPaging="true" PageSize="50"
                                    GridLines="None" AllowSorting="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Titulo" HeaderText="Titulo" />
                                        <asp:BoundField DataField="tags" HeaderText="Tags" />
                                        <asp:BoundField DataField="keywords" HeaderText="keywords" />
                                        <asp:BoundField DataField="created_at" HeaderText="Fecha" />
                                        <asp:TemplateField HeaderText="estado">
                                            <ItemTemplate>
                                                <span class='<%# Eval("estado").ToString() == "A" ? "badge bg-success":"badge bg-warning" %>' style="color: #fff">
                                                    <%# Eval("estado").ToString() == "A" ? "Activo":"Inactivo" %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false" style="float: right">
                                                    Options
                                                </button>
                                                <div class="dropdown-menu">
                                                    <asp:LinkButton ID="btnPublicar" runat="server" OnClick="btnPublicar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Publicar"><i class="fas fa-expand"></i> Publicar</asp:LinkButton></li>
                                                    <asp:LinkButton ID="btnDesactivar" runat="server" OnClick="btnDesactivar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Desactivar"><i class="fas fa-ban"></i> Desactivar</asp:LinkButton></li>
                                                    <div class="dropdown-divider"></div>
                                                    <asp:LinkButton ID="btnEditar" runat="server" OnClick="btnEditar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Detalle"><i class="far fa-save"></i> Editar</asp:LinkButton></li>
                                                    <asp:LinkButton ID="btnRemove" runat="server" OnClick="btnRemove_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Borrar"><i class="fas fa-trash"></i> Borrar</asp:LinkButton></li>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

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
