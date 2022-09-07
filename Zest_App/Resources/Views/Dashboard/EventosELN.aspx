<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="EventosELN.aspx.cs" Inherits="Zest_App.Resources.Views.Dashboard.EventosELN" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="notas_menu" style="position:fixed">
        <asp:Literal ID="notas_menu" runat="server"></asp:Literal>
    </div>
    <div class="notas_body notas_activos"  style="position:sticky;top:85px;margin-top:50px">
        <div class="activos_header_group">
            <div class="activos_header">
                <div class="left">
                    <asp:Literal ID="nota_nombre" runat="server"></asp:Literal>
                    <span style="background:#dabe04;color:#000">
                        <asp:Literal ID="nota_vencimiento" runat="server"></asp:Literal>
                    </span>
                </div>
                <div class="right">
                   <div><asp:Literal ID="nota_valor" runat="server"></asp:Literal> <i style="font-size:10px;margin-top:5px;color:#dabe04;font-style:normal">USD</i></div>
                    <asp:Literal ID="nota_rentabilidad" runat="server"></asp:Literal>

                </div>
            </div>
        </div>
    </div>

    <div class="eventos_table">
        <table style="position:relative;z-index:-1">
            <thead>
                <tr>
                    <th>Periodo<br />
                        <br />
                    </th>
                    <th>Fecha de<br />
                        Observación</th>
                    <th>Fecha de<br />
                        Pago</th>
                     <th>Autocall</th>
                    <th>Rentabilidad<br />
                        Cupón</th>
                    <th>Dividendos</th>
                     <th>Impuestos</th>
                     <th>Redención</th>
                   
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpEventos" runat="server">
                    <ItemTemplate>
                        <tr class='<%# (Eval("PorcentajePagado")==null?0:(decimal)Eval("PorcentajePagado")) > 0?"active":"" %>'>
                            <td><%#((DateTime)Eval("Fecha_Observación")).ToString("yyyy-MM") %></td>
                            <td><%# ((DateTime)Eval("Fecha_Observación")).ToString("yyyy-MM-dd") %></td>
                            <td><%# ((DateTime)Eval("Fecha_Cupón")).ToString("yyyy-MM-dd") %></td>
                             <td><%# "-" %></td>
                            <td><%# Eval("PorcentajePagado")==null?"0":((Decimal)Eval("PorcentajePagado")).ToString("N2") %> %</td>
                            <td>$ <%# Eval("dividendos") != null? ((Decimal)Eval("dividendos")).ToString("N2") : ""%> </td>
                            <td>$ <%# Eval("impuestos") != null?  ((Decimal)Eval("impuestos")).ToString("N2") :"" %> </td>
                            <td>$ <%#  Eval("redencion") != null? ((Decimal)Eval("redencion")).ToString("N2"):"" %> </td>
                         
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
