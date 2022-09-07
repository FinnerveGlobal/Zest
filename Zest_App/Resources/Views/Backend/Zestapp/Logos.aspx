<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="Logos.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestapp.Logos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Logos de Activos</h4>
                        <div class="card-header-action">
                            <asp:UpdatePanel ID="upSearch" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtSearch" placeholder="Buscar ..." onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Simbolo</label>
                                    <asp:TextBox ID="txtSymbolNew" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Descripción</label>
                                    <asp:TextBox ID="txtDescNew" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                    <label>Guardar</label><br />
                                <asp:LinkButton ID="btnSaveNewLogo" runat="server" OnClick="btnSaveNewLogo_Click" CssClass="btn btn-primary"><i class="fas fa-save"></i></asp:LinkButton>
                            </div>
                        </div>
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
                                        <asp:BoundField DataField="asset_code" HeaderText="Simbolo" />
                                        <asp:BoundField DataField="asset_name" HeaderText="Descripción" />
                                        <asp:TemplateField HeaderText="estado">
                                            <ItemTemplate>
                                                <span class='<%# Eval("estado").ToString() == "A" ? "badge bg-success":"badge bg-warning" %>' style="color: #fff">
                                                    <%# Eval("estado").ToString() == "A" ? "Activo":"Inactivo" %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="img">
                                            <ItemTemplate>
                                                <div style="background: #141414; width: 150px; height: 150px; border-radius: 10px; display: flex">
                                                    <div style="margin: auto; width: 100px">
                                                        <img src='<%# Eval("img_url") %>' style="width: 100%; border: none; background: #141414" />
                                                    </div>
                                                </div>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false" style="float: right">
                                                    <i class="fas fa-bars"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <asp:LinkButton ID="btnPublicar" runat="server" OnClick="btnPublicar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Publicar"><i class="fas fa-expand"></i> Publicar</asp:LinkButton></li>
                                                    <asp:LinkButton ID="btnDesactivar" runat="server" OnClick="btnDesactivar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Desactivar"><i class="fas fa-ban"></i> Desactivar</asp:LinkButton></li>
                                                    <div class="dropdown-divider"></div>
                                                    <asp:LinkButton ID="btnEditar" runat="server" OnClick="btnEditar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Editar"><i class="far fa-save"></i> Editar</asp:LinkButton></li>
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

    <!-- New modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar logo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Simbolo</label>
                                                <asp:TextBox ID="txtSymbolEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Descripción</label>
                                                <asp:TextBox ID="txtDescEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Logo</label>
                                                <asp:FileUpload ID="fuLogoEdit" CssClass="form-control" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12" align="right">
                                    <button data-dismiss="modal" aria-label="Close" class="btn btn-default">Cancelar</button>
                                    <asp:Button ID="btnSaveEdit" runat="server" Text="Guardar" OnClick="btnSaveEdit_Click" CssClass="btn btn-light" />
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnSaveEdit" />
                        </Triggers>
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
