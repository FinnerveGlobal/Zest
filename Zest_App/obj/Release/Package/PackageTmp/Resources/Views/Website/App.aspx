<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="App.aspx.cs" Inherits="Zest_App.Resources.Views.Website.App" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="canonical" href="http://ospzest.finnerve.com/apphow" />
    <style>
        .app-img {
            width: 70%;
        }

        .faq_entry {
            opacity: 1;
            max-height: unset !important;
            padding: 50px;
        }

            .faq_entry p {
                padding-left: 10px;
            }

            .faq_entry img {
                width: 150px !important;
            }

        .section_title {
            padding: 80px 60px 60px 60px;
        }

        .modal-open .modal {
            background: rgba(0,0,0,.8);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section class="section_title">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-5 col-sm-12 text-center">
                    <asp:Image ID="imgApp" CssClass="app-img" ImageUrl="~/Assets/img/website/app/landing_app.png" runat="server" />
                </div>
                <div class="col-lg-6 col-md-7 col-sm-12 web_middle_parent" style="height: unset">
                    <div class="web_middle_child">
                        <h1 class="web_title">Zest App
                        </h1>
                        <h4 class="web_subtitle web_white">Conoce todo lo que puedes hacer en el app
                            <br />
                            <br />
                            Descárgala gratis como “Zest Capital” en Google Play o App Store
                        </h4>

                        <div class="btn-stores" style="padding: 50px 0px">
                            <a class="appstore" href="https://apps.apple.com/pe/app/zest-app/id1555182708" target="_blank">
                                <asp:Image ID="appstore" ImageUrl="~/Assets/img/website/appstore.png" runat="server" />
                            </a>
                            <a class="playstore" href="https://play.google.com/store/apps/details?id=com.zestcapital.app" target="_blank">
                                <asp:Image ID="playstore" ImageUrl="~/Assets/img/website/playstore.png" runat="server" />
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <section class="section_body">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="caja_evento" style="height: 225px">
                        <div class="caja_evento_header" style="background: #000; display: flex; height: 60px; padding: 20px">
                            <h1 class="web_subtitle web_white">Configura tu clave de seguridad</h1>
                        </div>
                        <div class="caja_evento_detalle web_text" style="padding: 20px; height: 95px">
                            <p class="web_text web_black" style="width: 100%;">
                                Ingresa con el correo electrónico y el teléfono que tienes registrado en el portal Zest.<br /> Luego podrás configurar tu clave en la app 
                            </p>

                        </div>
                        <div class="caja_evento_cta" style="margin-bottom: 10px; height: 60px">
                            <a class="btn-zest-yellow-border" style="margin: auto" data-toggle="modal" data-target="#evento_1">ver más
                            </a>
                        </div>

                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="evento_1" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background: unset; border: unset">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>



                                <div id="car_1" class="carousel slide" data-ride="carousel">
                                  <ol class="carousel-indicators">
                                    <li data-target="#car_1" data-slide-to="0" class="active"></li>
                                    <li data-target="#car_1" data-slide-to="1"></li>
                                  </ol>
                                  <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="/Assets/img/website/app/app1_2.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                                    </div>
                                    <div class="carousel-item">
                                         <img src="/Assets/img/website/app/app1.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                                    </div>
                                  </div>
                                  <a class="carousel-control-prev hide_mobile" href="#car_1" role="button" data-slide="prev" style="margin-left:-70px">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                  <a class="carousel-control-next hide_mobile" href="#car_1" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </div>


                            
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="caja_evento" style="height: 225px">
                        <div class="caja_evento_header" style="background: #000; display: flex; height: 60px; padding: 20px">
                            <h1 class="web_subtitle web_white">Consulta tus inversiones</h1>
                        </div>
                        <div class="caja_evento_detalle web_text" style="padding: 20px; height: 95px">
                            <p class="web_text web_black" style="width: 100%;">
                                En <b>portafolio</b> podrás consultar el dashboard con la rentabilidad de tus notas estructuradas

                            </p>
                        </div>
                        <div class="caja_evento_cta" style="margin-bottom: 10px; height: 60px">
                            <a class="btn-zest-yellow-border" style="margin: auto" data-toggle="modal" data-target="#evento_2">ver más
                            </a>
                        </div>

                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="evento_2" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background: unset; border: unset">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>
                                <img src="/Assets/img/website/app/app2.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="caja_evento" style="height: 225px">
                        <div class="caja_evento_header" style="background: #000; display: flex; height: 60px; padding: 20px">
                            <h1 class="web_subtitle web_white">Consulta los activos de tus notas</h1>
                        </div>
                        <div class="caja_evento_detalle web_text" style="padding: 20px; height: 95px">
                            <p class="web_text web_black" style="width: 100%;">
                                En <b>activos</b>, podrás visualizar los precios en tiempo real de los subyacentes de tu nota estructurada

                            </p>
                        </div>
                        <div class="caja_evento_cta" style="margin-bottom: 10px; height: 60px">
                            <a class="btn-zest-yellow-border" style="margin: auto" data-toggle="modal" data-target="#evento_7">ver más
                            </a>
                        </div>

                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="evento_7" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background: unset; border: unset">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>
                                <img src="/Assets/img/website/app/app7.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="caja_evento" style="height: 225px">
                        <div class="caja_evento_header" style="background: #000; display: flex; height: 60px; padding: 20px">
                            <h1 class="web_subtitle web_white">Consulta el cronograma de tus cupones</h1>
                        </div>
                        <div class="caja_evento_detalle web_text" style="padding: 20px; height: 95px">
                            <p class="web_text web_black" style="width: 100%">
                                En <b>eventos</b> podrás visualizar el valor de tus cupones, el importe bruto, el importe de retención. Además saber la fecha de observación, de pago y si hubo autocall

                            </p>
                        </div>

                        <div class="caja_evento_cta" style="margin-bottom: 10px; height: 60px">
                            <a class="btn-zest-yellow-border" style="margin: auto" data-toggle="modal" data-target="#evento_3">ver más
                            </a>
                        </div>

                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="evento_3" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background: unset; border: unset">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>
                                 <div id="car_3" class="carousel slide" data-ride="carousel">
                                  <ol class="carousel-indicators">
                                    <li data-target="#car_3" data-slide-to="0" class="active"></li>
                                    <li data-target="#car_3" data-slide-to="1"></li>
                                  </ol>
                                  <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="/Assets/img/website/app/app3.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                                    </div>
                                    <div class="carousel-item">
                                         <img src="/Assets/img/website/app/app3_2.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                                    </div>
                                  </div>
                                  <a class="carousel-control-prev hide_mobile" href="#car_3" role="button" data-slide="prev" style="margin-left:-70px">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                  <a class="carousel-control-next hide_mobile" href="#car_3" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="caja_evento" style="height: 225px">
                        <div class="caja_evento_header" style="background: #000; display: flex; height: 60px; padding: 20px">
                            <h1 class="web_subtitle web_white">Consulta los análisis de tus notas</h1>
                        </div>
                        <div class="caja_evento_detalle web_text" style="padding: 20px; height: 95px">
                            <p class="web_text web_black" style="width: 100%;">
                                En <b>análisis</b> podrás encontrar las observaciones sobre algún evento especial que tenga impacto en tus inversiones

                            </p>
                        </div>
                        <div class="caja_evento_cta" style="margin-bottom: 10px; height: 60px">
                            <a class="btn-zest-yellow-border" style="margin: auto" data-toggle="modal" data-target="#evento_8">ver más
                            </a>
                        </div>

                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="evento_8" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background: unset; border: unset">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>
                                <img src="/Assets/img/website/app/app8.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="caja_evento" style="height: 225px">
                        <div class="caja_evento_header" style="background: #000; display: flex; height: 60px; padding: 20px">
                            <h1 class="web_subtitle web_white">Entérate de nuestras nuevas notas estrucutradas</h1>
                        </div>
                        <div class="caja_evento_detalle web_text" style="padding: 20px; height: 95px">
                            <p class="web_text web_black" style="width: 100%">
                                En <b>servicios</b> podrás visualizar las notas estructuradas vigentes

                            </p>
                        </div>
                        <div class="caja_evento_cta" style="margin-bottom: 10px; height: 60px">
                            <a class="btn-zest-yellow-border" style="margin: auto" data-toggle="modal" data-target="#evento_4">ver más
                            </a>

                        </div>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="evento_4" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background: unset; border: unset">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>
                                <img src="/Assets/img/website/app/app4.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="caja_evento" style="height: 225px">
                        <div class="caja_evento_header" style="background: #000; display: flex; height: 60px; padding: 20px">
                            <h1 class="web_subtitle web_white">Infórmate de las noticias del mercado</h1>
                        </div>
                        <div class="caja_evento_detalle web_text" style="padding: 20px; height: 95px">
                            <p class="web_text web_black" style="width: 100%">
                                En <b>noticias</b> podrás revisar las noticias del mercado más relevante para tus inversiones
                            </p>

                        </div>
                        <div class="caja_evento_cta" style="margin-bottom: 10px; height: 60px">
                            <a class="btn-zest-yellow-border" style="margin: auto" data-toggle="modal" data-target="#evento_5">ver más
                            </a>
                        </div>

                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="evento_5" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background: unset; border: unset">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>
                                <img src="/Assets/img/website/app/app5.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="caja_evento" style="height: 225px">
                        <div class="caja_evento_header" style="background: #000; display: flex; height: 60px; padding: 20px">
                            <h1 class="web_subtitle web_white">Conéctate con tu asesor</h1>
                        </div>
                        <div class="caja_evento_detalle web_text" style="padding: 20px; height: 95px">
                            <p class="web_text web_black" style="width: 100%">
                                En <b>más</b>, podrás contactarte directamente con un asesor por teléfono o enviarle un mensaje a su correo electrónico
                            </p>

                        </div>
                        <div class="caja_evento_cta" style="margin-bottom: 10px; height: 60px">
                            <a class="btn-zest-yellow-border" style="margin: auto" data-toggle="modal" data-target="#evento_6">ver más
                            </a>
                        </div>

                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="evento_6" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background: unset; border: unset">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>
                              

                                <div id="car_6" class="carousel slide" data-ride="carousel">
                                  <ol class="carousel-indicators">
                                    <li data-target="#car_6" data-slide-to="0" class="active"></li>
                                    <li data-target="#car_6" data-slide-to="1"></li>
                                  </ol>
                                  <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="/Assets/img/website/app/app8_2.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                                    </div>
                                    <div class="carousel-item">
                                         <img src="/Assets/img/website/app/app6.png" style="margin: auto; height: 90vh; margin-top: 5vh; border-radius: 25px; border: 5px solid #fff" />
                                    </div>
                                  </div>
                                  <a class="carousel-control-prev hide_mobile" href="#car_6" role="button" data-slide="prev" style="margin-left:-70px">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                  <a class="carousel-control-next hide_mobile" href="#car_6" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
        function endReq(sender, args) {
            $(function () {
                $("#navbar").removeClass("navbar-light");
                $("#navbar").addClass("navbar-dark");
                $(".faq_entry").click(function () {

                    $(".faq_entry").removeClass("active");
                    $(this).addClass("active");
                    event.stopPropagation();
                });
                $(".faq").click(function () {
                    $(".faq_entry").removeClass("active");
                });
            });

        }
        $(function () {

            $("#navbar").removeClass("navbar-light");
            $("#navbar").addClass("navbar-dark scrolled");
            $('.jcarousel').jcarousel({
                // Configuration goes here
            });
            $(".faq_entry").click(function () {

                $(".faq_entry").removeClass("active");
                $(this).addClass("active");
                event.stopPropagation();
            });
            $(".faq").click(function () {
                $(".faq_entry").removeClass("active");
            });
        });

    </script>
</asp:Content>
