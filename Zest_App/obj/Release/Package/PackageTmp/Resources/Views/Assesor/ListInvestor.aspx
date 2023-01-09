<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/appAssesor.Master" AutoEventWireup="true" CodeBehind="ListInvestor.aspx.cs" Inherits="Zest_App.Resources.Views.Assesor.ListInvestor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bg-up {
            color: #1ecd93 !important;
        }

        .bg-down {
            color: #d34646 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:UpdatePanel ID="upTable" runat="server">
        <ContentTemplate>
            <div class="dash_header">
                <%--<div class="logo">
                    <asp:Image ID="img_logo" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" />
                </div>--%>
                <div style="margin: 20px auto">
                    <asp:TextBox ID="txtSearch" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" CssClass="form-control" runat="server" Style="border: 1px solid #333333; background: #000; color: #fff" placeholder="Buscar ..."></asp:TextBox>
                </div>
            </div>
            <div class="dash_portfolio active">
                <div class="col-md-12">
                    <small style="color: #dabe04">
                        <asp:Literal ID="ltMessage" runat="server"></asp:Literal>
                    </small>
                </div>
                <asp:GridView ID="dgvInvestor" runat="server" Width="100%" AutoGenerateColumns="false" OnPageIndexChanging="dgvTable_PageIndexChanging"
                    GridLines="None">

                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="notas">

                                    <div class="left">
                                        <div style="display: inherit">
                                            <b style="font-size: 12px; font-weight: normal; color: #fff">
                                                <%# Eval("Name") %>
                                            </b>
                                        </div>

                                        <b style="font-size: 11px; font-weight: normal">
                                            <%# Eval("email") %>
                                        </b>
                                        <a href='tel: <%# Eval("phone") %>' style="font-size: 11px; font-weight: normal; color: #fff">
                                            <%# Eval("phone") %> <b style="color: #dabe04"><i class="fas fa-phone-alt"></i></b>
                                        </a>
                                    </div>
                                    <div class="right" style="display: initial">
                                        <asp:LinkButton ID="btnInv" OnClick="btnInv_Click" runat="server" CommandArgument='<%# Eval("id") %>'>
                                    <span style="color:#dabe04">Ver Portafolio 
                                </span>
                                    
                                        </asp:LinkButton>

                                        <br />

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>



            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $('.bot_menu').find('.bot_menu_item').removeClass('active');
            $('.bot_menu').find('.bot_menu_item:nth-child(1)').addClass('active');
        });
    </script>
</asp:Content>
