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

         /* Clases CSS para el tooltip */
        /* Clases CSS para el tooltip */
        .tooltip-inner{
            padding: 6px 7px;
            color: black;
            text-align: center;
            font-size: 0.6rem;
            background-color: #dabe04;
            border: 1px solid #dabe04;
            font-family: 'Open Sans';
            -webkit-border-radius: 9px;
            -moz-border-radius: 9px;
            border-radius: 4px;
        }

        .bs-tooltip-auto[x-placement^=top] .arrow::before, .bs-tooltip-top .arrow::before{
            border-top-color: #dabe04;
        }

        .tooltip.bs-tooltip-top.show[x-placement^=top] .tooltip-inner{
            margin-left: 5.5em;
        }

        .bs-tooltip-auto[x-placement^=top] .arrow, .bs-tooltip-top .arrow{
            bottom: 1px;
        }

        .tooltip.show{
            opacity: 1 !important;
        }

        .bs-tooltip-auto[x-placement^=bottom] .arrow::before, .bs-tooltip-bottom .arrow::before{
            border-bottom-color: #dabe04;
        }

        .bs-tooltip-auto[x-placement^=bottom] .arrow, .bs-tooltip-bottom .arrow{
            top: 2px;
        }

        .tooltip.bs-tooltip-bottom.show[x-placement^=bottom] .tooltip-inner{
            margin-left: 5em;
        }

        /* CSS para botones de la gráfica*/
        .btn-graph{
            color: white;
            background-color: black;
            border: 0px;
            font-size: 10px;
        }

        .btn-graph.active{
            background-color: #dabe04;
            color: black;
            font-weight: bolder;
        }

        .dash_portfolio{
            margin-top: 0px;
        }
    </style>
    <%-- JS para los tooltips --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <% if (HasFunds)
        { %>
        <div class="dash_header">
            <div class="resumenLabel" style="width: unset">
                <%--<div align="right" style="float: left">
                    Fondos
                    <div style="height: 4px; width: 30px; background: #dabe04">
                    </div>
                </div>--%>
            </div>
            <div class="resumen">
                <div class="left">
                    <span style="display: block">
                        <asp:Literal ID="valor_nominal" runat="server"></asp:Literal>
                        <i style="font-style: normal; color: #dabe04">USD</i>
                        
                        <i style="display: inline-flex; margin: 0px 0px 0px 5px" data-toggle="tooltip" data-placement="top" data-animation="false" data-html="true" title="<div class='info-tooltip'>Valor Nominal <br> de la inversión</>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                              <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                            </svg>
                        </i>
                    </span>
                    <p>
                        <asp:Literal ID="nav_del_dia" runat="server"></asp:Literal>
                        <span style="display: inline-block;padding-right: 0px;">USD</span>
                        <i style="display: inline-flex;" data-toggle="tooltip" data-placement="top" data-animation="false" data-html="true" title="<div class='info-tooltip'>NAV del día en $</>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                              <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                            </svg>
                        </i>
                    </p>
                    
                    <% if (IsPositive)
                        { %>
                        <span style="display: block; color: yellowgreen;">
                    <% }
                        else
                        { %>
                        <span style="display: block; color: red;">
                    <% } %>
                    
                        <asp:Literal ID="rentabilidad_acumulada"  runat="server"></asp:Literal>
                        <i style="font-style: normal">%</i>
                        <i style="display: inline-flex; margin: 0px 0px 0px 5px; color: white;" data-toggle="tooltip" data-placement="bottom" data-animation="false" data-html="true" title="<div class='info-tooltip'>Rentabilidad <br> Acumulada</>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                              <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                            </svg>
                        </i>
                    </span>
                            
                </div>
                <div class="right" style="color: #fff">
                    <% if (IsPositiveDividendosAcumulados) { %>
                        <span>
                            <asp:Literal ID="dividendos_acumulados" runat="server"></asp:Literal>
                            <i style="font-style: normal; color: #dabe04">USD</i>
                            <i style="display: inline-flex; margin: 0px 0px 0px 5px; color: white;" data-toggle="tooltip" data-placement="top" data-animation="false" data-html="true" title="<div class='info-tooltip'>Dividendos acumulados</>">
                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                  <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                </svg>
                            </i>
                        </span>
                    <%} %>
                    <br />
                    <span></span>
                </div>
            </div>
        </div>
        <div id="dash_body" class="dash_body">
            <div id="body_grafico" class="body_item1 active">
                <asp:Literal ID="ltChart" runat="server"></asp:Literal>
            </div>
        </div>
        <div id="div-group-button" class="d-flex justify-content-around px-3 mt-2">
            <asp:Button runat="server" Text="Día" CssClass="btn-graph" OnClick="btnDay_Click" />
            <asp:Button runat="server" Text="Mes" CssClass="btn-graph" OnClick="btnMonth_Click" />
            <%--<asp:Button runat="server" Text="Año" CssClass="btn-graph" OnClick="btnYear_Click"/>
            <asp:Button runat="server" Text="Desde el Año" CssClass="btn-graph" OnClick="btnFromBeginning_Click" />--%>
        </div>
        <div id="dash_portfolio" class="dash_portfolio" >
            <div class="port_header" onclick="show_portfolio()">
                Portafolio
                <br />
                <i class="fas fa-chevron-up off" style="position:fixed;bottom:80px"></i>
                <i class="fas fa-chevron-down on"></i>
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
                    <a class="notas first_nota" href=<%# "ZestFundsDetail.aspx?symbol=" + Eval("Symbol").ToString().Replace(" ","+") %> >
                        <div class="left">
                           <%# Eval("Symbol") %>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    <%}
        else
        {%>
        
        <div class="dash_body" style="height: 100vh;">
            <div class="d-flex justify-content-center align-items-center" style="color: white;text-align: center;width: auto;height: 75vh;">
               <p style="display:block">
                Aún no tienes inversiones en Fondos. Conoce más sobre el producto <a runat="server" style="color: #d5b904" href="~/Resources/Views/Catalog/ZestCatalogFund.aspx">aquí </a>
               </p>
            </div>
        </div>
           
        
    <% } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        // Enable tooltips everywhere
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        });

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

        function active_btn_graph(index) {
            $('#div-group-button').find('.btn-graph').removeClass('active');
            $('#div-group-button').find('.btn-graph:nth-child(' + index + ')').addClass('active');
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
