<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="FaQ.aspx.cs" Inherits="Zest_App.Resources.Views.Website.FaQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="canonical" href="http://ospzest.finnerve.com/faq" />
    <style>
        .faq_entry{
            width:85%;
            margin-bottom:unset;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <section class="faq">
        <div class="container" style="margin-bottom: 40px">
            <asp:UpdatePanel ID="upFaq" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-12" style="padding-top: 50px;padding-bottom:50px">
                            <h1 class="web_title" style="color: #666666">Preguntas frecuentes
                            </h1>
                            <div class="input-group mb-3 web_input_group" style="margin-top:50px">
                                <asp:TextBox ID="txtSearch" CssClass="form-control" AutoPostBack="true" runat="server" placeholder="Buscar entrada de blog" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

                                <div class="input-group-append">
                                    <asp:LinkButton ID="btnSearcj" CssClass="btn btn-outline-secondary" runat="server" OnClick="txtSearch_TextChanged">Buscar</asp:LinkButton>

                                </div>
                            </div>
                        </div>
                        <asp:Repeater ID="rpFaqs" runat="server">
                            <ItemTemplate>
                                <div class="col-md-6">
                                    <div class="faq_entry" style="margin-bottom:10px">
                                        <div class="web_text web_black" style="display:flex">
                                            <div style="width:40px">
                                                 <img src="/Assets/img/website/arrow2.svg" style="width:40px"/>
                                            </div>
                                           <div style="margin:auto auto auto 10px">
                                                  <b ><%# Eval("question") %></b>
                                           </div>
                                         
                                        </div>
                                        <p class="web_text web_black text-justify" >
                                            <%# Eval("answer") %>
                                        </p>
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
                $("#liblog").addClass("active");
                $(".newsLetter").show();
                $(".faq_entry").click(function () {


                    if ($(this).hasClass("active")) {
                        $(this).removeClass("active");
                    }
                    else {

                        $(".faq_entry").removeClass("active");
                        $(this).addClass("active");
                    }
                    event.stopPropagation();
                });
                $(".faq").click(function () {
                    $(".faq_entry").removeClass("active");
                });
            });

        }

        $(function () {
            var cw = $('.same-height').width();
            $('.same-height').css({ 'height': cw + 'px' });

            $("#navbar").addClass("navbar-light scrolled");
            $("#lifaq").addClass("active");
            $(".newsLetter").show();

            $(".faq_entry").click(function () {

                if ($(this).hasClass("active")) {
                    $(this).removeClass("active");
                }
                else {

                    $(".faq_entry").removeClass("active");
                    $(this).addClass("active");
                }
                event.stopPropagation();
            });
            $(".faq").click(function () {
                $(".faq_entry").removeClass("active");
            });

        });
    </script>
</asp:Content>
