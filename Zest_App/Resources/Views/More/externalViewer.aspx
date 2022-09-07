<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="externalViewer.aspx.cs" Inherits="Zest_App.Resources.Views.More.externalViewer" %>

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
<body class="bg_black" style="background: #000;overflow:hidden">

    <form id="AuthForm" runat="server" autocomplete="off">
        <button type="submit" onclick="return false;" style="display: none"></button>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress runat="server" ID="UpdateProgress1">
            <ProgressTemplate>
               <div class="LoadingModal" ">
                    <div class="Loadingcenter">
                        <asp:Image ImageUrl="/Assets/img/logos/isotipo.svg" runat="server" ID="ImagenLoader" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center" style="color: #fff; margin: 5px 0px">
                    <asp:UpdatePanel ID="upHeader" runat="server">
                        <ContentTemplate>
                            <a runat="server" id="getBack" href="#" style="color: #fff; float: left" class="btn_load">
                                <i class="fas fa-arrow-left"></i>
                            </a>

                            <asp:TextBox ID="txtUrl" ReadOnly="true" Style="width: 70%; background: #000; color: #dabe04; border: 1px solid #2f2f2f" Text="text" runat="server"></asp:TextBox>
                            <a  style="color: #fff; float: right;cursor:pointer" onclick="copy()">
                                <i class="far fa-copy"></i>
                            </a>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                </div>
            </div>

                <asp:UpdatePanel ID="up_contact" runat="server">
                    <ContentTemplate>
                        <iframe runat="server" id="externalFrame" style="background: #fff; width: 100%;border:none;height:calc(100vh - 38px)"></iframe>
                    </ContentTemplate>
                </asp:UpdatePanel>
          
    </form>
</body>
    <script>
        function copy() {
            try { document.getElementById("txtUrl").value = document.getElementById("externalFrame").contentWindow.location.href; } catch (ex) {

            }

            /* Get the text field */
            var copyText = document.getElementById("txtUrl");

            /* Select the text field */
            copyText.select();
            copyText.setSelectionRange(0, 99999); /* For mobile devices */

            /* Copy the text inside the text field */
            document.execCommand("copy");

        }
        $(".btn_load").click(function () {
            $("#loadingModal").show();
        });
    </script>
</html>
