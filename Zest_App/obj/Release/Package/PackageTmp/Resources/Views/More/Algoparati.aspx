<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Algoparati.aspx.cs" Inherits="Zest_App.Resources.Views.More.Algoparati" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Zest App</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!--Font Family -->
    <link href="<%=ResolveClientUrl("https://fonts.googleapis.com/css?family=Open+Sans:400,600,300") %>" rel="stylesheet" type="text/css" />

    <!--Zest App Styles -->
    <link href="<%=ResolveClientUrl("~/Assets/css/bootstrap.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Assets/css/zestapp.css") %>" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
        integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />

    <script src="<%=ResolveClientUrl("https://code.jquery.com/jquery-3.5.1.min.js") %>" type="text/javascript"></script>
    <script src="<%=ResolveClientUrl("~/Assets/js/bootstrap.min.js") %>" type="text/javascript"></script>

    
    <!-- Toast CSS Files -->
    <link href="<%=ResolveClientUrl("~/Assets/backend/bundles/izitoast/css/iziToast.min.css") %>" rel="stylesheet" type="text/css" />
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
    <style>
      

        #img_landing {
            position: fixed;
            width: 200%;
            margin-left: -100%;
            margin-top: -10vh;
            z-index: -1000;
            opacity: .7;
        }

        .btns_landing {
            position: fixed;
            right: 0;
            bottom: 0;
            margin-right: 10vh;
            margin-bottom: 66px;
            display: grid;
        }

        .b_item {
            padding-top: 10px;
            padding-bottom: 10px;
            border: 1px solid #fff;
            border-top-right-radius: 10px;
            margin-bottom: 30px;
            color: #fff;
            font-weight: bold;
            font-size: 13px;
            text-align: center;
            width: 110px;
        }

            .b_item:first-child {
                background: #fff;
                color: #000;
            }

        .text_landing {
            color: #fff;
            font-size: 10vw;
            font-weight: bolder;
            padding-left: 40px;
            padding-top: 29vh;
        }
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
            margin: 30vh auto;
            padding: 10px;
            width: 350px;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .Loadingcenter img {
                width: 100%;
            }
    </style>
</head>
<body class="bg_black" style="background: #000">
   
    <form id="AuthForm" runat="server" autocomplete="off">
        <button type="submit" onclick="return false;" style="display: none"></button>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress runat="server" ID="UpdateProgress1">
            <ProgressTemplate>
                <div class="LoadingModal">
                     <div class="Loadingcenter" style="display:flex">
                        <div style="margin:auto">
                        <div class="lds-spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
                        </div>
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center" style="color:#fff;margin:30px 0px">
                    Déjanos un mensaje
                    <a href="/Resources/Views/Auth/Home.aspx" style="color:#fff;float:right">
                        <i class="fas fa-times"></i>
                    </a>
                </div>
                <div class="col-md-12" >
                    <style>
                        .zest_more{
                            width:100%;
                            min-height:50px;
                            background:rgba(255,255,255,1);
                            border-radius:10px;
                            margin-bottom:20px;
                            display:flex;
                            padding:10px 20px;
                        }
                        .zest_more i{
                            color:#dabe04;
                            font-size:15px;
                            margin:auto 20px;
                        }
                        .zest_more a{
                            color:#000;
                            font-size:12px;
                            font-weight:bold;
                        }
                        .btn-zest-black{
                            background:#dabe04;
                            padding:10px 20px;
                            border-top-right-radius:5px;
                            float:right;
                            color:#fff;
                        }

                    </style>
                  <asp:UpdatePanel ID="up_contact" runat="server">
                            <ContentTemplate>
                                <div class="contact-form">
                                    <asp:TextBox ID="txtNombre" CssClass="form-control web_subtitle" placeholder="Nombre" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txtApellidos" CssClass="form-control web_subtitle" placeholder="Apellido" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txtMail" CssClass="form-control web_subtitle" placeholder="Correo Electrónico" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txtCelular" CssClass="form-control web_subtitle" placeholder="Teléfono" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txtMensaje" CssClass="form-control web_subtitle" placeholder="Mensaje" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <div style="width:100%">
                                        <asp:LinkButton ID="btnSendContact" runat="server" CssClass="btn-zest-black" OnClick="btnSendContact_Click">Enviar</asp:LinkButton>
                                    </div>
                                    <br />
                                    <br />
                                    <asp:Literal ID="ltSuccess" runat="server"></asp:Literal>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </div>
            </div>
        </div>
       
    </form>
</body>

</html>
