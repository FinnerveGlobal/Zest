<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="Publi25k1k.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestweb.Aboutus.Publi25k1k" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row justify-content-md-center">
            <div class="col-5 col-md-5 col-lg-5">
                <div class="card" style="background: rgba(255,255,255,0)">
                    <div class="card-header">
                        <h4>25k1k Text</h4>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="up25k1k" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Titulo</label>
                                            <asp:TextBox ID="txtGenTitle" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                     <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Texto</label>
                                            <asp:TextBox ID="txtGenDesc" TextMode="MultiLine" style="height:200px !important" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                <div class="col-md-12" align="right">
                                    <asp:Button ID="btnSaveGen" runat="server" Text="Guardar" OnClick="btnSaveGen_Click" CssClass="btn btn-light" />
                                </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="col-7 col-md-7 col-lg-7">
                <div class="card" style="background: rgba(255,255,255,0)">
                    <div class="card-header">
                        <h4>25k1k Publicaciones</h4>
                        <div class="card-header-action">
                            <asp:UpdatePanel ID="upSearch" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtSearch" placeholder="Buscar" onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                    <div class="card-body">
                        <a class="col-md-12 bg-white text-center" style="padding: 20px; display: block; cursor: pointer; border-radius: 10px" data-toggle="modal" data-target="#newModal">
                            <i class="far fa-plus-square" style="font-size: 25px;"></i>
                        </a>
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
                                                            <div class="col-2" style="display: flex">
                                                                <i class="<%# Eval("rrss") %>" style="font-size: 35px; margin: auto"></i>
                                                            </div>
                                                            <div class="col-10">
                                                                <b><%# Eval("titulo") %></b><br />
                                                                <p>
                                                                    <%# Eval("descripcion").ToString() %>
                                                                    <br />
                                                                    <b>
                                                                        <%# Eval("cta") %>
                                                                    </b>
                                                                </p>

                                                            </div>
                                                            <div style="position: absolute; right: 0; margin-right: 20px;">
                                                                <span class='<%# Eval("estado").ToString() == "A" ? "badge bg-success":"badge bg-warning" %>' style="color: #fff">
                                                                    <%# Eval("estado").ToString() == "A" ? "Publicado":"Inactivo" %>
                                                                </span>
                                                                <span class='<%# Eval("prioridad").ToString() == "1" ? "badge bg-success":Eval("prioridad").ToString() == "2" ? "badge bg-warning":"badge bg-danger"%>' style="color: #fff">
                                                                    <%# Eval("prioridad") %>
                                                                </span>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-whitesmoke">
                                                        <span style="float: left; font-size: 10px">
                                                            <i class="far fa-clock"></i><%# Eval("created_at") %>
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
                        <a class="col-md-12 bg-white text-center" style="padding: 20px; display: block; cursor: pointer; border-radius: 10px" data-toggle="modal" data-target="#newModal">
                            <i class="far fa-plus-square" style="font-size: 25px;"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Modal" runat="server">
    <!-- New modal -->
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nueva Publicación</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upNewImage" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Red Social</label>
                                        <asp:DropDownList ID="ddlRRSS" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="fab fa-instagram" Text="Instagram"></asp:ListItem>
                                            <asp:ListItem Value="fab fa-linkedin" Text="Linkedin"></asp:ListItem>
                                            <asp:ListItem Value="fab fa-twitter-square" Text="Twitter"></asp:ListItem>
                                            <asp:ListItem Value="fab fa-facebook-square" Text="Facebook"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Descripción</label>
                                        <asp:TextBox ID="txtDesc" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Prioridad</label>
                                        <asp:DropDownList ID="ddlPrioridad" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="1"></asp:ListItem>
                                            <asp:ListItem Value="2"></asp:ListItem>
                                            <asp:ListItem Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label>Call to Action</label>
                                        <asp:TextBox ID="txtCta" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12" align="right">
                                    <button data-dismiss="modal" aria-label="Close" class="btn btn-default">Cancelar</button>
                                    <asp:Button ID="btnSaveNew" runat="server" Text="Guardar" OnClick="btnSaveNew_Click" CssClass="btn btn-light" />
                                </div>
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <!-- edit modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar Publicación</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Red Social</label>
                                        <asp:DropDownList ID="ddlRRssEdit" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="fab fa-instagram" Text="Instagram"></asp:ListItem>
                                            <asp:ListItem Value="fab fa-linkedin" Text="Linkedin"></asp:ListItem>
                                            <asp:ListItem Value="fab fa-twitter-square" Text="Twitter"></asp:ListItem>
                                            <asp:ListItem Value="fab fa-facebook-square" Text="Facebook"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <asp:TextBox ID="txtTituloEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Descripción</label>
                                        <asp:TextBox ID="txtDescEdit" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label>Prioridad</label>
                                        <asp:DropDownList ID="ddlPrioridadEdit" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="1"></asp:ListItem>
                                            <asp:ListItem Value="2"></asp:ListItem>
                                            <asp:ListItem Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label>Call to Action</label>
                                        <asp:TextBox ID="txtCtaEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12" align="right">
                                    <button data-dismiss="modal" aria-label="Close" class="btn btn-default">Cancelar</button>
                                    <asp:Button ID="btnSaveEdit" runat="server" Text="Guardar" OnClick="btnSaveEdit_Click" CssClass="btn btn-light" />
                                </div>
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
    <script>  
        function close_new() {
            $("#newModal").modal('hide');
        }

        function open_edit() {
            $("#editModal").modal('show');
        }
        function close_edit() {
            $("#editModal").modal('hide');
        }

    </script>
</asp:Content>
