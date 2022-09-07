<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestapp.Reviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <div class="section-body">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Analisis de Notas</h4>
                        <div class="card-header-action">
                            <asp:UpdatePanel ID="upSearch" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtSearch" placeholder="Buscar Analisis" onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                           <a href="#" class="btn btn-light" data-toggle="modal" style="margin-left:20px"
                                data-target="#newModal">Nuevo analisis
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
                                        <asp:BoundField DataField="titulo" HeaderText="Titulo" />
                                       <asp:TemplateField HeaderText="Analisis">
                                            <ItemTemplate>
                                                <span>
                                                    <%# Eval("texto") %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="note_code" HeaderText="Codigo" />
                                        <asp:BoundField DataField="created_at" HeaderText="Fecha" />
                                        <asp:TemplateField HeaderText="estado">
                                            <ItemTemplate>
                                                <span class='<%# Eval("estado").ToString() == "A" ? "badge bg-success":"badge bg-warning" %>' style="color: #fff">
                                                    <%# Eval("estado").ToString() == "A" ? "Activo":"Inactivo" %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="pdf">
                                                    <ItemTemplate>
                                                        <a runat="server" target="_blank" id="pdf" href='<%# Eval("url") %>'>Ver PDF</a>
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
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Nuevo analsis</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upNewModal" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>titulo</label>
                                                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Analisis</label>
                                                <asp:TextBox ID="txtTexto" TextMode="MultiLine" Style="height: 150px !important" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                          <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Fecha Publicación</label>
                                                <asp:TextBox ID="txtFecha" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Analisis PDF</label>
                                                <asp:FileUpload ID="fuUrl" runat="server" CssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Código Nota Zest</label>
                                                <asp:TextBox ID="txtNotaZ" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12" align="right">
                                        <button data-dismiss="modal" aria-label="Close" class="btn btn-default" >Cancelar</button>
                                    <asp:Button ID="btnSaveNew" runat="server" Text="Guardar" OnClick="btnSaveNew_Click" CssClass="btn btn-light" />
                                </div>
                            </div>
                        </ContentTemplate>
                          <Triggers>
                        <asp:PostBackTrigger ControlID="btnSaveNew" />
                    </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>


     <!-- New modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Editar analsis</h5>
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
                                                <label>titulo</label>
                                                <asp:TextBox ID="txtTituloEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Analisis</label>
                                                <asp:TextBox ID="txtAnalisisEdit" TextMode="MultiLine" Style="height: 150px !important" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                         <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Fecha Publicación</label>
                                                <asp:TextBox ID="txtFechaEdit" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Analisis PDF</label>
                                                <asp:FileUpload ID="fuUrlEdit" runat="server" CssClass="form-control"/>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Código Nota Zest</label>
                                                <asp:TextBox ID="txtNotaEdit" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12" align="right">
                                        <button data-dismiss="modal" aria-label="Close" class="btn btn-default" >Cancelar</button>
                                    <asp:Button ID="btnSaveEdit" runat="server" Text="Guardar Noticia" OnClick="btnSaveEdit_Click" CssClass="btn btn-light" />
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
