<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="Faqs.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestweb.Faqs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card" style="background: rgba(255,255,255,0)">
                    <div class="card-header">
                        <h4>FAQs</h4>
                        <div class="card-header-action">
                            <asp:UpdatePanel ID="upSearch" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtSearch" placeholder="Buscar" onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                    <div class="card-body">
                          <a class="col-md-12 bg-white text-center" style="padding:20px;display:block;cursor:pointer;border-radius:10px" data-toggle="modal" data-target="#newModal">
                            <i class="far fa-plus-square" style="font-size:25px;"></i>
                        </a>
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
                                        <asp:BoundField DataField="question" HeaderText="Pregunta" />
                                        <asp:BoundField DataField="answer" HeaderText="Respuesta" />
                                        <asp:TemplateField HeaderText="estado">
                                            <ItemTemplate>
                                                <span class='<%# Eval("estado").ToString() == "A" ? "badge bg-success":"badge bg-warning" %>' style="color: #fff">
                                                    <%# Eval("estado").ToString() == "A" ? "Activo":"Inactivo" %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false" style="float: right">
                                                    <i class="fas fa-bars"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <asp:LinkButton ID="btnPublicar" runat="server" OnClick="btnPublicar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Publicar"><i class="fas fa-expand"></i> Publicar</asp:LinkButton>
                                                    <asp:LinkButton ID="btnDesactivar" runat="server" OnClick="btnDesactivar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Desactivar"><i class="fas fa-ban"></i> Desactivar</asp:LinkButton>
                                                    <div class="dropdown-divider"></div>
                                                    <asp:LinkButton ID="btnEditar" runat="server" OnClick="btnEditar_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Detalle"><i class="far fa-save"></i> Editar</asp:LinkButton>
                                                    <asp:LinkButton ID="btnRemove" runat="server" OnClick="btnRemove_Click" CssClass="dropdown-item" CommandArgument='<%# Bind("id", "{0}") %>' title="Borrar"><i class="fas fa-ban"></i> Eliminar </asp:LinkButton>
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
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog" 
        aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nueva Pregunta Frecuente</h5>
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
                                                <label>Pregunta</label>
                                                <asp:TextBox ID="txtPregunta" runat="server" CssClass="form-control"></asp:TextBox>
                                      </div>
                                      <div class="form-group">
                                                <label>Respuesta</label>
                                                <asp:TextBox ID="txtRespuesta" TextMode="MultiLine" runat="server" CssClass="form-control" Style="height: 150px !important"></asp:TextBox>
                                      </div>
                                    <div class="form-group">
                                 
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
                    <h5 class="modal-title">Editar Pregunta Frecuente</h5>
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
                                                <label>Pregunta</label>
                                                <asp:TextBox ID="txtPreguntaEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                      </div>
                                      <div class="form-group">
                                                <label>Respuesta</label>
                                                <asp:TextBox ID="txtRespuestaEdit" TextMode="MultiLine" runat="server" CssClass="form-control" Style="height: 150px !important"></asp:TextBox>
                                      </div>
                                    <div class="form-group">
                                 
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
