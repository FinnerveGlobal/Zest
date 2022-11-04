<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestFunds.aspx.cs" Inherits="Zest_App.Resources.Views.Funds.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
    <style>
        .body {
            overflow: hidden !important;
        }

        .dash_header .resumen .left {
            display: block;
        }

            .dash_header .resumen .left p {
                margin-bottom: 0;
                margin-top: 0;
            }

            .dash_header .resumen .left span {
                color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <% if (HasFunds)
        { %>
        <div class="dash_header">
            <div class="resumenLabel" style="width: unset">
                <div align="right" style="float: left">
                    Fondos
                    <div style="height: 4px; width: 30px; background: #dabe04">
                    </div>
                </div>
            </div>
            <div class="resumen">
                <div class="left">
                    <span style="display: block">
                        <asp:Literal ID="valor_nominal" runat="server"></asp:Literal>
                        <i style="font-style: normal; color: #dabe04">USD</i>
                    </span>
                    <p>
                        <asp:Literal ID="nav_del_dia" runat="server"></asp:Literal>
                        <span style="display: inline-block">USD</span>
                    </p>
                    <span style="display: block; color: greenyellow;">
                        <asp:Literal ID="rentabilidad_acumulada" runat="server"></asp:Literal>
                        <i style="font-style: normal">%</i>
                    </span>
                </div>
                <%--<div class="right" style="color: #fff">
                    <span>
                        <asp:Literal ID="dividendos_acumulados" runat="server"></asp:Literal>
                        <i style="font-style: normal; color: #dabe04">USD</i>
                    </span>
                    <br />
                    <span>7,56% </span>
                </div>--%>
            </div>
        </div>
        <div id="dash_body" class="dash_body">
            <div id="body_grafico" class="body_item1 active">
                <asp:Literal ID="ltChart" runat="server"></asp:Literal>
            </div>
        </div>
        <div id="dash_portfolio" class="dash_portfolio" >
            <div class="port_header" onclick="show_portfolio()">
                Fondos
                <br />
            </div>
            
            <%--<asp:Repeater ID="rpFunds" runat="server">
                <ItemTemplate>
                    <a class="notas <%# Container.ItemIndex == 0? "first_nota":""%>" href=<%# "/Resources/Views/Funds/Fund.aspx?id=4" + Eval("FundId") %>>
                        <div style="position:absolute;right:37px;margin-top:-5px">
                            <i class='' style="font-size:8px"></i>
                        </div>
                        <div class="left">
                            <%# Eval("LegalName") %> 
                        </div>
                        <div class="right">
                            <div><%# ((decimal)Eval("NaVDelDia")).ToString("N2") %><i style="font-size:10px;margin-top:5px;font-style:normal;color:#dabe04"><%# Eval("Moneda") %> </i></div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>--%>

            <asp:Repeater ID="rpFunds" runat="server">
                <ItemTemplate>
                    <div class="notas_body notas_activos" style="margin-top:10px">
                        <div class="activos_header_group" style="position:sticky;top:85px;">
                            <div class="activos_header" style="background:black;">
                             <div style="position:absolute;bottom:20px;left:50%;color:#fff">
                              <i class="fas fa-chevron-down"></i>
                             </div>
                                <div class="left">
                                    <%# Eval("LegalName") %> 
                                </div>
                                <div class="right" style="margin: auto 20px auto 0;"><div><%# ((decimal)Eval("ValorNominalInversion")).ToString("N2") %> <i style="font-size:10px;margin-top:5px;font-style:normal;color:#dabe04"><%# Eval("Moneda") %></i></div></div>
                            </div>
                            <div class="activos_header_desc" style="z-index:1000;position:relative;background:black;">
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
                </ItemTemplate>
            </asp:Repeater>

        </div>
    <%}
        else
        {%>
        <div class="dash_header">
            <div class="resumenLabel" style="width: unset">
                <div align="right" style="float: left">
                    Fondos
                    <div style="height: 4px; width: 30px; background: #dabe04">
                    </div>
                </div>
            </div>
            
        </div>
        <div class="dash_body">
            <div style="color: white;text-align: center;width: auto;height: 50vh;padding-top: 10%;">
                Aún no tienes inversiones en Fondos. Conoce más sobre el producto <a runat="server" style="color: #d5b904" href="~/Resources/Views/Catalog/ZestCatalogFund.aspx">aquí </a>
            </div> 
        </div>
           
        
    <% } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(2)').addClass('active');
        });


        var t = true;
        function show_portfolio() {
            $('#dash_portfolio').toggleClass('active');
            $('#dash_body').toggle('500');
            if (t) {
                document.getElementsByTagName("body")[0].style.overflow = 'auto';
            }
            else {
                document.getElementsByTagName("body")[0].style.overflow = 'auto';
            }
            t = !t;
        }

        $('.activos_item_group').click(function () {
            $(this).toggleClass('active');
            $(this).find('.activos_desc').slideToggle(500);
        });

        $('.activos_header_group').click(function () {
            $(this).find('.activos_header_desc').slideToggle(500);
        });

    </script>
</asp:Content>
