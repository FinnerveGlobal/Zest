<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="List.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Leads.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <div class="section-body">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card" style="background: rgba(255,255,255,0)">
                    <div class="card-header">
                        <h4>Web Zest Leads</h4>
                        <div class="card-header-action">
                            <asp:UpdatePanel ID="upSearch" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlEstado" CssClass="form-control" Width="200" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged" style="padding: 0px 10px;height: 30px;">
                                        <asp:ListItem Value="A">Nuevos</asp:ListItem>
                                        <asp:ListItem Value="D">Descargados</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txtSearch" placeholder="Buscar" onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                    
                                    <asp:LinkButton ID="btnExport" CssClass="btn btn-light" OnClick="btnExport_Click" runat="server">Exportar</asp:LinkButton>
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                                        <asp:BoundField DataField="updated_at" HeaderText="Fecha" />
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                        <asp:BoundField DataField="apellido" HeaderText="Apellido" />
                                        <asp:BoundField DataField="email" HeaderText="Email" />
                                        <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                                        <asp:BoundField DataField="mensaje" HeaderText="Mensaje" />
                                        <asp:TemplateField HeaderText="estado">
                                            <ItemTemplate>
                                                <span class='<%# Eval("estado").ToString() == "A" ? "badge bg-success": Eval("estado").ToString() == "D" ? "badge bg-blue":"badge bg-warning" %>' style="color: #000">
                                                    <%# Eval("estado").ToString() == "A" ? "Nuevo": (Eval("estado").ToString() == "D" ? "Descargado" : "Inactivo") %>
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
