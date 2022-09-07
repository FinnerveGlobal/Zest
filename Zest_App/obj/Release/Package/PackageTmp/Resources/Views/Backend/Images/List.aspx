<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Images.List" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="section-body">
        <div class="row justify-content-md-center">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card" style="background: rgba(255,255,255,0)">
                    <asp:UpdatePanel ID="upSearch" runat="server">
                        <ContentTemplate>
                            <div class="card-header">
                                <h4>
                                    <asp:LinkButton ID="btnPrev" runat="server" CommandArgument="0" OnClick="btnGoFolder_Click" Style="float: left"><i class="fas fa-arrow-circle-left"></i></asp:LinkButton>
                                    <asp:TextBox ID="txtFolderName" CssClass="form-control" Width="300" runat="server" AutoPostBack="true" OnTextChanged="txtFolderName_TextChanged" Style="float: left"></asp:TextBox>
                                </h4>
                                <div class="card-header-action">

                                    <asp:TextBox ID="txtSearch" placeholder="Buscar" onFocus="this.select()" CssClass="form-control" Width="300" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>


                                </div>
                              </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="card-body">
                    <asp:UpdatePanel ID="upTable" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" style="display:none">update</asp:LinkButton>

                            <div class="row">
                              

                                <asp:Repeater ID="rpFolders" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-2 col-sm-3">
                                            <asp:LinkButton ID="btnFolder" runat="server" OnClick="btnGoFolder_Click" CommandArgument='<%# Eval("id") %>'>
                                                    <div  style='background:<%# Eval("color") %> ;width:100%;min-height:100px;display:flex;border-radius:10px;border:1px solid #d5b904'>
                                                        <div style="margin-top:auto;width:100%;text-align:center;padding:10px 15px;color:#333333;font-weight:bold;background:rgba(255,255,255,.4);border-radius:10px">
                                                            <%# Eval("title") %>
                                                        </div>
                                                    </div>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnTrashFolder" CommandArgument='<%# Eval("id") %>' runat="server" OnClick="btnTrashFolder_Click"><i class="far fa-trash-alt" style="color:#000;font-size:18px;float:right"></i></asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                  <div class="col-md-2 col-sm-3">
                                    <a class="col-md-12 bg-white text-center" style="padding-top: 30px; display: block; cursor: pointer; border-radius: 10px;width:100%;min-height:100px;" data-toggle="modal" data-target="#newFolderModal">
                                        <i class="fas fa-folder-plus" style="font-size: 35px;"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 20px">
                                <asp:Repeater ID="rpImages" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-2 col-sm-3">
                                            <asp:LinkButton ID="btnFolder" runat="server">
                                                    <div  style='background:url(<%# Eval("url_img") %>);width:100%;min-height:150px;display:flex;border-radius:10px;background-size: 100% 150px;border:1px solid #fff' '>
                                                        <div style="margin-top:auto;width:100%;text-align:center;padding:10px 15px;color:#333333;font-weight:bold;background:rgba(255,255,255,.6);border-radius:10px">
                                                            <%# Eval("alt_text") %>
                                                        </div>
                                                    </div>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnTrashImage" CommandArgument='<%# Eval("id") %>' runat="server" OnClick="btnTrashImage_Click"><i class="far fa-trash-alt" style="color:#000;font-size:18px;float:right"></i></asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                   <div class="col-md-2 col-sm-3">
                                    <a class="col-md-12 bg-white text-center" style="padding-top: 50px; display: block; cursor: pointer; border-radius: 10px;width:100%;min-height:150px;" data-toggle="modal" data-target="#newImageModal">
                                        <i class="far fa-images" style="font-size: 35px;"></i>
                                    </a>
                                </div>
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Modal" runat="server">
    <!-- New modal -->
    <div class="modal fade" id="newFolderModal" tabindex="-1" role="dialog" 
        aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nuevo Folder</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upNewFolder" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                      <div class="form-group">
                                                <label>titulo</label>
                                                <asp:TextBox ID="txtFolderTitulo" runat="server" CssClass="form-control"></asp:TextBox>
                                      </div>
                                     <div class="form-group">
                                                <label>Color</label>
                                                <asp:TextBox ID="txtFolderColor" TextMode="Color" runat="server" CssClass="form-control"></asp:TextBox>
                                      </div>
                                </div>
                                  <div class="col-md-12" align="right">
                                    <button data-dismiss="modal" aria-label="Close" class="btn btn-default">Cancelar</button>
                                    <asp:Button ID="btnsaveFolder" runat="server" Text="Guardar" OnClick="btnsaveFolder_Click" CssClass="btn btn-light" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
     <!-- New modal -->
    <div class="modal fade" id="newImageModal" tabindex="-1" role="dialog" 
        aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nueva imagen</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upNewImage" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                      <div class="form-group">
                                                <label>Titulo imagen</label>
                                                <asp:TextBox ID="txtAltText" runat="server" CssClass="form-control"></asp:TextBox>
                                      </div>
                                     <div class="form-group">
                                                <label>Archivo</label>
                                              <cc1:AsyncFileUpload OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete"
                                            runat="server" ID="AsyncFileUpload1" Width="400px" UploaderStyle="Modern" CompleteBackColor="White"
                                            UploadingBackColor="#CCFFFF" ThrobberID="imgLoader" OnUploadedComplete="FileUploadComplete" />
                                                 <asp:Label ID="lblMesg" runat="server" Text="" />
                                      </div>
                                    <div class="form-group">
                                 
                                    </div>
                                </div>
                                  <div class="col-md-12" align="right">
                                    <button data-dismiss="modal" aria-label="Close" class="btn btn-default">Cancelar</button>
                                </div>
                            </div>
                        </ContentTemplate>
                        
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
    
<script type="text/javascript">
    function uploadComplete(sender) {
        $("#newImageModal").modal('hide');

        var btn = document.getElementById('<%=btnUpdate.ClientID%>');
        btn.click();
    }
 
    function uploadError(sender) {
        $get("<%=lblMesg.ClientID%>").innerHTML = "File upload failed.";
    }

</script>

</asp:Content>
