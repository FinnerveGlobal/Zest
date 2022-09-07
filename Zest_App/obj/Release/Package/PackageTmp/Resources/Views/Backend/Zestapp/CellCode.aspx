<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/backend.Master" AutoEventWireup="true" CodeBehind="CellCode.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Zestapp.CellCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <div class="section-body">
        <div class="row">
            <div class="col-12 col-md-6 col-lg-6 justify-content-md-center">
                <div class="card">
                    <div class="card-header">
                        <h4>Código de ingreso</h4>
                        
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="upTable" runat="server">
                            <ContentTemplate>
                               <div class="row">
                                   <div class="col-md-12">
                                       <div class="form-group">
                                           <label>Código de teléfono actual</label>
                                           <asp:TextBox ID="txtCode" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                       </div>
                                       <br />
                                       <div class="form-group">
                                           <asp:LinkButton ID="btnSave" CssClass="btn btn-block btn-primary" OnClick="btnSave_Click" runat="server">Generate new code</asp:LinkButton>
                                       </div>
                                   </div>
                               </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Modal" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
