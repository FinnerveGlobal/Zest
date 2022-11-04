<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestCatalog.aspx.cs" Inherits="Zest_App.Resources.Views.Catalog.ZestCatalog" %>

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
    <div class="dash_header">
        <%--<div class="logo">
            <asp:Image ID="img_logo" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" />
        </div>--%>
        <div class="resumenLabel" style="width: unset">
            <div align="right" style="float: left">
                Nuevas Notas
             <div style="height: 4px; width: 30px; background: #dabe04">
             </div>
            </div>
            <div align="left" style="float: right">
                <a href="ZestCatalogFund.aspx">
                   Nuevos Fondos
                </a>
             <div style="height: 4px; width: 30px; background: #dabe04">
             </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="catalog">

        <asp:Repeater ID="rpTable" runat="server">
            <ItemTemplate>
                <a class="catalog_item ca_1" href="ZestItem.aspx?id=<%# Eval("id") %>">
              <i class="fas fa-chevron-down" style="position:absolute;bottom:10px;right:10px"></i>
                    <div class="title">
                       <%# Eval("codigo_nota") %>
                <br />
                    </div>
                    <div class="monto_minimo" style="position:absolute;right:10px">
                       
                        <%# ((Double)Eval("inv_minima")).ToString("N0") %> <span>  <%# Eval("moneda") %>
                        </span>
                <br />
                        <i>Inversión mínima</i>
                    </div>
                    <div class="desc">
                <br />
                          <span>ISIN</span>
                        <%# Eval("isin") %>
                <br />
                        <br />
                         <span>Emisor</span>
                        <%# Eval("emisor") %>
                <br />
                        <br />
                         <span>Rentabilidad</span>
                        <%# Eval("rentabilidad") %>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(3)').addClass('active');
        });
    </script>
</asp:Content>
