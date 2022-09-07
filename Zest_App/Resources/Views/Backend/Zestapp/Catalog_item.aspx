<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="Catalog_item.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestapp.Catalog_item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        #pexel_images {
            width: 100%;
            display: inline-flex;
        }

            #pexel_images img {
                width: 100%;
                max-width: 150px;
                margin: auto;
                cursor: pointer;
                border: 5px solid #d5b904;
                border-top-left-radius: 15px;
            }

        #logo_image {
            width: 100%;
            display: inline-flex;
        }

            #logo_image img {
                width: 100%;
                max-width: 150px;
                margin: auto;
                cursor: pointer;
                border: 5px solid #d5b904;
                border-top-left-radius: 15px;
            }

        #pexel_images img:hover {
            opacity: .7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Servicio Zest App</h4>
                        <div class="card-header-action">
                        </div>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="upForm" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-6" style="border-right: 1px solid #e1e1e1">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Código Nota</label>
                                                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>ISIN</label>
                                                    <asp:TextBox ID="txtIsin" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Vencimiento</label>
                                                    <asp:TextBox ID="txtVencimiento" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                 <div class="form-group">
                                                    <label>Limite Ingreso</label>
                                                    <asp:TextBox ID="txtLimite" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
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
                                                    <label>Rentabilidad Cupón</label>
                                                    <asp:TextBox ID="txtRentabilidad" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                             <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Barrera Capital</label>
                                                    <asp:TextBox ID="txtBarreraCapital" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                             <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Barrera Cupón</label>
                                                    <asp:TextBox ID="txtBarrera" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Emisor</label>
                                                    <asp:TextBox ID="txtEmisor" runat="server" CssClass="form-control"></asp:TextBox>
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
                                                    <label>Info adicional</label>
                                                    <asp:TextBox ID="txtAdicional" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Descripción</label>
                                                    <asp:TextBox ID="txtDesc" TextMode="MultiLine" Style="height: 100px !important" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Logo</label>
                                                <div class="form-group">
                                                    <div class="input-group mb-3">
                                                        <asp:TextBox ID="txtPexel" runat="server" CssClass="form-control" placeholder="Buscar Logo"></asp:TextBox>
                                                        <div class="input-group-append">
                                                            <asp:Button ID="btnSearchLogo" CssClass="btn btn-primary" runat="server" Text="Buscar" OnClick="btnSearchLogo_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="pexel_images">
                                                </div>
                                                <asp:TextBox ID="txtLogoImg" Style="display: none" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Nombre Asset</label>
                                                    <asp:TextBox ID="txtNombreAsset" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label>Descripción Asset</label>
                                                    <asp:TextBox ID="txtDescAsset" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-12 text-right">
                                                <asp:Button ID="btnAdd" CssClass="btn btn-warning" runat="server" Text="Añadir" OnClick="btnAdd_Click" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:GridView ID="dgvTable" runat="server" CssClass="table table-hover table-pagination dataTable" AutoGenerateColumns="false"
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
                                                                <asp:LinkButton ID="btnRemove" runat="server" OnClick="btnRemove_Click" CommandArgument='<%# Container.DataItemIndex %>' title="Editar"><i class="fas fa-trash"></i></asp:LinkButton></li>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 text-right">
                                        <a href="Catalog.aspx" runat="server" class="btn btn-default" style="float: left">Cancelar</a>
                                        <asp:Button ID="btnSave" CssClass="btn btn-warning" runat="server" Text="Guardar" OnClick="btnSave_Click"/>
                                    </div>
                                </div>
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
    <div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Buscar logo desde dominio</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upimgModal" runat="server">
                        <ContentTemplate>
                            <div class="col-md-12">
                                <label>Logo</label>
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <asp:TextBox ID="txtSearchTmp" CssClass="form-control" placeholder="Buscar Logo" runat="server"></asp:TextBox>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button" onclick="searchLogo()">Buscar</button>
                                        </div>
                                    </div>
                                </div>
                                <div id="logo_image">
                                </div>
                                <label>o Pega el url de tu logo aquí</label>
                                <asp:TextBox ID="txtLogoTmp" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-12 text-right">
                                <asp:Button ID="btnSaveNewImg" CssClass="btn btn-warning" OnClick="btnSaveNewImg_Click" runat="server" Text="Guardar" />
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
        var api_key = "";
        var search = "";


        function imageSearch(searchTmp) {
            closeImgModal();
            $("#pexel_images").html("");

            console.log(searchTmp);
            image = `
                            <img src="${searchTmp}" class="pexel_item">
                        `;
            $("#pexel_images").append(image);

        }

        function openImgModal() {
            $("#imgModal").modal('show');
        }
        function closeImgModal() {
            $("#imgModal").modal('hide');
        }

        function searchLogo() {
            search = $("#Modal_txtSearchTmp").val();
            api_key = "rvGIqQ2QcN7OTlmAFMTE15nzvm3Suj4V96Qv62w5";
            $("#logo_image").html("");

            $.ajax({
                method: 'POST',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("x-api-key", api_key)
                },
                data: JSON.stringify({ domain: search }),
                contentType: 'application/json',
                url: 'https://api.brandfetch.io/v1/logo',
                success: function (data) {
                    console.log(data.response.logo.image);

                    image = `
                              <img src="${data.response.logo.image}" class="pexel_item">
                          `;
                    $("#logo_image").append(image);
                    $("#Modal_txtLogoTmp").val(data.response.logo.image);
                },
                error: function (error) {
                    console.log(error);
                }
            });

        }

    </script>
</asp:Content>
