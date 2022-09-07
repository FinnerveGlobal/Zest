<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Zest_App.Resources.Views.Auth.Home" %>

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

    <style>
       *{
           -webkit-tap-highlight-color: rgba(0,0,0,0);
            -webkit-tap-highlight-color: transparent;
       }
          #mensaje {
                display: none;
            }
      
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
    </style>
</head>
<body class="bg_black" style="background: #000">
    <div id="mensaje">
        EL USO DE ESTE LINK ESTA RESTRINGIDO
        <br />
        UNICAMENTE A DISPOSITIVOS MÓVILES 
    </div>
    <form id="AuthForm" runat="server" autocomplete="off">
        <button type="submit" onclick="return false;" style="display: none"></button>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress runat="server" ID="UpdateProgress1">
            <ProgressTemplate>
                <div class="LoadingModal">
                    <div class="Loadingcenter">
                        <asp:Image ImageUrl="~/Assets/img/loading.gif" runat="server" ID="ImagenLoader" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <div style="width:100%;position:relative">
              <asp:Image ID="img_land" ImageUrl="~/Assets/img/assets/franjas.svg" style="height:68.5vh;margin-top:-15vh;position:absolute;right:0;z-index:-100"
            runat="server" />
            <asp:Image ID="img_land_back" ImageUrl="~/Assets/img/assets/back_land.jpg" style="height:53.5vh;position:absolute;right:0;z-index:-101;opacity:.6"
            runat="server" />
            <h1 style="color:#fff;padding-top:20vh;font-size:35px;margin-left:5vw;font-family: 'Gotham';">
                Bienvenido <br /> a
                <b>ZEST</b>
            </h1>
        </div>
       
        <div class="btns_landing">
            <a class="b_item" runat="server" href="~/Resources/Views/Auth/Pin.aspx">Ingresar</a>
            <a class="b_item" href="/Resources/Views/More/Algoparati.aspx">Contáctanos</a>
            <asp:LinkButton ID="btnAlgoParaTi" CssClass="b_item" runat="server" OnClick="btnAlgoParaTi_Click">Algo para ti</asp:LinkButton>

        </div>
    </form>
</body>

</html>
