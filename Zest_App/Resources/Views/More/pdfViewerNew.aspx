<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/app.Master" AutoEventWireup="true" CodeBehind="pdfViewerNew.aspx.cs" Inherits="Zest_App.Resources.Views.More.pdfViewerNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
      body{
          background:#d1d1d1 !important;
      }
      iframe{
          border:none !important;
      }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:UpdatePanel ID="upFrame" runat="server">
        <ContentTemplate>
            <div style="position: fixed; z-index: 2147483647;padding:10px 17px;font-size:20px;
            background:#000;border-bottom-left-radius: 5px;border-top-left-radius:5px;bottom:0px;right:0px;">
                <a href="#" class="btn_load" runat="server" id="getBack">
                    <i class="fas fa-chevron-left" style="color:#fff"></i>
                </a>
            </div>
            <div runat="server" id="pdfContainer" style="margin-bottom: -50px;">

            </div>
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        //$(".bot_menu").css("display", "none");
        $(".bot_menu").remove()
        // $(".container").filter(".nav-container").filter(".navbar").css("display", "none");
        $(".container").filter(".nav-container").filter(".navbar").remove();
        //$("#div_Content").css("padding", "0px");
        $("#loadingModal").css("height", "calc(100%)");
    </script>
</asp:Content>
