<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="Fund.aspx.cs" Inherits="Zest_App.Resources.Views.Funds.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="notas_menu" style="position:fixed">
        <asp:Literal ID="notas_menu" runat="server"></asp:Literal>
    </div>
    <div class="notas_body notas_activos" style="margin-top:50px">
        <div class="activos_header_group" style="position:sticky;top:85px">
            <div class="activos_header">
             <div style="position:absolute;bottom:20px;left:50%;color:#fff">
              <i class="fas fa-chevron-down"></i>
             </div>
                <div class="left">
                    nota_nombre
                    <span style="background:#dabe04;color:#000">
                        nota_vencimiento
                    </span>
                </div>
                <div class="right">
                     <div>nota_valor <i style="font-size:10px;margin-top:5px;font-style:normal;color:#dabe04">USD</i></div>
                    nota_rentabilidad

                </div>
            </div>
            <div class="activos_header_desc" style="z-index:1000;position:relative">
                <div class="row">
                    <div class="col-6">
                        <span>Emisor</span>
                        <br />
                        nota_emisor
                        <br />
                        <br />
                        <span>ISIN</span>
                        <br />
                        nota_isin
                        <br />
                        <br />
                         <span>Moneda</span>
                        <br />
                        nota_moneda
                       

                    </div>
                    <div class="col-6">
                        <span>Rentabilidad de Cupón</span>
                        <br />
                        nota_rent%
                        <br />
                        <br />
                        <span>Barrera de Capital</span>
                        <br />
                        nota_barrera_capital%
                        <br />
                        <br />
                        <span>Barrera de Cupón</span>
                        <br />
                        nota_barrera_cupon%

                    </div>
                </div>
            </div>
        </div>

        <div class="lista_header">
            Lista 
        </div>

        <asp:Repeater ID="rpActivos" runat="server">
            <ItemTemplate>

                <div class="activos_item_group" style="position:relative">
                    
                     
                    <div class="activos_item" style="min-height:80px;z-index:-3;position:relative">
                      
                        <div class="left">
                            
                           Description
                           
                        <span style="font-weight:lighter;color:#fff;font-size:unset">
                            Symbol
                        </span>
                        </div>
                        <div class="right" style="min-width:90px;font-size:4vw">
                             currency

                        </div>
                    </div>
                 
                </div>
            </ItemTemplate>

        </asp:Repeater>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(2)').addClass('active');
        });

        $('.activos_item_group').click(function () {
            $(this).toggleClass('active');
            $(this).find('.activos_desc').slideToggle(500);
        });

        $('.activos_header_group').click(function () {
            $(this).find('.activos_header_desc').slideToggle(500);
        });
    </script>
</asp:Content>
