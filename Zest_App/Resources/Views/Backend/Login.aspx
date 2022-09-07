<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Zest_App.Resources.Views.Backend.Login" %>


<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">


<!-- Mirrored from radixtouch.in/templates/admin/aegis/source/light/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Sep 2019 15:59:28 GMT -->
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport" />
    <title>Zest Backend - Login</title>
    <!-- General CSS Files -->
    <link href="<%=ResolveClientUrl("~/Assets/backend/css/app.min.css") %>" rel="stylesheet" type="text/css" />
    <!-- Template CSS -->
    <link href="<%=ResolveClientUrl("~/Assets/backend/css/style.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Assets/backend/css/components.css") %>" rel="stylesheet" type="text/css" />
    <!-- Custom style CSS -->
    <link href="<%=ResolveClientUrl("~/Assets/backend/css/custom.cs") %>" rel="stylesheet" type="text/css" />
     <!-- Toast CSS Files -->
    <link href="<%=ResolveClientUrl("~/Assets/backend/bundles/izitoast/css/iziToast.min.css") %>" rel="stylesheet" type="text/css" />
    <link rel='shortcut icon' type='image/x-icon' href='assets/img/favicon.ico' />
      <style>
        .LoadingModal {
            position: fixed;
            z-index: 999999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .Loadingcenter {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 150px;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .Loadingcenter img {
                height: 128px;
                width: 128px;
            }
    </style>
</head>
<body>
    <form id="app" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods='true' ></asp:ScriptManager>
        <asp:UpdateProgress runat="server" ID="UpdateProgress1">
            <ProgressTemplate>
                <div class="LoadingModal">
                    <div class="Loadingcenter">
                        <asp:Image ImageUrl="~/Assets/img/loading.gif" runat="server" ID="ImagenLoader" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <section class="section">
            <asp:UpdatePanel ID="upLogin" runat="server">
                <ContentTemplate>
                     <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                            <div class="card card-warning">
                                <div class="card-header text-align">
                                    <asp:Image ID="img_logo" ImageUrl="~/Assets/img/logos/logo main.svg" runat="server" Style="width: 50%; margin: 30px auto" />
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <asp:TextBox ID="txtEmail" CssClass="form-control" TabIndex="1" runat="server"></asp:TextBox>
                                        <div class="invalid-feedback">
                                            Please fill in your email
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-block">
                                            <label for="password" class="control-label">Password</label>
                                            <div class="float-right">
                                                <a href="auth-forgot-password.html" class="text-small">Forgot Password?
                                                </a>
                                            </div>
                                        </div>
                                        <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" TabIndex="2" runat="server"></asp:TextBox>
                                        <div class="invalid-feedback">
                                            please fill in your password
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" name="remember" class="custom-control-input" tabindex="3" id="remember-me" />
                                            <label class="custom-control-label" for="remember-me">Remember Me</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="btnLogin"  runat="server" Text="Login" CssClass="btn btn-warning btn-lg btn-block" OnClick="btnLogin_Click"/>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                </ContentTemplate>
               
            </asp:UpdatePanel>

        </section>
    </form>
    <!-- General JS Scripts -->
    <script src="<%=ResolveClientUrl("~/Assets/backend/js/app.min.js") %>" type="text/javascript"></script>
    <!-- Template JS File -->
    <script src="<%=ResolveClientUrl("~/Assets/backend/js/scripts.js") %>" type="text/javascript"></script>
    <!-- Custom JS File -->
    <script src="<%=ResolveClientUrl("~/Assets/backend/js/custom.js") %>" type="text/javascript"></script> 
    <!-- Toast JS File -->
    <script src="<%=ResolveClientUrl("~/Assets/backend/bundles/izitoast/js/iziToast.min.js") %>" type="text/javascript"></script>
      <script type="text/javascript">
         function ShowMessage(message, messagetype) {
            switch (messagetype) {
                 case 'Success':
                    iziToast.success({
                        title: message
                    });
                     break;
                 case 'Error':
                    iziToast.error({
                        title: message
                    });
                     break;
                 case 'Warning':
                    iziToast.warning({
                        title: message
                    });
                     break;
                 default:
                    iziToast.info({
                        title: message
                    });
             }
         }
      </script>

   
</body>

</html>
