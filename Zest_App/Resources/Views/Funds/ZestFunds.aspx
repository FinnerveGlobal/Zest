<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestFunds.aspx.cs" Inherits="Zest_App.Resources.Views.Funds.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(2)').addClass('active');
        });
    </script>
</asp:Content>
