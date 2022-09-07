<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ActivosELN.aspx.cs" Inherits="Zest_App.Resources.Views.Dashboard.ActivosELN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
    <style>
        .bg-up{
            color: #1ecd93 !important;
        }
        .bg-down{
            color: #d34646 !important;
        }
    </style>
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
                    <asp:Literal ID="nota_nombre" runat="server"></asp:Literal>
                    <span style="background:#dabe04;color:#000">
                        <asp:Literal ID="nota_vencimiento" runat="server"></asp:Literal>
                    </span>
                </div>
                <div class="right">
                     <div><asp:Literal ID="nota_valor" runat="server"></asp:Literal> <i style="font-size:10px;margin-top:5px;font-style:normal;color:#dabe04">USD</i></div>
                    <asp:Literal ID="nota_rentabilidad" runat="server"></asp:Literal>

                </div>
            </div>
            <div class="activos_header_desc" style="z-index:1000;position:relative">
                <div class="row">
                    <div class="col-6">
                        <span>Emisor</span>
                        <br />
                        <asp:Literal ID="nota_emisor" runat="server"></asp:Literal>
                        <br />
                        <br />
                        <span>ISIN</span>
                        <br />
                        <asp:Literal ID="nota_isin" runat="server"></asp:Literal>
                        <br />
                        <br />
                         <span>Moneda</span>
                        <br />
                        <asp:Literal ID="nota_moneda" runat="server"></asp:Literal>
                       

                    </div>
                    <div class="col-6">
                        <span>Rentabilidad de Cupón</span>
                        <br />
                        <asp:Literal ID="nota_rent" runat="server"></asp:Literal>%
                        <br />
                        <br />
                        <span>Barrera de Capital</span>
                        <br />
                        <asp:Literal ID="nota_barrera_capital" runat="server"></asp:Literal>%
                        <br />
                        <br />
                        <span>Barrera de Cupón</span>
                        <br />
                        <asp:Literal ID="nota_barrera_cupon" runat="server"></asp:Literal>%

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
                    
                        <i class="fas fa-chevron-down" style="position:absolute;bottom:20px;right:20px;color:#fff;z-index:-2"></i>
                    <div class="activos_item" style="min-height:80px;z-index:-3;position:relative">
                      
                        <div class="left">
                            
                           <%#  Eval("Description") %>
                           
                        <span style="font-weight:lighter;color:#fff;font-size:unset">
                            <%# Eval("Symbol") %> 
                        </span>
                        </div>
                        <div class="right" style="min-width:90px;font-size:4vw">

                             <%#  Eval("InitialPrice") == null ? "0.00": ((Decimal)Eval("InitialPrice")).ToString("N2") %>
                            <span><%# Eval("currency") %></span>

                        <span style="display:block;font-size:unset" class='<%# (Eval("lprice") == null ? 0: (Decimal)Eval("lprice")) > (Eval("InitialPrice") == null ? 0: (Decimal)Eval("InitialPrice")) ? "bg-up":"bg-down" %>'>
                            <i class='<%# (Eval("lprice") == null ? 0: (Decimal)Eval("lprice")) > (Eval("InitialPrice") == null ? 0: (Decimal)Eval("InitialPrice")) ? "fas fa-sort-up bg-up":"fas fa-sort-down bg-down" %>'></i>
                            <%#  Eval("lprice") == null ? "0.00": ((Decimal)Eval("lprice")).ToString("N2") %>
                        </span>
                        </div>
                    </div>
                    <div class="activos_desc" style="position:relative;z-index:-1;background:#000">
                        <div class="row">
                            <div class="col-5" style="display:flex">
                                <div style="margin:auto">
                                    <img src='<%# loadLogo(Eval("Symbol").ToString()) %>' width="100px" />
                                </div>
                            </div>
                            <div class="col-7">
                                 <div style="display: inline-flex; width: 100%">
                                    <div style="margin: auto auto auto 0px;font-weight:bold">
                                        Precio:
                                    </div>
                                    <div style="margin: auto 0px auto auto">
                                       
                                    </div>
                                </div>
                                <div style="display: inline-flex; width: 100%">
                                    <div style="margin: auto auto auto 0px">
                                        Entrada
                                    </div>
                                    <div style="margin: auto 0px auto auto">
                                    <%# Eval("InitialPrice") == null ? "0.00": ((Decimal)Eval("InitialPrice")).ToString("N2") %> <i style="font-style:normal;color:#dabe04"><%# Eval("currency") %></i>
                                    </div>
                                </div>
                               
                                <div style="display: inline-flex; width: 100%">
                                    <div style="margin: auto auto auto 0px">
                                       Barrera de Cupón
                                    </div>
                                    <div style="margin: auto 0px auto auto">
                                       <%# Eval("CuponPriceBarrier") == null ? "0.00": ((Decimal)Eval("CuponPriceBarrier")/100).ToString("N2") %> <i style="font-style:normal;color:#dabe04"><%# Eval("currency") %></i>
                                    </div>
                                </div>

                                  <div style="display: inline-flex; width: 100%">
                                    <div style="margin: auto auto auto 0px">
                                       Barrera de Capital
                                    </div>
                                    <div style="margin: auto 0px auto auto">
                                       <%# Eval("MaturityPriceBarrier") == null ? "0.00": ((Decimal)Eval("MaturityPriceBarrier")/100).ToString("N2") %> <i style="font-style:normal;color:#dabe04"><%# Eval("currency") %></i>
                                    </div>
                                </div>
                                <br />
                                <br />
                                  <div style="display: inline-flex; width: 100%">
                                    <div style="margin: auto auto auto 0px">
                                        Mercado
                                    </div>
                                    <div style="margin: auto 0px auto auto">
                                         <%# Eval("lprice") == null ? "0.00": ((Decimal)Eval("lprice")).ToString("N2") %> <i style="font-style:normal;color:#dabe04"><%# Eval("currency") %></i>
                                    </div>
                                </div>
                                  <div style="display: inline-flex; width: 100%">
                                    <div style="margin: auto auto auto 0px">
                                        Variación
                                    </div>
                                    <div style="margin: auto 0px auto auto;" class='<%# (Eval("lprice") == null ? 0: (Decimal)Eval("lprice")) > (Eval("InitialPrice") == null ? 0: (Decimal)Eval("InitialPrice")) ? "bg-up":"bg-down" %>'>
                                        <i class='<%# (Eval("lprice") == null ? 0: (Decimal)Eval("lprice")) > (Eval("InitialPrice") == null ? 0: (Decimal)Eval("InitialPrice")) ? "fas fa-sort-up bg-up":"fas fa-sort-down bg-down" %>'></i>
                                         <%#  Eval("lprice") == null ? "0.00":((((Decimal)Eval("lprice")- (Decimal)Eval("InitialPrice"))/(Decimal)Eval("InitialPrice"))*100).ToString("N2")%> %
                                    </div>
                                </div>
                              
                            </div>
                            <div class="col-12 text-right" style="margin-top: 5px">
                                <%# (DateTime.Now).ToString("dd MMM HH:mm") %> - Info en tiempo real
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>


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
    </script>
</asp:Content>
