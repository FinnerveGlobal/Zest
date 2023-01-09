<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="NewsZest.aspx.cs" Inherits="Zest_App.Resources.Views.News.NewsZest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #div_Content {
            padding: 0px 30px 100px 30px !important;
        }

        .notas_menu{
            position: static;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="notas_menu" style="z-index: 1">
        <a class="menu_item btn_load" href="NewsMercado.aspx">Macro
             <span></span>
        </a>
        <a class="menu_item btn_load" href="NewsCorp.aspx">Compañias
             <span></span>
        </a>

        <a class="menu_item btn_load active" href="NewsZest.aspx">Blog
             <span></span>
        </a>
    </div>
    <div class="news_body" style="margin-top: 0px">
        <asp:UpdatePanel ID="upNews" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rpTable" runat="server">
                    <ItemTemplate>
                        <div class="news_item">
                            <div class="n_header">
                                <div class="n_bullet">
                                </div>
                                <div class="n_title">
                                    <asp:LinkButton ID="btnExternal" Style="color: #fff" OnClick="btnExternal_Click" CssClass="btn_load" CommandArgument='<%# Bind("cta", "{0}") %>' runat="server">
                                        <span><%# Eval("tags") %></span>
                                        <br />
                                        <%# Eval("titular") %>
                                    </asp:LinkButton>
                                </div>
                                <asp:Image ID="Image3" CssClass="n_image" ImageUrl='<%# Eval("url_img") %>' runat="server" />

                            </div>
                            <div class="n_body">
                                <%#Eval("descripcion") %>
                            </div>
                            <div class="n_fecha"><%# ((DateTime)Eval("created_at")).ToString("dd MMM yy") %></div>

                        </div>

                    </ItemTemplate>

                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
        function endReq(sender, args) {
            $(function () {
                $('.bot_menu').find('.bot_menu_item').removeClass('active');
                $('.bot_menu').find('.bot_menu_item:nth-child(3)').addClass('active');
            });
            $('.news_item').click(function () {
                var tmp = $(this).hasClass('active');
                $('.news_item').removeClass('active');

                if (!tmp)
                    $(this).addClass('active');
            });

        }
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(4)').addClass('active');
        });
        $('.news_item').click(function () {
            var tmp = $(this).hasClass('active');
            $('.news_item').removeClass('active');

            if (!tmp)
                $(this).addClass('active');
        });

    </script>
</asp:Content>
