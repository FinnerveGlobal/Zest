<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestCatalogFund.aspx.cs" Inherits="Zest_App.Resources.Views.Catalog.ZestCatalogFund" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .catalog_item:hover,
        .catalog_item:active,
        .catalog_item:focus {
            text-decoration: unset;
            color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <%--<div class="dash_header">
        <!-- <div class="logo">
            <asp:Image ID="img_logo" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" />
        </div>-->
        <div class="resumenLabel" style="width: unset">
            <div align="right" style="float: left">
                <a href="ZestCatalog.aspx" style="color: #333333">
                    Nuevas Notas
                </a>
             <div style="height: 4px; width: 30px; background: #dabe04; display: none">
             </div>
            </div>
            <div align="right" style="float: right">
                Nuevos Fondos
             <div style="height: 4px; width: 30px; background: #dabe04">
             </div>
            </div>
        </div>
    </div>--%>
    <div class="dash_header">
        <%--<div class="logo">
            <asp:Image ID="img_logo" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" />
        </div>--%>
        <div class="resumenLabel row" style="width: unset">
            <div class="col-6">
                <a href="ZestCatalog.aspx" style="color: #333333; padding-left: 20px;">
                    Nuevas Notas
                </a>
             <div style="height: 4px; width: 30px; background: #dabe04; display: none">
             </div>
            </div>
            <div class="col-6">
                Nuevos Fondos
                 <div style="height: 4px; width: 30px; background: #dabe04; margin-left: 87px;">
                 </div>
            </div>
        </div>
    </div>

    <br />
    <br />

    <div class="catalog">
        <asp:Repeater ID="rpTable" runat="server">
            <ItemTemplate>
                <a class="catalog_item ca_1" href="ZestItemFund.aspx?id=<%# Eval("id") %>">
                    <i class="fas fa-chevron-down" style="position:absolute;bottom:10px;right:10px"></i>
                    <div class="title">
                        <%# Eval("codigo_fondo") %>
                        <br />
                    </div>
                    <div class="monto_minimo" style="position:absolute;right:10px">
                        <%# ((Double)Eval("inv_minima")).ToString("N0") %> <span>  <%# Eval("moneda") %></span>
                        <br />
                        <i>Inversión mínima</i>
                    </div>
                    <div class="desc">
                        <br />
                        <span>Gestor</span>
                        <%# Eval("gestor") %>
                        <br />
                        <br />
                        <span>Administrador</span>
                        <%# Eval("administrador") %>
                        <br />
                        <br />
                        <span>Auditor</span>
                        <%# Eval("auditor") %>
                        <br />
                        <br />
                        <span>Ingreso a la serie limitado hasta</span> 
                        <%# ((DateTime)Eval("updated_at")).ToString("dd MMM yy") %><br />
                        <span>o hasta completar monto de emisión</span>
                        <br />
                        <br />
                    </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    

    <%--<asp:Button runat="server"  OnClick="btnExternal_Click"/>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(3)').addClass('active');
        });
    </script>
</asp:Content>
