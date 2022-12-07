<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ActivosCLN.aspx.cs" Inherits="Zest_App.Resources.Views.Dashboard.ActivosCLN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
    <a style="color:#fff;position: absolute;top:30px;left:80px;z-index: 100000;" href="Resumen.aspx"><i class="fas fa-chevron-left"></i></a>
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
                    
                     
                    <div class="activos_item" style="min-height:80px;z-index:-3;position:relative">
                      
                        <div class="left">
                            
                           <%#  Eval("Description") %>
                           
                        <span style="font-weight:lighter;color:#fff;font-size:unset">
                            <%# Eval("Symbol") %> 
                        </span>
                        </div>
                        <div class="right" style="min-width:90px;font-size:4vw">
                             <span><%# Eval("currency") %></span>

                       
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
