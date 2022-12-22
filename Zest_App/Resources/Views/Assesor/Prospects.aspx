<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/appAssesor.Master" AutoEventWireup="true" CodeBehind="Prospects.aspx.cs" Inherits="Zest_App.Resources.Views.Assesor.Prospects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <asp:UpdatePanel ID="upTable" runat="server">
        <ContentTemplate>
             <div class="dash_header">
                <%--<div class="logo">
                    <asp:Image ID="img_logo" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" />
                </div>--%>
        <div style="margin:20px auto">
            <asp:TextBox ID="txtSearch" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" CssClass="form-control" runat="server" style="border:1px solid #333333;background:#000;color:#fff" placeholder="Buscar ..."></asp:TextBox>
        </div>
    </div>
    <div class="dash_portfolio active">

        <asp:Repeater ID="rpInvestors" runat="server">
            <ItemTemplate>
                <div class="notas" href="#">
                    <div style="position: absolute; right: 37px; margin-top: -5px">
                    </div>

                    <div class="left">
                        <b style="font-size: 13px; font-weight: normal">
                            <%# Eval("nombre") %>
                        </b>
                        <b style="font-size: 11px; font-weight: normal">
                           Me interesa la <b style="color:#DABE04"> <%# Eval("nota") %></b>
                        </b>
                       
                    </div>
                    <div class="right">
                        <a href='tel: <%# Eval("telefono") %>' style="font-size: 11px; font-weight: normal; color: #fff;margin-bottom:10px">
                            <%# Eval("telefono") %> <b style="color: #dabe04"><i class="fas fa-phone-alt"></i></b>
                        </a>
                        <span style="font-size:10px;color:#cacaca">
                            Fecha: <%# ((DateTime)Eval("created_at")).ToString("dd MMM yy", new System.Globalization.CultureInfo("es-ES")) %>
                        </span>
                        <asp:LinkButton ID="btnDelete" OnClick="btnDelete_Click" runat="server" CommandArgument='<%# Eval("id") %>' style="color:#fff;font-size:10px;margin-top:5px">
                            <i class="fas fa-trash"></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
      <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(2)').addClass('active');
        });
      </script>
</asp:Content>
