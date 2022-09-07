<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="ZestItem.aspx.cs" Inherits="Zest_App.Resources.Views.Catalog.ZestItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <a style="color:#fff;position: absolute;top:30px;left:30px;z-index: 100000;" href="/Resources/Views/Catalog/ZestCatalog.aspx"><i class="fas fa-chevron-left"></i></a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="dash_header">
        <div class="logo">
            <asp:Image ID="img_logo" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" />
        </div>
    </div>
    <div class="notas_body notas_activos nota_catalog">
        <div class="activos_header_group">
            <div class="activos_header">
                <div class="left">
                    <asp:Literal ID="ltCodigo" runat="server"></asp:Literal>
                    <span style="width:100px;background:#dabe04;color:#000">
                        <asp:Literal ID="ltVenc" runat="server"></asp:Literal>
                    </span>
                </div>
                <div class="right" style="min-width:90px">
                    <b> <asp:Literal ID="ltInv" runat="server"></asp:Literal><i>
                        <asp:Literal ID="ltMoneda" runat="server"></asp:Literal>
                       </i></b>
                    <span>inversión mínima</span>

                </div>
            </div>
            <div class="activos_header_desc">
                <div class="row">
                    <div class="col-6">
                        <span>Emisor</span>
                        <br />
                        <asp:Literal ID="nota_emisor" runat="server" Text="Morgan Stanley"></asp:Literal>
                        <br />
                        <br />
                        <span>ISIN</span>
                        <br />
                        <asp:Literal ID="nota_isin" runat="server" Text="XS2282331458"></asp:Literal>
                        <br />
                        <br />
                        <span>Moneda</span>
                        <br />
                        <asp:Literal ID="nota_moneda" runat="server" Text="USD"></asp:Literal>
                         <br />
                        <br />
                         <span>Riesgo</span>
                        <br />
                        <asp:Literal ID="nota_riesgo" runat="server"></asp:Literal>
                       
                    </div>
                    <div class="col-6 ">
                        <span>Rentabilidad de Cupón</span>
                        <br />
                        <asp:Literal ID="rentabilidad_Cupon" runat="server"></asp:Literal>
                        <br />
                        <br />
                         <span>Barrera de Capital</span>
                        <br />
                        <asp:Literal ID="nota_barrera_capital" runat="server" ></asp:Literal>
                        <br />
                        <br />
                        <span>Barrera de Cupón</span>
                        <br />
                        <asp:Literal ID="nota_barrera" runat="server" ></asp:Literal>
                       
                        <br />
                        <br />
                        <asp:Literal ID="nota_adicional" runat="server" Text=""></asp:Literal>
                        <br />
                        <span></span>

                    </div>
                    <div class="col-12 resumen" style="margin-top:20px;">
                        <asp:Literal ID="ltDesc" runat="server"></asp:Literal>
                    </div>
                   
                    <div class="col-12" style="margin-top:30px;">
                        <table class="table catalog_assets">
                            <asp:Repeater ID="rpTable" runat="server">
                                <ItemTemplate>
                                     <tr>
                                        <td style="font-weight:bold">
                                            <%# Eval("nombre") %> <br />
                                           <%# Eval("adicional") %> 
                                        </td>
                                        <td>
                                            <asp:Image ID="item_1" ImageUrl='<%# Eval("url_imt") %> ' runat="server" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            
                        </table>
                    </div>
                     <div class="col-12 text-center" style="margin-top:20px">
                         <asp:UpdatePanel ID="upMail" runat="server">
                             <ContentTemplate>
                                 <div style="margin:auto">
                                <asp:LinkButton ID="btnMeInteresa" runat="server" style="border:1px solid #dabe04;color:#dabe04;padding:5px 10px;border-top-right-radius:5px" OnClick="btnMeInteresa_Click">Me interesa</asp:LinkButton>
                            </div>
                             </ContentTemplate>
                               
                         </asp:UpdatePanel>
                      
                    </div>
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
