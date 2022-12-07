<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestFundsAnalisis.aspx.cs" Inherits="Zest_App.Resources.Views.Funds.ZestFundsAnalisis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <a style="color:#fff;position: absolute;top:30px;left:80px;z-index: 100000;" href="ZestFunds.aspx"><i class="fas fa-chevron-left"></i></a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

        <div class="notas_menu">
            <a class="menu_item btn_load" href="ZestFundsDetail.aspx?symbol=<%=Symbol.Replace(" ","+") %>">
                Detalles
                <span></span>
            </a>
                
            <a class="menu_item btn_load" href="ZestFundsEvents.aspx?symbol=<%=Symbol.Replace(" ","+") %>">
                Eventos
                <span></span>
            </a>
                
            <a class="menu_item btn_load active" href="ZestFundsAnalisis.aspx?symbol=<%=Symbol.Replace(" ","+") %>">
                Análisis 
                <span></span>
            </a>    
        </div>


    <div class="analisis_group" style="margin-top: 0px;">
        <asp:Repeater ID="rpReviews" runat="server">
            <ItemTemplate>
                <div class='<%# Container.ItemIndex == 0? "analisis active":"analisis" %>'>
                    <div class="analisis_header">
                        <div class="nota_title" style="color:#dabe04">
                            <%# Eval("titulo") %>
                        </div>
                        <div class="nota_fecha">
                            <%# ((DateTime)Eval("created_at")).ToString("MMM yyyy") %>
                        </div>
                    </div>
                    <div class="analisis_body" style="text-align:left;height:unset;padding-left:0px">
                        <%# Eval("texto") %>
                        <div class="buttons">
                            <asp:LinkButton ID="btnPdf" Visible='<%# string.IsNullOrEmpty(Eval("url").ToString())? false:true %>' OnClick="btnPdf_Click" CssClass="right btn_load" style="color:#dabe04;margin:auto 1px auto auto;border-bottom-right-radius:0px" runat="server" CommandArgument='<%# Eval("url") %>'>ver</asp:LinkButton>
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
    </script>
</asp:Content>
