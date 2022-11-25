<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestFundsDetail.aspx.cs" Inherits="Zest_App.Resources.Views.Funds.ZestFundsDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="dash_header">
        <div class="resumenLabel row" style="width: unset">
            <div class="col-4" style="padding-left: 30px;">
                Detalles
                <div style="height: 4px; width: 30px; background: #dabe04; margin-left: 32px;"></div>
            </div>
            <div class="col-4">
                <a href="" style="color: #333333">
                   Eventos
                </a>
                <div style="height: 4px; width: 30px; background: #dabe04; display: none"></div>
            </div>
            <div class="col-4">
                <a href="" style="color: #333333">
                   Análisis
                </a>
                <div style="height: 4px; width: 30px; background: #dabe04; display: none"></div>
            </div>
        </div>
    </div>
    <div class="notas_body notas_activos" style="margin-top:50px">
        <div class="activos_header_group" style="position:sticky;top:85px">
            <div class="activos_header">
             <div style="position:absolute;bottom:20px;left:50%;color:#fff">
              <i class="fas fa-chevron-down"></i>
             </div>
                <div class="left" style="margin-right: 0.5px">
                    <asp:Literal ID="nota_nombre" runat="server" Text="Fondo Zest Estructurado"></asp:Literal>
                </div>
                <div class="right">
                     <div><asp:Literal ID="nota_valor" runat="server" Text="5000"></asp:Literal> <i style="font-size:10px;margin-top:5px;font-style:normal;color:#dabe04">USD</i></div>
                </div>
            </div>
            <div class="activos_header_desc" style="z-index: 1000; position: relative; display: block;background-color: black;">
                <div class="row">
                    <div class="col-6">
                        <span>Gestor</span>
                        <br />
                        <asp:Literal ID="fondo_gestor" runat="server" Text="Zest LLC"></asp:Literal>
                        <br />
                        <br />
                        <span>Auditor</span>
                        <br />
                        <asp:Literal ID="fondo_auditor" runat="server" Text="PwC"></asp:Literal>
                        <br />
                        <br />
                         <span>Moneda</span>
                        <br />
                        <asp:Literal ID="fondo_moneda" runat="server" Text="USD"></asp:Literal>
                    </div>
                    <div class="col-6">
                        <span>Administrador</span>
                        <br />
                        <asp:Literal ID="fondo_administrador" runat="server" Text="Zest Capital Perú SAC"></asp:Literal>
                        <br />
                        <br />
                        <span>Custodio</span>
                        <br />
                        <asp:Literal ID="fondo_custodio" runat="server" Text="Pershing LLC"></asp:Literal>
                        <br />
                        <br />
                        <span>Riesgo</span>
                        <br />
                        <asp:Literal ID="fondo_riesgo" runat="server" Text="Volatibilidad"></asp:Literal>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $('.activos_item_group').click(function () {
            $(this).toggleClass('active');
            $(this).find('.activos_desc').slideToggle(500);
        });
        $('.activos_header_group').click(function () {
            $(this).find('.activos_header_desc').slideToggle(500);
        });
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(2)').addClass('active');
        });
    </script>
</asp:Content>
