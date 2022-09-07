<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="EfinancieraEntry.aspx.cs" Inherits="Zest_App.Resources.Views.Website.EfinancieraEntry" %>
<asp:Content ID="Content5" ContentPlaceHolderID="metatags" runat="server">
       <asp:PlaceHolder id="MetaPlaceHolder" runat="server" />
     <asp:PlaceHolder id="MetaPlaceHolder2" runat="server" />
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
    <style>
        .blog_entry {
            padding: 70px 0px 0px 0px;
        }

            .blog_entry .header h1 {
                font-weight: 600;
            }

            .blog_entry .blog_profile img {
                width: 70px;
                height: 70px;
            }

            .blog_entry .header .editor {
                display: inline-flex;
                margin-top: 30px;
            }

                .blog_entry .header .editor .blog_redes {
                    display: inline-flex;
                    margin: auto 0px auto auto;
                }

                    .blog_entry .header .editor .blog_redes a {
                        margin: auto 10px;
                        color: #000;
                        font-size: 30px;
                    }

        .web_blog_entry h1, h2, h3 {
            line-height: unset !important;
        }

        .web_blog_entry p {
            line-height: 2 !important;
            font-size: 1.1rem !important;
        }

        .web_blog_entry a {
            color: #aaaaaa;
        }

        .web_blog_entry .has_img {
            display: flex;
        }

        .web_blog_entry p img {
            margin: auto;
        }

        .markk::marker {
            font-size: 8px;
            width: 8px;
            color: #686969;
        }
        .medium_banner img{
            width:100% !important;
        }
        .medium_banner span{
            font-size:0.7rem !important;
        }
        sub{
            font-size:0.7rem !important;
        }
        .web_blog_entry li{
            font-weight:600;
        }
        .web_blog_entry li span{
            font-weight:normal;
        }
        .pe-wp-default ol li,
         .pe-wp-default ul li{
                    font-size:1.1rem !important;
                     font-weight: normal;
                     line-height: 2;
                }
        .pe-wp-default .has_img{
            display:unset!important;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section class="blog_entry">
        <div class="container">

            <div class="row">
                <div class="col-md-2 hide_mobile">
                    <div style="position: sticky; top: 0;" class="web_middle_parent">
                        <div class="web_middle_child" style="margin-left: 0px; margin-top: 20vh">
                            <asp:UpdatePanel ID="upShare" runat="server">
                                <ContentTemplate>
                                    <div style="position: relative">
                                        <asp:LinkButton ID="lbLike" runat="server" OnClick="lbLike_Click" CssClass="toup">
                                        
                                             <img src="/Assets/img/website/iconos/icon_like.svg" style="width: 38px;padding:10px 0px" />
                                         
                                       
                                        </asp:LinkButton>
                                        <span class="badge web_white" style="position: absolute; right: 0; bottom: 0; z-index: 10; background: #aaaaaa">
                                            <asp:Label ID="likesitems" runat="server" Text=""></asp:Label>
                                        </span>
                                    </div>

                                    <a href="#" onclick="javascript:CreateBookmarkLink();">
                                        <img src="/Assets/img/website/iconos/icon_save.svg" style="width: 38px; padding: 10px 0px" />
                                    </a>
                                    <a href="#" data-toggle="modal" data-target="#commentsModal">
                                        <img src="/Assets/img/website/iconos/icon_comment.svg" style="width: 38px; padding: 10px 0px" />
                                    </a>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>

                    </div>
                </div>
                <div class="col-md-8">
                    <asp:UpdatePanel ID="upBlogEntry" runat="server">
                        <ContentTemplate>
                            <div class="row header">
                                <div class="col-12">
                                    <h1 class="web_header web_grey web_text_justify">
                                        <asp:Literal ID="ltTitle" runat="server"></asp:Literal>
                                    </h1>
                                    <h3 class="web_black web_text_justify" style="font-size: 1.1rem !important;">
                                        <asp:Literal ID="ltDesc" runat="server"></asp:Literal>
                                    </h3>
                                </div>
                                <div class="col-12 editor">
                                    <div class="blog_profile">
                                        <asp:Image ID="img_blog_profile" runat="server" Style="border-radius: 100%; border: 1px solid #eaeaea" />
                                    </div>
                                    <div class="blog_profile_name web_middle_parent" style="height: unset">
                                        <div class="web_middle_child" style="margin-left: 20px">
                                            <h3 class="web_subtitle web_black">
                                                <asp:Literal ID="ltProfileName" runat="server"></asp:Literal>
                                            </h3>
                                            <h6 class="web_text web_grey" style="display: flex">
                                                <asp:Literal ID="ltDate" runat="server"></asp:Literal>
                                            </h6>
                                        </div>

                                    </div>
                                    <div class="blog_redes hide_mobile">

                                        <a href="javascript:var dir=window.document.URL;var tit=window.document.title;var tit2=encodeURIComponent(tit);var dir2= encodeURIComponent(dir);window.location.href=('http://www.linkedin.com/shareArticle?mini=true&url='+dir2+'&title='+tit2+'');">
                                            <img src="/Assets/img/website/iconos/icon_linkedin.svg" style="width: 38px;" /></a>

                                        <a href="javascript:var dir=window.document.URL;var tit=window.document.title;var tit2=encodeURIComponent(tit);window.location.href=('http://twitter.com/?status='+tit2+'%20'+dir+'');">
                                            <img src="/Assets/img/website/iconos/icon_twiter.svg" style="width: 38px;" /></a>

                                    </div>
                                </div>
                                <div class="text-right" style="width:100%">
                                      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="show_mobile">
                                           <div style="position: relative">
                                        <asp:LinkButton ID="lbLike2" runat="server" OnClick="lbLike_Click" CssClass="toup">
                                        
                                             <img src="/Assets/img/website/iconos/icon_like.svg" style="width: 38px;padding:10px 2.5px" />
                                         
                                       
                                        </asp:LinkButton>
                                        <span class="badge web_white" style="position: absolute; right: 0; bottom: 0; z-index: 10; background: #aaaaaa">
                                            <asp:Label ID="lblikesitems2" runat="server" Text=""></asp:Label>
                                        </span>
                                    </div>

                                    <a href="#" onclick="javascript:CreateBookmarkLink();">
                                        <img src="/Assets/img/website/iconos/icon_save.svg" style="width: 38px; padding: 10px 2.5px" />
                                    </a>
                                    <a href="#" data-toggle="modal" data-target="#commentsModal">
                                        <img src="/Assets/img/website/iconos/icon_comment.svg" style="width: 38px; padding: 10px 2.5px" />
                                    </a>
                                           <a href="javascript:var dir=window.document.URL;var tit=window.document.title;var tit2=encodeURIComponent(tit);var dir2= encodeURIComponent(dir);window.location.href=('http://www.linkedin.com/shareArticle?mini=true&url='+dir2+'&title='+tit2+'');">
                                            <img src="/Assets/img/website/iconos/icon_linkedin.svg" style="width: 38px;padding: 10px 2.5px" /></a>

                                        <a href="javascript:var dir=window.document.URL;var tit=window.document.title;var tit2=encodeURIComponent(tit);window.location.href=('http://twitter.com/?status='+tit2+'%20'+dir+'');">
                                            <img src="/Assets/img/website/iconos/icon_twiter.svg" style="width: 38px;padding: 10px 2.5px" /></a>
                                    </div>
                                 
                                </ContentTemplate>
                            </asp:UpdatePanel>
                                </div>
                               
                              
                                <div class="col-12 web_blog_entry web_text_justify" style="margin-top: 20px">
                                    <asp:Literal ID="ltBlogEntry" runat="server"></asp:Literal>
                                </div>


                                <div class="col-md-12">
                                    <asp:Repeater ID="rpTags" runat="server">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbSearchTag" runat="server" Style="padding: 5px 10px; margin: 5px; border: 1px solid #e0e0e0; border-radius: 5px; float: left" CssClass="blog_tags web_text web_black" CommandArgument='<%# Bind("Key", "{0}") %>'>
                                                    <%# Eval("Key") %>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>

                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>


        </div>
    </section>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Content2" runat="server">
    <section>
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rpBlogs" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3 col-6">
                            <div class="blog_entry" style="padding-top: 40px">
                                <div class="row">
                                    <div class="col-12" style="margin-bottom: 16px">
                                        <asp:Image ID="img_entry" runat="server" CssClass='same-height' Style="width: 100%" ImageUrl='<%# Eval("img_url") %>' />
                                    </div>
                                    <div class="col-12">
                                        <asp:LinkButton ID="lkGoEntry1" CssClass="goEntrytitle" runat="server" CommandArgument='<%# Bind("entry_url", "{0}") %>' OnClick="lbGoEntry_Click">
                                                        <h3 class="web_subtitle web_grey" style="font-family:'Gotham';font-weight:bold">
                                                            <%# Eval("titulo").ToString() %>
                                                        </h3>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>


    <div class="modal fade" id="commentsModal" tabindex="-1" role="dialog" aria-hidden="true">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content" style="margin-top: 10vh;">
                       
                        <div class="modal-body">
                             <asp:GridView ID="dgvComments" CssClass="table table-pagination" GridLines="none" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="dgvComments_PageIndexChanging" AllowPaging="true" PageSize="4">
                                <Columns>
                                    <asp:TemplateField >
                                        <HeaderTemplate>
                                            <span class="web_title web_grey">Comentarios</span>
                                               <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float:right">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                                <div class="row" style="border-top:1px solid #e0e0e0">
                                                    <div class="col-12">
                                                        <p class="web_subtitle">
                                                            <span class="web_text web_grey" > <%# ((DateTime)Eval("updated_at")).ToString("dd MMM yy HH:mm",System.Globalization.CultureInfo.CreateSpecificCulture("es")) %></span>
                                                       <br /> <%# Eval("comment") %>
                                                           
                                                            
                                                        </p>
                                                    </div>
                                                </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="modal-footer">
                            <asp:TextBox ID="txtComentario" TextMode="MultiLine" CssClass="form-control" runat="server" Text="" placeholder="Escribe tu comentario aqui ..."></asp:TextBox>
                            <asp:LinkButton ID="btnSaveComm"  CssClass="btn-zest-yellow" runat="server" OnClick="btnSaveComment_Click">Guardar</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
        function endReq(sender, args) {
            $(function () {
                var cw = $('.same-height').width();
                $('.same-height').css({ 'height': cw + 'px' });

                $("#navbar").addClass("navbar-light");
                $("#liblog").addClass("active");

                $(".newsLetter").show();
                $(".publicidad").show();
                $('.web_blog_entry p:has(img)').addClass('has_img');
            });

        }

        $(function () {
            var cw = $('.same-height').width();
            $('.same-height').css({ 'height': cw + 'px' });

            $("#navbar").addClass("navbar-light scrolled");
            $("#liblog").addClass("active");
            $(".newsLetter").show();
            $(".publicidad").show();
            $('.web_blog_entry p:has(img)').addClass('has_img');

        });



        function CreateBookmarkLink() {
            var title = document.title;
            var url = window.location.href;

            if (window.sidebar && window.sidebar.addPanel) {
                /* Mozilla Firefox Bookmark - works with opening in a side panel only � */
                window.sidebar.addPanel(title, url, "");
            } else if (window.opera && window.print) {
                /* Opera Hotlist */
                alert("Presiona Ctrl+D para guardar en favoritos");
                return true;
            } else if (window.external) {
                /* IE Favorite */
                try {
                    window.external.AddFavorite(url, title);
                } catch (e) {
                    alert("Presiona Ctrl+D para guardar en favoritos");
                }
            } else {
                /* Other */
                alert("Presiona Ctrl+D para guardar en favoritos");
            }
        }
    </script>
</asp:Content>
