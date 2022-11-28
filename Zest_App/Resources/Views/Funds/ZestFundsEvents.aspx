<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestFundsEvents.aspx.cs" Inherits="Zest_App.Resources.Views.Funds.ZestFundsEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        ::-webkit-scrollbar {
            -webkit-appearance: none;
        }

            ::-webkit-scrollbar:vertical {
                width: 3px;
            }

            ::-webkit-scrollbar:horizontal {
                height: 3px;
            }

        ::-webkit-scrollbar-thumb {
            background-color: #d5b904;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-track {
            border-radius: 10px;
            background-color: #333333;
        }
        
        .eventos_table table th:first-child, .eventos_table table td:first-child{
            position: initial;
            margin-left: 0;
        }

        .eventos_table table th:nth-child(2), .eventos_table table td:nth-child(2){
            padding-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="dash_header">
        <div class="resumenLabel row" style="width: unset">
            <div class="col-4" style="padding-left: 30px;">
                <a href="ZestFundsDetail.aspx?symbol=<%=Symbol.Replace(" ","+") %>" style="color: #333333">
                   Detalles
                </a>
                <div style="height: 4px; width: 30px; background: #dabe04; display: none"></div>
            </div>
            <div class="col-4" style="padding-left: 30px;">
                Eventos
                <div style="height: 4px; width: 30px; background: #dabe04; margin-left: 29px;"></div>
            </div>
            <div class="col-4" style="padding-left: 30px;">
                <a href="ZestFundsAnalisis.aspx?symbol=<%=Symbol.Replace(" ","+") %>" style="color: #333333">
                    Análisis
                </a>
                <div style="height: 4px; width: 30px; background: #dabe04; display: none"></div>
            </div>
        </div>
    </div>


    <div class="notas_body notas_activos"  style="top:85px;margin-top:50px">
        <div class="activos_header_group">
            <div class="activos_header">
                <div class="left">
                    <asp:Literal ID="nota_nombre" Text="Fondo Zest Estructurado" runat="server"></asp:Literal>
                    <%--<span style="background:#dabe04;color:#000">
                        <asp:Literal ID="nota_vencimiento" runat="server"></asp:Literal>
                    </span>--%>
                </div>
                <div class="right">
                   <%--<div><asp:Literal ID="nota_valor" runat="server"></asp:Literal> <i style="font-size:10px;margin-top:5px;color:#dabe04;font-style:normal">USD</i></div>
                    <asp:Literal ID="nota_rentabilidad" runat="server"></asp:Literal>--%>
                </div>
            </div>
        </div>
    </div>

    <div class="eventos_table">
        <table style="position:relative;z-index:-1">
            <thead>
                <tr>
                    <th>Periodo</th>
                    <th>Fecha de Pago</th>
                    <th>Rentabilidad<br />
                        del Perido</th>
                    <th>Dividendos</th>
                    <th>Impuestos</th>
                    <th>Redención</th>              
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpEventos" runat="server">
                    <ItemTemplate>
                        <tr class='<%# ((int)Eval("Historic")) > 0? "active":""  %>'>
                            <td><%# Eval("Year").ToString() %>-<%# Eval("Month").ToString() %></td>
                            <td><%# ((DateTime)Eval("PaymentDate")).ToString("yyyy-MM-dd") %></td>
                            <td><%# Eval("PeriodPerformance") != null? ((Decimal)Eval("PeriodPerformance")).ToString("N2"):"" %> %</td>
                            <td>$ <%# Eval("Dividend") != null? ((Decimal)Eval("Dividend")).ToString("N2"):"" %></td>
                            <td>$ <%# Eval("Tax") != null? ((Decimal)Eval("Tax")).ToString("N2"):"" %></td>
                            <td>$ <%# Eval("Redemption") != null? ((Decimal)Eval("Redemption")).ToString("N2"):"" %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(2)').addClass('active');
        });
    </script>
</asp:Content>
