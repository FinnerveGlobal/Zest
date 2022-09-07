<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="Efinanciera.aspx.cs" Inherits="Zest_App.Resources.Views.Website.Efinanciera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="canonical" href="http://ospzest.finnerve.com/blog" />
    <style>
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section class="blog_landing">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <asp:UpdatePanel ID="upBlogLanding" runat="server">
                        <ContentTemplate>
                            <div class="land_header">
                                <div class="center">
                                    <asp:Image ID="img_firstEntry" Style="width: 100%; height: 100%" runat="server" />
                                </div>
                                <div class="right">
                                    <h1 class="web_title web_white">
                                        <b>
                                            <asp:Literal ID="ltFirstTitle" runat="server"></asp:Literal></b>
                                    </h1>
                                    <p class="web_text web_white">
                                        <asp:Literal ID="ltFirstText" runat="server"></asp:Literal>
                                    </p>
                                    <asp:LinkButton ID="lbFirstEntry" CssClass="btn-zest-white " runat="server" OnClick="lbGoEntry_Click">Ver más</asp:LinkButton>
                                </div>
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>

                </div>
            </div>
        </div>
    </section>
    <section class="blog_entradas">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <asp:UpdatePanel ID="upEntries" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="dgvTable" CssClass="table table-pagination" GridLines="none" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="dgvTable_PageIndexChanging" AllowPaging="true" PageSize="10">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="blog_entry <%# Container.DisplayIndex == 0 ? "hide" : ""%>">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <asp:Image ID="img_entry" runat="server" CssClass='<%# Container.DisplayIndex == 0 ? "" : "same-height"%>' Style="width: 100%" ImageUrl='<%# Eval("img_url") %>' />
                                                    </div>
                                                    <div class="col-9">
                                                        <asp:LinkButton ID="lkGoEntry1" CssClass="goEntrytitle" runat="server" CommandArgument='<%# Bind("entry_url", "{0}") %>' OnClick="lbGoEntry_Click">
                                                        <h3 class="web_title web_black">
                                                            <%# Eval("titulo").ToString() %>
                                                        </h3>
                                                        </asp:LinkButton>
                                                        <p class="web_subtitle" >
                                                            <%# Eval("descrip").ToString() %>
                                                            <br />
                                                            <span class="web_black">
                                                                <%# ((DateTime)Eval("created_at")).ToString("dd MMM yy",System.Globalization.CultureInfo.CreateSpecificCulture("es")) %>
                                                            </span>
                                                        </p>

                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <div class="col-md-4">
                    <div class="rightMenu">
                        <asp:UpdatePanel ID="upRight" runat="server">
                            <ContentTemplate>
                                <div class="searchBox">
                                    <label class="web_text web_black"><b></b></label>

                                    <div class="input-group mb-3 web_input_group" style="width:100%">
                                        <asp:TextBox ID="txtSearch" CssClass="form-control" AutoPostBack="true" runat="server" placeholder="Buscar entrada de blog" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

                                        <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button">Buscar</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="tagsFilter">
                                    <label class="web_black web_subtitle" style="width: 100%; margin-bottom: 10px"><b>Contenidos</b> </label>
                                    <div style="margin-left: -6px">
                                        <asp:Repeater ID="rpTags" runat="server">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbSearchTag" runat="server" Style="padding: 5px 10px; margin: 5px; border: 1px solid #e0e0e0; border-radius: 5px; float: left" CssClass="blog_tags web_text web_black" CommandArgument='<%# Bind("Key", "{0}") %>' OnClick="lbSearchTag_Click">
                                                    <%# Eval("Key") %>
                                                     
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                                <div class="lastEvents" style="margin-top: 30px">
                                    <asp:GridView ID="dgvEvents" CssClass="table table-tags" GridLines="none" runat="server" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <a href="/events" class="web_black web_subtitle" style="display: block; padding: 10px 0px; margin-left: -4px"><b>Eventos</b> </a>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEvent" runat="server" CssClass="eventBtn web_black" CommandArgument='<%# Bind("id", "{0}") %>' PostBackUrl="/events">
                                               <div style="width:100%;display:flex" class="web_subtitle web_black">
                                                   <div style="margin:auto 20px auto 0px;margin-left:-4px">
                                                          <img src="/Assets/img/website/iconos/icon_calendar.svg" style="width:20px;"/>
                                                   </div>
                                                <div>
                                                   <%# Eval("titulo") %>
                                                   </div>
                                               </div> 
                                             
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
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
                $(".contact-section").hide();
                $(".secNews").show();
                $(".publicidad").show();
            });

        }

        $(function () {
            var cw = $('.same-height').width();
            $('.same-height').css({ 'height': cw + 'px' });

            $("#navbar").addClass("navbar-light scrolled");
            $("#liblog").addClass("active");
            $(".newsLetter").show();
            $(".contact-section").hide();
            $(".secNews").show();
            $(".publicidad").show();

        });
    </script>
</asp:Content>
