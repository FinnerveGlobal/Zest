<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="Resumen.aspx.cs" Inherits="Zest_App.Resources.Views.Dashboard.Resumen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
    <style>
        .body{
            overflow: hidden !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <% if (HasNotes) { %>
        <div class="dash_header">
        <%--<div class="logo">
            <asp:Image ID="img_logo" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" />
        </div>--%>
        <div class="resumenLabel">
            Resumen
        </div>
        <div class="resumen">
            <div class="left">
               
                <asp:Literal ID="valor_resumen" runat="server"></asp:Literal> <span>USD
                </span>
            </div>
            <div class="right" style="color:#fff">
                <%--<span>
                    <asp:Literal ID="rentabilidad_resumen" runat="server"></asp:Literal>%
                </span><br />--%>
                 <asp:Literal ID="usd_rentabilidad_resumen" runat="server"></asp:Literal> <i style="font-style:normal;color:#dabe04">USD</i>
            </div>
        </div>
    </div>
        <div id="dash_body" class="dash_body">
       <div class="menu zgrid_5">
<%--          <a id="menu_grafico" onclick="toggle_menu()" class="menu_item active" style="margin-left: 0px">gráfico
                <span></span>
            </a>--%>
          <%--<a id="menu_cuadro" onclick="toggle_menu()" class="menu_item active" style="margin-right: 0px;">cuadro
                <span></span>
            </a>--%>
        </div>

       <div id="body_grafico" class="body_item1">
            <asp:Literal ID="ltChart" runat="server"></asp:Literal>
        </div>
        <div id="body_cuadro" class="body_item2">

            <div id="last_3" class="b_line active">
                <div id="last_3_first" class="b_cell active" onclick="show_3()">
                   <asp:Literal ID="lt1" runat="server"></asp:Literal>
                    <span>Últimos 3 meses</span>
                </div>
                <div class="b_cell">
                    <span>
                        <asp:Literal ID="ltp1" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm1" runat="server"></asp:Literal>%
                </div>
                <div class="b_cell">
                       <span>
                        <asp:Literal ID="ltp2" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm2" runat="server"></asp:Literal>%
                </div>
                <div class="b_cell">
                       <span>
                        <asp:Literal ID="ltp3" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm3" runat="server"></asp:Literal>%
                </div>
            </div>
            <div id="last_6" class="b_line">
                <div id="last_6_first" class="b_cell" onclick="show_6()">
                   <asp:Literal ID="lt2" runat="server"></asp:Literal>
                    <span>Últimos 6 meses</span>
                </div>
                <div class="b_cell">
                       <span>
                        <asp:Literal ID="ltp4" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm4" runat="server"></asp:Literal>%
                </div>
                <div class="b_cell">
                       <span>
                        <asp:Literal ID="ltp5" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm5" runat="server"></asp:Literal>%
                </div>
                <div class="b_cell">
                     <span>
                        <asp:Literal ID="ltp6" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm6" runat="server"></asp:Literal>%
                </div>
            </div>
            <div id="last_9" class="b_line">
                <div id="last_9_first" class="b_cell" onclick="show_9()">
                   <asp:Literal ID="lt3" runat="server"></asp:Literal>
                    <span>Últimos 9 meses</span>
                </div>
                <div class="b_cell">
                     <span>
                        <asp:Literal ID="ltp7" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm7" runat="server"></asp:Literal>%
                </div>
                <div class="b_cell">
                     <span>
                        <asp:Literal ID="ltp8" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm8" runat="server"></asp:Literal>%
                </div>
                <div class="b_cell">
                      <span>
                        <asp:Literal ID="ltp9" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm9" runat="server"></asp:Literal>%
                </div>
            </div>
            <div id="last_12" class="b_line">
                <div id="last_12_first" class="b_cell" onclick="show_12()">
                   <asp:Literal ID="lt4" runat="server"></asp:Literal>
                    <span>Últimos 12 meses</span>
                </div>
                <div class="b_cell">
                       <span>
                        <asp:Literal ID="ltp10" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm10" runat="server"></asp:Literal>%
                </div>
                <div class="b_cell">
                       <span>
                        <asp:Literal ID="ltp11" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm11" runat="server"></asp:Literal>%
                </div>
                <div class="b_cell">
                       <span>
                        <asp:Literal ID="ltp12" runat="server"></asp:Literal>
                    </span>
                        <asp:Literal ID="ltm12" runat="server"></asp:Literal>%
                </div>
            </div>
        </div>
    </div>
        <div id="dash_portfolio" class="dash_portfolio" >
        <div class="port_header" onclick="show_portfolio()">
            Portafolio 
            <br />
            <%--<i class="fas fa-chevron-up off" style="position:fixed;bottom:80px"></i>--%>
            <%--<i class="fas fa-chevron-down on"></i>--%>
        </div>

        <asp:Repeater ID="rpNotas" runat="server">
            <ItemTemplate>
                <a class="notas first_nota" href='<%# Eval("tipo_nota").ToString() == "EQUITY"?"#":("Activos"+(Eval("tipo_nota").ToString() == "GARANTIZADO"?"ELN":Eval("tipo_nota"))+".aspx?id="+Eval("codigo")+"&type="+Eval("tipo_nota")) %>'>
                    
                    <div style="position:absolute;right:37px;margin-top:-5px">
                        <i class='<%# returnNot(Eval("codigo").ToString()) %>' 
                          style="font-size:8px"></i></div>
                    
                    <div class="left">
                       <%# Eval("tipo_nota") == "EQUITY"?"":"Nota " %> <%# Eval("codigo") %> 
                        
                        <span style="margin-top:5px;width:100px;background:#dabe04;color:#000"><%# ((DateTime)Eval("vencimiento")).ToString("dd MMM yy", new System.Globalization.CultureInfo("es-ES")) %>
                        </span>
                    </div>
                    <div class="right">
                        <div><%# ((Double)Eval("valor")).ToString("N0") %> <i style="font-size:10px;margin-top:5px;font-style:normal;color:#dabe04"><%# Eval("moneda") %></i></div> 
                        <span style="color:#1ecd93"><i class="fas fa-sort-up"></i>
                           <%# Eval("dividendos") == null? "": ((decimal)Eval("dividendos")).ToString("N0") %>   <i style="font-size:7px;font-style:normal;color:#dabe04">  <%# Eval("moneda") %></i> 
                        </span>
                    </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>

    </div>
    <% }else { %>
        <div class="dash_body" style="height: 100vh;">
            <div class="d-flex justify-content-center align-items-center" style="color: white;text-align: center;width: auto;height: 75vh;">
               <p style="display:block">
                Aún no tienes inversiones en Notas. Conoce más sobre el producto <a runat="server" style="color: #d5b904" href="~/Resources/Views/Catalog/ZestCatalog.aspx">aquí </a>
               </p>
            </div>
        </div>
    <% } %>

    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        //function toggle_menu() {
        //    $('#body_grafico').toggleClass('active');
        //    $('#body_cuadro').toggleClass('active');
        //    $('#menu_cuadro').toggleClass('active');
        //    $('#menu_grafico').toggleClass('active');
        //}

        //$('#body_grafico').on('swipeleft', function (e, data) {
        //    toggle_menu();
        //});
        //$('#body_cuadro').on('swiperight', function (e, data) {
        //    toggle_menu();
        //});

        function show_3() {
            $('#last_3').addClass('active');
            $('#last_3_first').addClass('active');
            $('#last_6').removeClass('active');
            $('#last_6_first').removeClass('active');
            $('#last_9').removeClass('active');
            $('#last_9_first').removeClass('active');
            $('#last_12').removeClass('active');
            $('#last_12_first').removeClass('active');
        }
        function show_6() {
            $('#last_3').addClass('active');
            $('#last_3_first').removeClass('active');
            $('#last_6').addClass('active');
            $('#last_6_first').addClass('active');
            $('#last_9').removeClass('active');
            $('#last_9_first').removeClass('active');
            $('#last_12').removeClass('active');
            $('#last_12_first').removeClass('active');
        }
        function show_9() {
            $('#last_3').addClass('active');
            $('#last_3_first').removeClass('active');
            $('#last_6').addClass('active');
            $('#last_6_first').removeClass('active');
            $('#last_9').addClass('active');
            $('#last_9_first').addClass('active');
            $('#last_12').removeClass('active');
            $('#last_12_first').removeClass('active');
        }
        function show_12() {
            $('#last_3').addClass('active');
            $('#last_3_first').removeClass('active');
            $('#last_6').addClass('active');
            $('#last_6_first').removeClass('active');
            $('#last_9').addClass('active');
            $('#last_9_first').removeClass('active');
            $('#last_12').addClass('active');
            $('#last_12_first').addClass('active');
        }
        var t = true;
        function show_portfolio() {
            //$('#dash_portfolio').toggleClass('active');
            //$('#dash_body').toggle('500');
            //if (t) {
            //    document.getElementsByTagName("body")[0].style.overflow = 'auto';
            //}
            //else {
            //    document.getElementsByTagName("body")[0].style.overflow = 'hidden';
            //}
            //t = !t;
        }

        $('#dash_portfolio').on('swipeup', function (e, data) {
            show_portfolio();
            document.getElementsByTagName("body")[0].style.overflow = 'auto';
        });

        $('#dash_portfolio').on('swipedown', function (e, data) {
            show_portfolio();
            document.getElementsByTagName("body")[0].style.overflow = 'hidden';
        });

    </script>
</asp:Content>
