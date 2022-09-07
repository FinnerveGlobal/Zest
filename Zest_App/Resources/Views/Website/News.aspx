<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Zest_App.Resources.Views.Website.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="canonical" href="http://ospzest.finnerve.com/noticias/" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section class="faq">
        <div class="container" style="margin-bottom: 40px">
            <asp:UpdatePanel ID="upFaq" runat="server">
                <ContentTemplate>
                    <div class="row">
                      <div class="col-md-12" style="padding-top: 50px;padding-bottom:50px">
                            <h1 class="web_title" style="color:#666666">Notas de prensa 
                            </h1>
                            <div class="input-group mb-3 web_input_group" style="margin-top:50px">
                                <asp:TextBox ID="txtSearch" CssClass="form-control" AutoPostBack="true" runat="server" placeholder="Buscar nota de prensa" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

                                <div class="input-group-append">
                                    <asp:LinkButton ID="btnSearcj" CssClass="btn btn-outline-secondary"  runat="server" OnClick="txtSearch_TextChanged">Buscar</asp:LinkButton>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <asp:Repeater ID="rpNews" runat="server">
                            <ItemTemplate>
                                <div class="news_bottom" style='<%# "background:url("+Eval("url_img")+")"%>'>
                                    <div>
                                        <h1 class="web_subtitle web_white">
                                            <b><%# Eval("titular") %></b>
                                        </h1>
                                        <p class="web_text web_white">
                                            <%# Eval("descripcion") %>
                                        </p>
                                        <a class="news_cta" href="<%# Eval("cta") %>" target="_blank" style='<%# Eval("cta") == null || Eval("cta") == "" ? "display:none": "" %>'>saber más
                                        </a>
                                    </div>

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
      <script>

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
        function endReq(sender, args) {
            $(function () {
                var cw = $('.same-height').width();
                $('.same-height').css({ 'height': cw + 'px' });

                $("#navbar").addClass("navbar-light");
                
            });

        }

        $(function () {
            var cw = $('.same-height').width();
            $('.same-height').css({ 'height': cw + 'px' });

            $("#navbar").addClass("navbar-light scrolled");
            $("#lifaq").addClass("active");

          

        });
      </script>
</asp:Content>
