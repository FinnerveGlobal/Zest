<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestapp.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        #pexel_images {
            width: 100%;
        }

            #pexel_images img {
                width: 100px;
                height: 100px;
                margin: auto;
                cursor: pointer;
            }

                #pexel_images img:hover {
                    opacity: .7;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
     <div class="row justify-content-md-center">
            <div class="col-8 col-md-8 col-lg-8">
                <div class="card" style="background:rgba(255,255,255,0)">
                    <div class="card-header">
                        <h4>Noticias Zest App</h4>
                        <div class="card-header-action">
                            <asp:UpdatePanel ID="upSearch" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtSearch" placeholder="Buscar Noticias" onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
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
                                <asp:GridView ID="dgvTable" runat="server" CssClass="table table-pagination dataTable" AutoGenerateColumns="false" OnPageIndexChanging="dgvTable_PageIndexChanging" AllowPaging="true" PageSize="6"
                                    GridLines="None">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>

                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-2">
                                                                <asp:Image ID="Image1" ImageUrl='<%# Eval("url_img") %>' runat="server" Style="width: 100%;" CssClass="same-height" />
                                                            </div>
                                                            <div class="col-10">
                                                                <b><%# Eval("titular") %></b><br />
                                                                <p>
                                                                    <%# Eval("descripcion").ToString() %>...
                                                                </p>

                                                            </div>
                                                            <div style="position: absolute; right: 0; margin-right: 20px;">
                                                                <span class='<%# Eval("estado").ToString() == "A" ? "badge bg-success":"badge bg-warning" %>' style="color: #fff">
                                                                    <%# Eval("estado").ToString() == "A" ? "Publicado":"Inactivo" %>
                                                                </span>
                                                                   <span class='<%# Eval("web_mobile").ToString() == "web,mobile" ? "badge bg-blue":"badge bg-secondary" %>' style="color: #fff">
                                                                    <%# Eval("web_mobile").ToString() %>
                                                                </span>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-whitesmoke">
                                                        <span style="float: left;font-size:10px">
                                                            <i class="far fa-clock"></i> <%# Eval("created_at") %>
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
                         <a class="col-md-12 bg-white text-center" style="padding:20px;display:block;cursor:pointer;border-radius:10px" data-toggle="modal" data-target="#newModal">
                            <i class="far fa-plus-square" style="font-size:25px;"></i>
                        </a>
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
                    <h5 class="modal-title">Nueva Noticia</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upNewModal" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Miniatura</label>
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" id="txtPexel" placeholder="Buscar miniatura" aria-label="">
                                            <div class="input-group-append">
                                                <button class="btn btn-light" type="button" onclick="search_pexel()">Buscar</button>
                                            </div>
                                        </div>
                                        <div style="display: inline-flex">
                                            <a href="#" onclick="pexel_prev()"><i class="fas fa-chevron-left"></i></a>
                                            <span id="pexel_index" style="padding: 0px 5px">1</span>
                                            <a href="#" onclick="pexel_next()"><i class="fas fa-chevron-right"></i></a>
                                        </div>
                                    </div>

                                    <div id="pexel_images">
                                    </div>
                                     <label>O pega la URL de tu imagen aqui</label>
                                    <asp:TextBox ID="txtMiniatura" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 15px">
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Etiqueta</label>
                                                <asp:TextBox ID="txtTags" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Titular</label>
                                                <asp:TextBox ID="txtTitular" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Noticia</label>
                                                <asp:TextBox ID="txtNoticia" TextMode="MultiLine" Style="height: 230px !important" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Call to Action</label>
                                                <asp:TextBox ID="txtCTA" runat="server" CssClass="form-control"></asp:TextBox>
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
                                                <label>Publicar en</label>
                                                <asp:DropDownList ID="ddlPublicar" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="mobile">App</asp:ListItem>
                                                    <asp:ListItem Value="web">Web</asp:ListItem>
                                                    <asp:ListItem Value="web,mobile">App y Web</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Categoria</label>
                                                <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="ZEST"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12" style="display:none">
                                            <div class="form-group">
                                                <label>Código Nota Zest</label>
                                                <asp:TextBox ID="txtNota" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12" align="right">
                                    <button data-dismiss="modal" aria-label="Close" class="btn btn-default">Cancelar</button>
                                    <asp:Button ID="btnSaveNew" runat="server" Text="Guardar Noticia" OnClick="btnSaveNew_Click" CssClass="btn btn-light" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>



    <!-- Edit modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar Noticia</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upEditModal" runat="server">
                        <ContentTemplate>
                            <div class="col-md-12 text-center">
                                <asp:Image ID="img_edit" Height="200" Width="200" Style="border: 5px solid #d5b904; border-top-left-radius: 20px" runat="server" /><br />
                                 <label>Pega la URL de tu imagen aqui</label>
                                    <asp:TextBox ID="txtMiniaturaedit" CssClass="form-control imageEdit" runat="server" onKeyUp="imgChange()"></asp:TextBox>
                            </div>
                            <div class="row" style="margin-top: 15px">
                                <div class="col-md-8">
                                    <div class="row">
                                         <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Etiqueta</label>
                                                <asp:TextBox ID="txtTagEdit" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Titular</label>
                                                <asp:TextBox ID="txtTitularEdit" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Noticia</label>
                                                <asp:TextBox ID="txtNoticiaEdit" TextMode="MultiLine" Style="height: 230px !important" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                           <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Call to Action</label>
                                                <asp:TextBox ID="txtCTAEdit" runat="server" CssClass="form-control"></asp:TextBox>
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
                                                <label>Publicar en</label>
                                                <asp:DropDownList ID="ddlPublicarEdit" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="mobile">App</asp:ListItem>
                                                    <asp:ListItem Value="web">Web</asp:ListItem>
                                                    <asp:ListItem Value="web,mobile">App y Web</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Categoria</label>
                                                <asp:DropDownList ID="ddlTipoEdit" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="ZEST"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                       
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Código Nota Zest</label>
                                                <asp:TextBox ID="txtNotaEdit" runat="server" CssClass="form-control"></asp:TextBox>
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
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
    <script>
        function imgChange() {
            $("#Modal_img_edit").attr("src", $('#Modal_txtMiniaturaedit').val);
        }
      

        $(function () {


        });
        var api_key = "";
        var search = "";
        var pexel_index = 1;

        function selectPexel(e) {
            $(".pexel_item").css("border", "unset");
            $(".pexel_item").css("border-top-left-radius", "unset");
            $(e).css("border", "5px solid #d5b904");
            $(e).css("border-top-left-radius", "15px");
            $("#Modal_txtMiniatura").val($(e).attr("src"));
        }

        function pexel_prev() {
            pexel_index--;
            if (pexel_index < 1)
                pexel_index = 1
            imageSearch();
        }

        function pexel_next() {
            pexel_index++;
            imageSearch();
        }

        function search_pexel() {
            pexel_index = 1;
            imageSearch();
        }


        function imageSearch() {
            $("#pexel_index").html(pexel_index);
            search = $("#txtPexel").val();
            api_key = "563492ad6f91700001000001e938ef05dece4f119637ce4059e6bed9";
            $("#pexel_images").html("");

            $.ajax({
                method: 'GET',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", api_key)
                },
                url: 'https://api.pexels.com/v1/search?query=' + search + '&per_page=7&page=' + pexel_index,
                success: function (data) {
                    data.photos.forEach(element => {
                        image = `
                            <img src="${element.src.original}?auto=compress&cs=tinysrgb&h=650&w=940" class="pexel_item" onclick="selectPexel(this)">
                        `
                        $("#pexel_images").append(image)

                    });
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

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
