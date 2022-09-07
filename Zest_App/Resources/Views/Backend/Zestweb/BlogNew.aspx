<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="BlogNew.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestweb.BlogNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link href="<%=ResolveClientUrl("~/Assets/backend/blog/css/medium-editor.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Assets/backend/blog/css/themes/mani.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet" />
    <link href="<%=ResolveClientUrl("~/Assets/backend/bundles/bootstrap-tagsinput/dist/bootstrap-tagsinput.css") %>" rel="stylesheet" type="text/css" />
    
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet" />
    <style>
        .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6{
            line-height:unset !important;
        }
                 body{
            font-family: 'Open Sans', sans-serif;
        }
          h1{
              font-weight:600 !important;
              line-height:3rem !important;
          }
          h2{
              font-weight: 500 !important;
              line-height:2.5rem !important;
          }
        h1,h2,h3,h4,p{
            color:#212529 !important;
        }
        .card .card-body p{
            font-weight:unset;
        }
        .bootstrap-tagsinput {
            width: 100%;
        }

        #pexel_images {
            width: 100%;
        }

            #pexel_images img {
                width: 200px;
                height: 200px;
                margin: auto;
                cursor: pointer;
            }

                #pexel_images img:hover {
                    opacity: .7;
                }
                .editable:focus{
                    outline: unset !important;
                }

                .medium_banner{
                    width:100%;
                    text-align:center;
                }
                 .medium_img_left,
                 .medium_img_center,
                 .medium_img_right{
                    width:33.33%;
                    text-align:center;
                }
                 .medium_img_center{
                     margin:auto;
                 }
                 .medium_img_right{
                     margin-right:0px;
                     margin-left:auto;
                 }
                .medium_banner div,
                .medium_img_left div,
                .medium_img_center div,
                .medium_img_right div{
                    border:1px solid #E8E8E8;
                    min-height:40px;
                    width:100%;
                }
                .medium_banner div img,
                .medium_img_left div img,
                .medium_img_center div img,
                .medium_img_right div img{
                    width:100%;
                }
                .medium_banner .web_subtext,
                 .medium_img_left .web_subtext,
                .medium_img_center .web_subtext,
                .medium_img_right .web_subtext{
                    color:#939393;
                    font-size:.8rem;
                }
                .editable,
                  .editable p,
                   .editable li{
                    font-family: 'Open Sans', sans-serif;
                    font-weight:bold;
                      color:#212529 !important;
                }
                .editable p,
                .editable li{
                    line-height: 2 !important;
                    font-size: 1.1rem !important;
                }

                
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row justify-content-md-center">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Entrada de Blog</h4>
                        <div class="card-header-action">
                        </div>
                    </div>
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#firstTab" role="tab"
                                    aria-controls="home" aria-selected="true">Datos Adicionales</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#blogTab" role="tab"
                                    aria-controls="profile" aria-selected="false">Blog</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myBlog">
                            <div class="tab-pane fade show active" id="firstTab" role="tabpanel" aria-labelledby="home-tab">
                                <asp:UpdatePanel ID="upAdicional" runat="server">
                                    <ContentTemplate>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
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
                                                        <label>O pega tu url aquí</label>
                                                        <asp:TextBox ID="txtMiniatura" CssClass="form-control" runat="server"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Titulo del Blog</label>
                                                        <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control text-center" MaxLength="150" placeholder="Escribe aqui el título de tu entrada de Blog"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Descripción corta del Blog</label>
                                                        <asp:TextBox ID="txtShortDesc" TextMode="MultiLine" CssClass="form-control" MaxLength="300" placeholder="Escribe aqui una pequeña descripción de tu blog" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Etiquetas de busqueda</label>
                                                        <asp:TextBox ID="txtTags" CssClass="form-control inputtags" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Keywords</label>
                                                        <asp:TextBox ID="txtKeywords" CssClass="form-control inputtags" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="tab-pane fade" id="blogTab" role="tabpanel" aria-labelledby="profile-tab">
                                <asp:UpdatePanel ID="upEntrada" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="card-body">
                                            <div class="row justify-content-md-center">
                                                <div class="col-md-7">
                                                     <div class="editable" runat="server" id="blog_entry">

                                            </div>
                                            <br />
                                            <br />
                                                </div>
                                            </div>
                                           
                                        </div>
                                        <div class="card-footer text-right">
                                            <button class="btn btn-light" onclick="saveBlog()">Guardar Blog</button>

                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Modal" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">

    <script src="<%=ResolveClientUrl("~/Assets/backend/bundles/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Assets/backend/blog/js/medium-editor.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Assets/backend/blog/js/custom-html.min.js") %>" type="text/javascript"></script>
    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
        function endReq(sender, args) {
           
            $(function () {
               
                $(".inputtags").tagsinput('items');
            });

        }

        var editor = new MediumEditor('.editable', {
            toolbar: {
                buttons: ['justifyFull', 'justifyCenter', 'justifyRight', "bold"
                    , "italic"
                    , "underline"
                    , "anchor"
                    , "h1"
                    , "h2"
                    , 'subscript'
                    , 'orderedlist'
                    , 'image'
                    , 'html'
                    , 'removeFormat'
                    , "quote"
                    , 'banner'
                    , 'imgleft',
                    , 'imgcenter'
                    , 'imgright'],
              
            },
            buttonLabels: 'fontawesome',
            anchor: {
                targetCheckbox: true
            },
            extensions: {
                "banner": new CustomHtml({
                    buttonText: "Banner"
                    , htmlToInsert: "<div class='medium_banner'><div></div><span class='web_subtext'>Texto imagen</span></div><br />"
                }),
                "imgleft": new CustomHtml({
                    buttonText: "Img-Left"
                    , htmlToInsert: "<div style='display:flex;width:100%'><div class='medium_img_left'><div></div><span class='web_subtext'>Texto imagen</span></div></div><br />"
                }),
                "imgcenter": new CustomHtml({
                    buttonText: "Img-Center"
                    , htmlToInsert: "<div style='display:flex;width:100%'><div class='medium_img_center'><div></div><span class='web_subtext'>Texto imagen</span></div></div><br />"
                }),
                "imgright": new CustomHtml({
                    buttonText: "Img-Right"
                    , htmlToInsert: "<div style='display:flex;width:100%'><div class='medium_img_right'><div></div><span class='web_subtext'>Texto imagen</span></div></div><br />"
                }),
            }
        });
        $(".inputtags").tagsinput('items');

        function saveBlog() {
            var html = editor.getContent();
            var tags = $("#Content_txtTags").val();
            var keywords = $("#Content_txtTags").val();
            var titulo = $("#Content_txtTitulo").val();
            var miniatura = $("#Content_txtMiniatura").val();
            var descrip = $("#Content_txtShortDesc").val();

            var jsonText = JSON.stringify({ html: html, tags: tags, keywords: keywords, titulo: titulo, miniatura: miniatura, descrip: descrip });

            $.ajax({
                type: "POST",
                url: "BlogNew.aspx/saveBlog",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    window.location.replace("/Resources/Views/Backend/Zestweb/Blog.aspx");
                }
            });
        }

        function Success(result) {
            window.location = result;

        }

        function Failure(error) {
            console.log(error);
        }


        var api_key = "";
        var search = "";
        var pexel_index = 1;

        function selectPexel(e) {
            $(".pexel_item").css("border", "unset");
            $(".pexel_item").css("border-top-left-radius", "unset");
            $(e).css("border", "5px solid #d5b904");
            $(e).css("border-top-left-radius", "15px");
            $("#Content_txtMiniatura").val($(e).attr("src"));
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
                url: 'https://api.pexels.com/v1/search?query=' + search + '&per_page=6&page=' + pexel_index,
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

    </script>

</asp:Content>
