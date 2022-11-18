<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="CatalogFunds_item.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestapp.CatalogFunds_item" %>

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
                        <h4>Servicio Zest App: Nuevo Fondo</h4>
                        <div class="card-header-action">
                        </div>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="upForm" runat="server">
                            <ContentTemplate>
                                <div class="row">
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
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 text-right">
                                        <a href="CatalogFunds.aspx" runat="server" class="btn btn-default" style="float: left">Cancelar</a>
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
