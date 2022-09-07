<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="BlogEditor.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestweb.BlogEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link href="<%=ResolveClientUrl("~/Assets/backend/blog/css/medium-editor.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Assets/backend/blog/css/themes/mani.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet" />
    <link href="<%=ResolveClientUrl("~/Assets/backend/bundles/bootstrap-tagsinput/dist/bootstrap-tagsinput.css") %>" rel="stylesheet" type="text/css" />
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
                 .editable p,
                   .editable li{
                    font-family: 'Open Sans', sans-serif;
                    font-weight:bold;
                      color:#212529 !important;
                }
                 .editable,
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
            <div class="col-4 col-md-4 col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h4>Datos Adicionales</h4>
                        <div class="card-header-action">
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upAdicional" runat="server">
                        <ContentTemplate>
                            <div class="card-body">
                                 <div class="form-group">
                                    <label>Pega el url de tu miniatura aquí</label>
                                    <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Título</label>
                                    <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" placeholder="Escribe aqui el título de tu entrada de Blog"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <label>Descripcion</label>
                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" style="height:150px !important"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Etiquetas de busqueda</label>
                                    <asp:TextBox ID="txtTags" CssClass="form-control inputtags" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Keywords</label>
                                    <asp:TextBox ID="txtKeywords" CssClass="form-control inputtags" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                     <button class="btn btn-light" onclick="saveBlog()" style="float:right">Guardar Blog</button>
                                    <br />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="col-8 col-md-8 col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h4>Entrada de Blog</h4>
                        <div class="card-header-action">
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upEntrada" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="card-body">


                                
                             
                                  <div class="row justify-content-md-center">
                                                <div class="col-md-10">
                                <div class="editable" runat="server" id="blog_entry" >
                                    <asp:Literal ID="ltBlog" runat="server"></asp:Literal>
                                    </div></div>
                                </div>
                                <br />
                                <br />
                            </div>
                            <div class="card-footer text-right">
                                <a href="Blog.aspx" runat="server" class="btn btn-default" style="float: left">Cancelar</a>
                                <button class="btn btn-light" onclick="saveBlog()">Guardar Blog</button>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
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
            var desc = $("#Content_txtDescripcion").val();
            var url = $("#Content_txtUrl").val();

            var jsonText = JSON.stringify({ html: html, tags: tags, keywords: keywords,titulo:titulo,desc:desc,url:url });

            $.ajax({
                type: "POST",
                url: "BlogEditor.aspx/saveBlog",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    window.location.replace("/Resources/Views/Backend/Zestweb/Blog.aspx");
                }
            });

            //PageMethods.saveBlog(html, tags, keywords, titulo,desc,url, Success, Failure);
        }

        function Success(result) {
            console.log(error);
        }

        function Failure(error) {
            console.log(error);
        }
    </script>

</asp:Content>
