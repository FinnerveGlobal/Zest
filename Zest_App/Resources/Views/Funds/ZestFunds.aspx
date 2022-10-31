<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestFunds.aspx.cs" Inherits="Zest_App.Resources.Views.Funds.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="dash_header">
        <div class="resumenLabel" style="width: unset">
            <div align="right" style="float: left">
                Fondos
             <div style="height: 4px; width: 30px; background: #dabe04">
             </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    
    

    <% if (!Test)
        { %>
        <div style="color: white; text-align: center">
        Aún no tienes inversiones en Fondos. Conoce más sobre el producto <a runat="server" style="color: #d5b904" href="~/Resources/Views/Catalog/ZestCatalog.aspx"> aquí </a>
        </div>
    <%}
        else
        {%>
        <div style="color: white; text-align: center">
            Si hay fondos
        </div>
    <% } %>

    <div id="dash_body" class="dash_body">
        <div id="body_grafico" class="body_item1 active">
            <canvas id="line-chart" width="100%" height="90"></canvas>
            <script>
                new Chart(document.getElementById("line-chart"),
                    {
                        type: 'line',
                        data:
                        {
                            labels: ['Oct-21', 'Nov-21', 'Dic-21', 'Ene-22', 'Feb-22', 'Mar-22', 'Abr-22', 'May-22', 'Jun-22', 'Jul-22', 'Ago-22', 'Sep-22', 'Oct-22'],
                            datasets: [
                                {
                                    data: [57.52, 57.90, 58.89, 60.84, 61.99, 74.32, 74.04, 75.13, 73.55, 74.00, 74.16, 69.85, 70.09],
                                    label: "Rentabilidad", borderColor: "#d5b904",
                                    backgroundColor: 'rgba(213,185,4,.1)',
                                    fill: true, fontSize: 7, yAxisID: 'first-y-axis'
                                }, {
                                    data: [67.52, 67.90, 68.89, 70.84, 71.99, 84.32, 84.04, 85.13, 83.55, 84.00, 84.16, 79.85, 80.09],
                                    label: "Rentabilidad", borderColor: "#d5e9ff", backgroundColor: '#fff', fill: false, fontSize: 7, yAxisID: 'first-y-axis'
                                }, {
                                    data: [1.52, 1.90, 3.89, 1.84, 2.99, 1.32, 2.04, 2.13, 2.55, 2.00, 4.16, 5.85, 5.09],
                                    label: "Rentabilidad", borderColor: "#d5e9ff", backgroundColor: '#fff', fill: false, fontSize: 7, type: 'bar', yAxisID: 'second-y-axis'
                                }]
                        }, options: {
                            title: {
                                display: false
                            },
                            legend:
                            {
                                display: false
                            },
                            scales: {
                                xAxes: [{ ticks: { fontSize: 10, fontColor: '#fff' } }],
                                yAxes: [
                                    {
                                        id: 'first-y-axis',
                                        type: 'linear',
                                        position: 'left',
                                        ticks: {
                                            fontSize: 10,
                                            fontColor: '#fff',
                                            callback: function (value, index, values) { return value + '%'; }
                                        }
                                    }, {
                                        id: 'second-y-axis',
                                        type: 'linear',
                                        position: 'right',
                                        ticks: {
                                            fontSize: 10,
                                            fontColor: '#fff',
                                            callback: function (value, index, values) { return value + '%'; },
                                            suggestedMin: 0,
                                            suggestedMax: 40
                                        },
                                    }]
                            }
                        }
                    });
            </script>
        </div>
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
