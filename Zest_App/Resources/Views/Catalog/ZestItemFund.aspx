<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestItemFund.aspx.cs" Inherits="Zest_App.Resources.Views.Catalog.ZestItemFund" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <a style="color:#fff;position: absolute;top:30px;left:80px;z-index: 100000;" href="ZestCatalogFund.aspx"><i class="fas fa-chevron-left"></i></a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    
    <%--<div class="catalog"></div>--%>
    <div class="notas_body notas_activos nota_catalog">
            <div class="activos_header_group">
                <div class="activos_header">
                    <div class="left">
                        <asp:Literal ID="ltCodigo" runat="server"></asp:Literal>
                    </div>
                    <div class="right" style="min-width:100px">
                        <b> 
                            <asp:Literal ID="ltInv" runat="server"></asp:Literal>
                            <i><asp:Literal ID="ltMoneda" runat="server"></asp:Literal></i>
                        </b>
                        <span>inversión mínima</span>
                    </div>
                </div>
                <div class="activos_header_desc" style="z-index:1;position:relative;background:black;display: block;">
                    <div class="row">
                        <div class="col-6">
                            <span>Gestor</span>
                            <br />
                            <asp:Literal runat="server" ID="fondo_gestor"></asp:Literal>
                            <br />
                            <br />
                            <span>Auditor</span>
                            <br />
                            <asp:Literal runat="server" ID="fondo_auditor"></asp:Literal>
                            <br />
                            <br />
                            <span>Moneda</span>
                            <br />
                            <asp:Literal runat="server" ID="fondo_moneda"></asp:Literal>
                        </div>
                        <div class="col-6">
                            <span>Administrador</span>
                            <br />
                            <asp:Literal runat="server" ID="fondo_administrador"></asp:Literal>
                            <br />
                            <br />
                            <span>Custodio</span>
                            <br />
                            <asp:Literal runat="server" ID="fondo_custodio"></asp:Literal>
                            <br />
                            <br />
                            <span>Riesgo</span>
                            <br />
                            <asp:Literal runat="server" ID="fondo_riesgo"></asp:Literal>
                        </div>
                        <div class="col-12 resumen" style="margin-top:20px;">
                            <asp:Literal ID="ltDesc" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>
            </div>

    <div class="row my-3">
        <div class="col-6" style="padding-left: 35px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" style="border:1px solid #dabe04;color:#dabe04;padding:5px 10px;border-top-right-radius:5px;font-size:11px;" OnClick="btnExternal_Click" CommandArgument="/files/Factsheet_Nuevo_Fondo.pdf">
                        Ver Factsheet
                    </asp:LinkButton>
                </ContentTemplate>           
            </asp:UpdatePanel>
            <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" style="border:1px solid #dabe04;color:#dabe04;padding:5px 10px;border-top-right-radius:5px;font-size:11px;" OnClick="btnExternal_Click_Iframe" CommandArgument="https://zest.pe/files/Factsheet_Nuevo_Fondo.pdf">
                        Ver test
                    </asp:LinkButton>
                </ContentTemplate>           
            </asp:UpdatePanel>--%>
            <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" style="border:1px solid #dabe04;color:#dabe04;padding:5px 10px;border-top-right-radius:5px;font-size:11px;" OnClick="btnExternal_Click_Embed" CommandArgument="https://zest.pe/files/Factsheet_Nuevo_Fondo.pdf">
                        Ver Embed
                    </asp:LinkButton>
                </ContentTemplate>           
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:LinkButton ID="LinkButton4" runat="server" style="border:1px solid #dabe04;color:#dabe04;padding:5px 10px;border-top-right-radius:5px;font-size:11px;" OnClick="btnExternal_Click_Object" CommandArgument="https://zest.pe/files/Factsheet_Nuevo_Fondo.pdf">
                        Ver Object
                    </asp:LinkButton>
                </ContentTemplate>           
            </asp:UpdatePanel>--%>
        </div>
        <div class="col-6">
            <asp:UpdatePanel ID="upMail" runat="server">
                <ContentTemplate>
                    <asp:LinkButton ID="btnMeInteresa" runat="server" style="border:1px solid #dabe04;color:#dabe04;padding:5px 10px;border-top-right-radius:5px;font-size:11px;" OnClick="btnMeInteresa_Click">
                        Me interesa
                    </asp:LinkButton>
                </ContentTemplate>           
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(3)').addClass('active');
        });
    </script>
</asp:Content>
