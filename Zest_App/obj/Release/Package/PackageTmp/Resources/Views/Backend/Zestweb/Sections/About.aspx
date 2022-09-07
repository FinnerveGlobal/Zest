<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestweb.Sections.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
       <div class="section-body">
        <div class="row justify-content-md-center">
            <div class="col-8 col-md-8 col-lg-8">
                <div class="card"  style="background:rgba(255,255,255,0)">
                    <div class="card-header">
                        <h4>WEB Section - Nosotros</h4>
                        <div class="card-header-action">
                            <asp:UpdatePanel ID="upSearch" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtSearch" placeholder="Buscar Sección" onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                          
                        </div>
                    </div>
                    <div class="card-body">
                      
                        <asp:UpdatePanel ID="upTable" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="dgvTable" runat="server" CssClass="table table-pagination dataTable" AutoGenerateColumns="false" OnPageIndexChanging="dgvTable_PageIndexChanging" AllowPaging="true" PageSize="15"
                                    GridLines="None">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>

                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-2">
                                                                <asp:Image ID="Image1" ImageUrl='<%# Eval("preview") %>' runat="server" Style="width: 100%;" CssClass="same-height" />
                                                            </div>
                                                            <div class="col-10">
                                                                <b><%# Eval("nombre") %></b><br />
                                                                <p>
                                                                    <%# Eval("desc1")!=null? Eval("desc1").ToString():"" %>
                                                                </p>
                                                                  <p>
                                                                  <%# Eval("desc2")!=null? Eval("desc2").ToString():"" %>
                                                                </p>
                                                                  <p>
                                                                 <%# Eval("desc3")!=null? Eval("desc3").ToString():"" %>
                                                                </p>

                                                            </div>
                                                            <div style="position: absolute; right: 0; margin-right: 20px;">
                                                                <span class='<%# Eval("estado").ToString() == "A" ? "badge bg-success":"badge bg-warning" %>' style="color: #fff">
                                                                    <%# Eval("estado").ToString() == "A" ? "Activo":"Inactivo" %>
                                                                </span>

                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-whitesmoke">
                                                        <span style="float: left;font-size:10px">
                                                            <i class="far fa-clock"></i> <%# Eval("updated_at") %>
                                                        </span>
                                                        <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown"
                                                            aria-haspopup="true" aria-expanded="false" style="float: right">
                                                           Edit
                                                        </button>
                                                        <div class="dropdown-menu">
                                                            <asp:LinkButton ID="btnPublicar" runat="server" OnClick="btnPublicar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Publicar"><i class="fas fa-expand"></i> Publicar</asp:LinkButton></li>
                                                                    <asp:LinkButton ID="btnDesactivar" runat="server" OnClick="btnDesactivar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Desactivar"><i class="fas fa-ban"></i> Desactivar</asp:LinkButton></li>
                                                                    <div class="dropdown-divider"></div>
                                                            <asp:LinkButton ID="btnEditar" runat="server" OnClick="btnEditar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Editar"><i class="far fa-save"></i> Editar</asp:LinkButton></li>
                                                                    <asp:LinkButton ID="btnRemove" runat="server" OnClick="btnRemove_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Borrar"><i class="fas fa-trash"></i> Borrar</asp:LinkButton></li>
                                                        </div>
                                                    </div>
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
