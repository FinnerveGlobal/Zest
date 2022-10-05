﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/auth.Master" AutoEventWireup="true" CodeBehind="Code.aspx.cs" Inherits="Zest_App.Resources.Views.Auth.Code" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
  <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>

            <div class="top_logo">
                <div>
                <asp:Image ID="img_logo" style="width:100px" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" /></div>
            </div>
            <div class="top_input">
                <asp:TextBox ID="txtPIN" CssClass="form-control" runat="server" placeholder="****" ReadOnly="true"></asp:TextBox>
                <span class="has-error">
                <label>Ingrese el código obtenido por <span style="color:#ffd800"> SMS</span></label>
                    <asp:Literal ID="ltError" runat="server"></asp:Literal>
                </span>
            </div>
            <div class="number_pad">
                <div class="pad_line">
                    <div class="number" onclick="pad_number(1)">
                        1
                    </div>
                    <div class="number" onclick="pad_number(2)">
                        2
                    </div>
                    <div class="number" onclick="pad_number(3)">
                        3
                    </div>
                </div>
                <div class="pad_line">
                    <div class="number" onclick="pad_number(4)">
                        4
                    </div>
                    <div class="number" onclick="pad_number(5)">
                        5
                    </div>
                    <div class="number" onclick="pad_number(6)">
                        6
                    </div>
                </div>
                <div class="pad_line">
                    <div class="number" onclick="pad_number(7)">
                        7
                    </div>
                    <div class="number" onclick="pad_number(8)">
                        8
                    </div>
                    <div class="number" onclick="pad_number(9)">
                        9
                    </div>
                </div>
                <div class="pad_line">
                    <div class="number" style="background: none">
                    </div>
                    <div class="number" onclick="pad_number(0)">
                        0
                    </div>
                    <div class="number" onclick="pad_number('d')" style="background: none">
                        <i class="fas fa-backspace"></i>
                    </div>
                </div>
            </div>
            <div class="pad_submit" style="margin-bottom:20px">
                <asp:Button ID="btn_send" runat="server" Text="Ingresar" OnClick="btn_send_Click" CssClass="next text-center"  style="width:150px"  OnClientClick="pin_validate()"/>
            </div>
             <div class="pad_submit" style="margin-bottom:20px">
                <asp:Button ID="btnSendByMail" runat="server" Text="Enviar por email" OnClick="btnSendByMail_Click" CssClass="next text-center"  style="width:150px" />
            </div>
            <div class="pad_submit">
                <a class="prev text-center" href="Login.aspx" runat="server" style="width:150px">Reenviar código</a>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
       <script>
        function pad_number(e) {

            if (e == 'd') {
                var txt = $('#content_txtPIN').val();
                txt = txt.substring(0, txt.length - 1);
                $('#content_txtPIN').val(txt);
            }
            else {
                if ($('#content_txtPIN').val().length >= 4) {
                    return false;
                }
                $('#content_txtPIN').val($('#content_txtPIN').val() + '' + e);
            }
        }
        function pin_validate() {
            if ($('#content_txtPIN').val().length < 4) {
                return false;
            }
        }
       </script>
</asp:Content>
