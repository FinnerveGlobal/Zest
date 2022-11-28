<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestFundsAnalisis.aspx.cs" Inherits="Zest_App.Resources.Views.Funds.ZestFundsAnalisis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                <a href="ZestFundsEvents.aspx?symbol=<%=Symbol.Replace(" ","+") %>" style="color: #333333">
                   Eventos
                </a>
                <div style="height: 4px; width: 30px; background: #dabe04; display: none"></div>
            </div>
            <div class="col-4" style="padding-left: 30px;">
                Análisis
                <div style="height: 4px; width: 30px; background: #dabe04; margin-left: 29px;"></div>
            </div>
        </div>
    </div>

    <div class="analisis_group" style="margin-top: 50px;">
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
