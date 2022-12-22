<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/appAssesor.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="Zest_App.Resources.Views.Assesor.Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:UpdatePanel ID="upTable" runat="server">
        <ContentTemplate>
            <div class="dash_header">
                <%--<div class="logo">
                    <asp:Image ID="img_logo" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" />
                </div>--%>
                <div style="margin: 20px auto">
                    <asp:TextBox ID="txtSearch" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" CssClass="form-control" runat="server" Style="border:1px solid #333333;background: #000; color: #fff" placeholder="Buscar ..."></asp:TextBox>
                </div>
            </div>
            <div class="dash_portfolio active">

                <asp:Repeater ID="rpInvestors" runat="server">
                    <ItemTemplate>
                        <div style="border-top-left-radius: 10px; border: 1px solid #333333; padding: 10px">
                            <div style="display: flex; width: 100%">
                                <div style="margin: auto auto auto 0px">
                                    <b style="font-size: 13px; color: #fff">
                                        <%# Eval("nombre") %>
                                    </b>

                                </div>
                                <div style="margin: auto 0px auto auto">
                                    <a href='tel: <%# Eval("telefono") %>' style="font-size: 11px; font-weight: normal; color: #fff; margin-bottom: 10px">
                                        <%# Eval("telefono") %> <b style="color: #dabe04"><i class="fas fa-phone-alt"></i></b>
                                    </a>
                                </div>
                            </div>

                            <div style="width: 100%;">
                                <span style="font-size: 10px; color:#878585">Fecha: <%# ((DateTime)Eval("created_at")).ToString("dd MMM yy", new System.Globalization.CultureInfo("es-ES")) %>
                                </span>
                                <br />
                                <p style="color: #fff; font-size: 12px">
                                    <%# Eval("mensaje") %>
                                </p>
                                <div style="width: 100%; text-align: right">
                                    <asp:LinkButton ID="btnDelete" OnClick="btnDelete_Click" runat="server" CommandArgument='<%# Eval("id") %>' Style="color: #fff; font-size: 10px; margin-top: 5px;">
                            <i class="fas fa-trash"></i>
                                    </asp:LinkButton>
                                </div>

                            </div>

                        </div>


                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(3)').addClass('active');
        });
    </script>
</asp:Content>
