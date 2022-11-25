<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="AnalisisELN.aspx.cs" Inherits="Zest_App.Resources.Views.Dashboard.AnalisisELN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       .analisis.active{
           background:#282828;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="notas_menu">
        <asp:Literal ID="notas_menu" runat="server"></asp:Literal>
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
    
</asp:Content>
