<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="Zest_App.Resources.Views.More.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .more_title {
            width: 100%;
            padding-top: 10px;
            padding-bottom: 10px;
            text-align: center;
            color: #fff;
            font-weight: bold;
        }

        .more_body {
            padding: 20px;
        }

            .more_body .m_label {
                color: #fff;
                margin-bottom: 10px;
                font-size: 11px;
                display: block;
            }

            .more_body .m_text {
                border: 1px solid #333333;
                border-top-left-radius: 10px;
                padding: 10px;
                color: #fff;
                background: transparent;
                width: 100%;
                font-size: 10px;
            }

        .m_btns {
            display: inline-flex;
            width: 100%;
        }

            .m_btns .left {
                border: 1px solid #333333;
                border-top-left-radius: 10px;
                padding-top: 8px;
                padding-bottom: 8px;
                width: 110px;
                color: #fff;
                text-align: center;
                margin: 20px 3px auto auto;
                font-size: 11px;
            }

            .m_btns .right {
                border: 1px solid #333333;
                background: #333333;
                border-top-right-radius: 10px;
                padding-top: 8px;
                padding-bottom: 8px;
                width: 110px;
                color: #fff;
                text-align: center;
                margin: 20px auto auto 3px;
                font-size: 11px;
            }

        .m_info {
            width: 100%;
            text-align: center;
            align-content: center;
            margin-top: 60px;
            color: #fff;
        }

            .m_info .m_iso {
                width: 40px;
            }

            .m_info .m_info_title {
                font-size: 13px;
                font-weight: bold;
                display: block;
            }

            .m_info .m_info_ad {
                font-size: 12px;
                color: #b2b2b2;
            }

        .has-error {
            color: #1ecd93;
            font-size: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="more_title">
        Entremos en contacto
    </div>
    <div class="more_body">
        <span class="m_label">Mensaje</span>
        <asp:TextBox ID="txtMensaje" CssClass="m_text"  TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
        <span class="has-error">
            <asp:Literal ID="ltEnviado" runat="server"></asp:Literal>
        </span>
        <div class="m_btns">
            <asp:Literal ID="ltTelefono" runat="server"></asp:Literal>
            
            <asp:Button ID="btn_send" CssClass="right" runat="server" Text="Enviar" OnClick="btn_send_Click" />
        </div>
        <div class="m_info">
            <asp:Image ID="img_isotipo" CssClass="m_iso" ImageUrl="~/Assets/img/menu/catalog 0.svg" runat="server" />
            <br />
            <br />
            <span class="m_info_title">
                <asp:Literal ID="ltAdvisor" runat="server"></asp:Literal>
            </span>

            <span class="m_info_ad">Account Manager</span><br />
            <span class="m_info_ad">
                 <asp:Literal ID="ltAdvisorEmail" runat="server"></asp:Literal>
            </span><br />
            <span class="m_info_ad">+51  <asp:Literal ID="ltAdvisorNumber" runat="server"></asp:Literal></span><br />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
        });
    </script>
</asp:Content>
