﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestCatalogFund.aspx.cs" Inherits="Zest_App.Resources.Views.Catalog.ZestCatalogFund" %>
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
                <a href="ZestCatalog.aspx">
                    Nuevas Notas
                </a>
             <div style="height: 4px; width: 30px; background: #dabe04">
             </div>
            </div>
            <div align="left" style="float: right">
                Nuevos Fondos
             <div style="height: 4px; width: 30px; background: #dabe04">
             </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="catalog">
        <div class="notas_body notas_activos" style="margin-top:10px">
            <div class="activos_header_group" style="position:sticky;top:85px;">
                <div class="activos_header" style="">
                    <div style="position:absolute;bottom:20px;left:50%;color:#fff">
                    <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="left">
                        Zest Estructurado Distribución
                    </div>
                    <div class="right" style="margin: auto 20px auto 0;"><div>120,217.44 <i style="font-size:10px;margin-top:5px;font-style:normal;color:#dabe04">USD</i></div></div>
                </div>
                <div class="activos_header_desc" style="z-index:1000;position:relative;background:black;display: block;">
                    <div class="row">
                        <div class="col-6">
                            <span>Gestor</span>
                            <br />
                            Zest LLC
                            <br />
                            <br />
                            <span>Auditor</span>
                            <br />
                            PwC
                            <br />
                            <br />
                                <span>Moneda</span>
                            <br />
                            USD
                        </div>
                        <div class="col-6">
                            <span>Administrador</span>
                            <br />
                            Zest Capital Perú SAC
                            <br />
                            <br />
                            <span>Custodio</span>
                            <br />
                            Pershing LLC
                            <br />
                            <br />
                            <span>Riesgo</span>
                            <br />
                            Volatibilidad
                        </div>
                    </div>
                </div>
            </div>
            </div>

    </div>
    <div class="d-flex justify-content-around my-3">
        <button style="background:black; color: #dabe04; border-color: #dabe04;padding: 0.5rem;">Ver Factsheet</button>
        <button style="background:black; color: #dabe04; border-color: #dabe04;padding: 0.5rem;">Me interesa</button>
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