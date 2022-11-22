<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="CatalogFunds.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestapp.CatalogFunds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Servicios Zest App: Fondos</h4>
                        <div class="card-header-action">
                             <asp:UpdatePanel ID="upSearch" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtSearch" placeholder="Buscar Fondo" onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <a href="CatalogFunds_item.aspx" runat="server" class="btn btn-light" style="margin-left:20px">Nuevo Fondo
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="upTable" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="dgvTable" runat="server" CssClass="table table-hover table-pagination dataTable" AutoGenerateColumns="false" OnPageIndexChanging="dgvTable_PageIndexChanging" AllowPaging="true" PageSize="20"
                                    GridLines="None">
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="codigo_fondo" SortExpression="codigo_fondo" HeaderText="código" />                                       
                                        <asp:TemplateField SortExpression="inv_minima" HeaderText="inversión mínima">
                                            <ItemTemplate>
                                                <%# ((Double)Eval("inv_minima")).ToString("N2") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="gestor" SortExpression="gestor" HeaderText="gestor" />
                                        <asp:BoundField DataField="administrador" SortExpression="administrador" HeaderText="administrador" />
                                        <asp:BoundField DataField="auditor" SortExpression="auditor" HeaderText="auditor" />
                                        <asp:BoundField DataField="custodio" SortExpression="custodio" HeaderText="custodio" />
                                        <asp:BoundField DataField="riesgo" SortExpression="riesgo" HeaderText="riesgo" />
                                        <asp:TemplateField HeaderText="moneda" SortExpression="moneda">
                                            <ItemTemplate>
                                                <i class="fas fa-money-bill text-success"></i><%# "  "+Eval("moneda").ToString() %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="estado">
                                            <ItemTemplate>
                                                <span class='<%# Eval("estado").ToString() == "A" ? "badge bg-success":"badge bg-warning" %>' style="color: #fff">
                                                    <%# Eval("estado").ToString() == "A" ? "Publicado":"Inactivo" %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="pdf">
                                            <ItemTemplate>
                                                <a runat="server" target="_blank" id="pdf" href='<%# "/newsfile/" + Eval("nombre_archivo") %>'>Ver PDF</a>
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

    
    <!-- Edit modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar Servicio</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upEditModal" runat="server">
                        <ContentTemplate>
                            <div class="row" style="margin-top: 15px">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Código Fondo</label>
                                                <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Inversión Mínima</label>
                                                <asp:TextBox ID="txtInversion" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Moneda</label>
                                                <asp:DropDownList ID="ddlMoneda" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="USD"></asp:ListItem>
                                                    <asp:ListItem Value="PEN"></asp:ListItem>
                                                    <asp:ListItem Value="EUR"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Gestor</label>
                                                <asp:TextBox ID="txtGestor" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                            <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Administrador</label>
                                                <asp:TextBox ID="txtAdministrador" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                            <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Auditor</label>
                                                <asp:TextBox ID="txtAuditor" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Custodio</label>
                                                <asp:TextBox ID="txtCustodio" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Riesgo</label>
                                                <asp:TextBox ID="txtRiesgo" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Archivo</label><br />
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Descripción</label>
                                                <asp:TextBox ID="txtDesc" TextMode="MultiLine" Style="height: 100px !important" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="col-md-12" align="right">
                                    <button data-dismiss="modal" aria-label="Close" class="btn btn-default">Cancelar</button>
                                    <asp:Button ID="btnSaveEdit" runat="server" Text="Guardar Cambios" OnClick="btnSaveEdit_Click" CssClass="btn btn-light" />
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

    <!-- New modal -->
    <%--<div class="modal fade" id="detailModal" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Detalle</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="updetailModal" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                     <a href="#" class="btn btn-light" data-toggle="modal" style="margin-left:20px"
                                        data-target="#newDetModal">Nuevo activo
                                    </a>
                                </div>
                                <div class="col-md-12">
                                    <asp:GridView ID="dgvDetalle" runat="server" CssClass="table table-hover table-pagination dataTable" AutoGenerateColumns="false"
                                        GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="nombre" SortExpression="nombre" HeaderText="nombre" />
                                            <asp:TemplateField HeaderText="Descripcion">
                                                <ItemTemplate>
                                                    <b><%# Eval("nombre") %></b><br />
                                                    <span>
                                                        <%# Eval("adicional") %>
                                                    </span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-Width="100" ItemStyle-Width="100">
                                                <ItemTemplate>

                                                    <asp:Image ID="img_asset" runat="server" ImageUrl='<%# Eval("url_imt") %>' Style="width: 35px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField>
                                            <ItemTemplate>


                                                <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false" style="float: right">
                                                    Options
                                                </button>
                                                <div class="dropdown-menu">
                                                    <asp:LinkButton ID="btnEditarDet" runat="server" OnClick="btnEditarDet_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Detalle"><i class="far fa-save"></i> Editar</asp:LinkButton></li>
                                                    <asp:LinkButton ID="btnRemoveDet" runat="server" OnClick="btnRemoveDet_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Borrar"><i class="fas fa-trash"></i> Borrar</asp:LinkButton></li>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>--%>


     <%--<div class="modal fade" id="newDetModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Nuevo Activo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upNewModalDet" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                         <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Imagen <br /><span>Pega tu url aquí</span></label>
                                                <asp:TextBox ID="txtImagen" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Adicional</label>
                                                <asp:TextBox ID="txtTexto" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="col-md-12" align="right">
                                        <button data-dismiss="modal" aria-label="Close" class="btn btn-default" >Cancelar</button>
                                    <asp:Button ID="btnSaveNewDet" runat="server" Text="Guardar" OnClick="btnSaveNewDet_Click" CssClass="btn btn-light" />
                                </div>
                            </div>
                        </ContentTemplate>
                         
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>--%>

    <%--<div class="modal fade" id="editDetModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Editar Activo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                         <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Imagen <br /><span>Pega tu url aquí</span></label>
                                                <asp:TextBox ID="txtImagenEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Nombre</label>
                                                <asp:TextBox ID="txtTituloEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Adicional</label>
                                                <asp:TextBox ID="txtTextoEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="col-md-12" align="right">
                                        <button data-dismiss="modal" aria-label="Close" class="btn btn-default" >Cancelar</button>
                                    <asp:Button ID="btnSaveEditDet" runat="server" Text="Guardar" OnClick="btnSaveEditDet_Click" CssClass="btn btn-light" />
                                </div>
                            </div>
                        </ContentTemplate>
                         
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>--%>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
    <script>
        function openDetail() {
            $("#detailModal").modal('show');
        }

        function open_edit() {
            $("#editModal").modal('show');
        }
        function close_edit() {
            $("#editModal").modal('hide');
        }

        function open_edit_det() {
            $("#editDetModal").modal('show');
        }
        function close_edit_det() {
            $("#editDetModal").modal('hide');
        }
        function close_new_det() {
            $("#newDetModal").modal('hide');
        }
    </script>
</asp:Content>
