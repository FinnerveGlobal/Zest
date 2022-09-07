<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="Zest_App.Resources.Views.Website.Aboutus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="canonical" href="http://ospzest.finnerve.com/nosotros" />

    <link href="<%=ResolveClientUrl("~/Assets/css/carousel.css") %>" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section id="about_team" class="home-info about_team">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1 class="web_title">Líderes Zest
                    </h1>
                    <h4 class="web_subtitle web_white">Somos la representación de un grupo de jóvenes que, con gran pasión, construyen y contribuyen al crecimiento de Zest y su impacto en el
                        <br />
                        desarrollo del mercado de capitales
                    </h4>
                </div>
            </div>
            <div class="row team">
                <style>
                    .team .foto {
                        background: #D8BD03;
                    }
                </style>
                <asp:Repeater ID="rpTeam" runat="server">
                    <ItemTemplate>
                         <div class="col-lg-6 col-md-6 col-sm-6 divteam">
                    <img title='<%# Eval("nombre") %>' class="foto" style='background: url(<%# Eval("url_img") %>) no-repeat center;' src="/Assets/img/website/team/crop3.png">
                    <div>
                        <span class="team_name web_yellow"><%# Eval("nombre") %></span>
                        <br />
                        <span class="team_rol">
                            <%# HttpUtility.HtmlDecode( Eval("cargo").ToString() ) %>
                        </span>
                        <br />
                        <a href='<%# Eval("linkedin") %>' target="_blank">
                            <img src="/Assets/img/website/linkedin.svg" class="linkedin" /></a>
                    </div>

                </div>
                    </ItemTemplate>
                </asp:Repeater>
              
            </div>
        </div>
    </section>
    <section id="about_zest" class="about-zest" style="display: flex">
        <canvas id="nokey" width="800" height="800" style="position: absolute; z-index: 1;"></canvas>
        <div class="container" style="margin: auto">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="web_title web_grey">Propuesta de valor
                    </h1>
                    <br />

                    <div class="jcarousel-wrapper" style="position: relative; z-index: 2">
                        <div class="jcarousel">
                            <ul>
                                <li>
                                    <div class="about_item ">
                                        <span class="web_black web_subtitle">Democratización</span>
                                    </div>
                                    <p class="web_text web_black text-left">
                                        Damos acceso al mercado de capitales global a través de asociaciones con las principales entidades financieras de la industria.
                                    </p>
                                </li>
                                <li>
                                    <div class="about_item ">
                                        <span class="web_black web_subtitle">Educación
                                            <br />
                                            Financiera</span>
                                    </div>
                                    <p class="web_text web_black text-left">
                                        Empoderamos a nuestros inversionistas con conocimiento del mercado de manera dinámica y objetiva.
                                    </p>
                                </li>

                                <li>
                                    <div class="about_item ">
                                        <span class="web_black web_subtitle">Asesoría
                                            <br />
                                            Personalizada
                                        </span>
                                    </div>
                                    <p class="web_text web_black text-left">
                                        Asesoramos y apoyamos a nuestros inversionistas durante toda su vida financiera con profesionales altamente calificados.
                                    </p>
                                </li>
                                <li>
                                    <div class="about_item ">
                                        <span class="web_black web_subtitle">Transparencia</span>
                                    </div>
                                    <p class="web_text web_black text-left">
                                        Brindamos información en tiempo real del portafolio de inversiones a través del Portal Zest el cual tiene la posibilidad de visualizar su comportamiento en tiempo real y acceder a su patrimonio sin penalidades.
                                    </p>
                                </li>
                                <li>
                                    <div class="about_item">
                                        <span class="web_black web_subtitle">Alineamiento
                                            <br />
                                            de intereses
                                        </span>
                                    </div>
                                    <p class="web_text web_black text-left">
                                        Garantizamos afinamiento total de intereses con nuestros inversionistas con el sistema profit share.
                                        <br />
                                        ¡Sólo ganamos si tú ganas!
                                    </p>
                                </li>
                                <li>
                                    <div class="about_item">
                                        <span class="web_black web_subtitle">Seguridad
                                        </span>
                                    </div>
                                    <p class="web_text web_black text-left">
                                        Custodiamos todos los títulos valores registrados en Pershing LLC la cámara de compensación más grande de EE.UU.
                                    </p>
                                </li>




                            </ul>
                        </div>

                        <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                        <a href="#" class="jcarousel-control-next">&rsaquo;</a>

                        <p class="jcarousel-pagination"></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="about_cifras" class="about-cifras">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="web_title web_grey">Evolución Zest</h1>
                </div>
                <div class="col-md-12">
                    <div id="container" style="display: flex">
                        <div class="grafico">

                            <div class="gr p1 active">
                                <asp:Image ID="img_grafico" runat="server" ImageUrl="~/Assets/img/website/nosotros/nosotros_grafico1.png" Style="width: 100%" />
                            </div>
                            <div class="gr p2">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Assets/img/website/nosotros/nosotros_grafico2.png" Style="width: 100%" />
                            </div>
                            <div class="gr p3">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Assets/img/website/nosotros/nosotros_grafico3.png" Style="width: 100%" />
                            </div>
                            <div class="gr p4">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Assets/img/website/nosotros/nosotros_grafico4.png" Style="width: 100%" />
                            </div>
                            <div class="gr p5">
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Assets/img/website/nosotros/nosotros_grafico5.png" Style="width: 100%" />
                            </div>
                            <div class="gr p6">
                                <asp:Image ID="grafico644" runat="server" ImageUrl="~/Assets/img/website/nosotros/nosotros_grafico6.png" Style="width: 100%" />
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="">
                            <div class="grafico_crecimiento" style="max-width: 500px; padding-left: 15px">
                                <p class="gr1 gr active web_subtitle web_black">
                                    <br />
                                    <br />
                                    <b>Iniciamos</b><br />
                                    <br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Fundamos la primera fintech peruana de Wealth Management<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Abrimos nuestra primera oficina en Lima
                                </p>
                                <p class="gr2 gr web_subtitle web_black web_grey">
                                    <br />
                                    <br />
                                    <b>Empezamos el desarrollo</b><br />
                                    <br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;USD 12 millones volumen operado<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;19 emisiones internacionales<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Lanzamos nuestro portal web<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Iniciamos nuestro primer programa de asesores de inversión

                                </p>
                                <p class="gr3 gr web_subtitle web_black">
                                    <br />
                                    <br />
                                    <b>Empezamos a crecer</b><br />
                                    <br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;USD 35 millones volumen operado<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;41 emisiones internacionales<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Obtuvimos la calificación crediticia B+ estable en Perú
                                </p>
                                <p class="gr4 gr web_subtitle web_black">
                                    <br />
                                    <br />
                                    <b>Nos consolidamos</b><br />
                                    <br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;USD 64 millones volumen operado<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;65 emisiones internacionales<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Obtuvimos la certificación global Endeavor (Madrid, España)<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Superamos los USD5M en intereses generados
                                </p>
                                <p class="gr5 gr web_subtitle web_black">
                                    <br />
                                    <br />
                                    <b>Empezamos la expansión</b><br />
                                    <br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;USD 120 Millones volumen operado<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;90 emisiones internacionales<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Lanzamos el fondo Zest Venture<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Lanzamos Zest Café, nuestro canal híbrido de educación financiera<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Lanzamos Zest App
                                </p>
                                <p class="gr6 gr web_subtitle web_black">
                                    <br />
                                    <br />
                                    <b>Empezamos la expansión</b><br />
                                    <br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;USD 380MM de volumen operado<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;185 emisiones internacionales<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;3 Premios SRP a mejor: Performance de Perú, Distribuidor de Perú e Iniciativa Financiera en todo América<br />
                                    <i class="fas fa-circle web_subtext web_grey"></i>&nbsp;Lanzamiento del Programa de Asesores Zest y El Curso Bloomberg Market Concepts<br />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section id="about_partners" class="about-partners" style="padding-top: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12" style="display: flex">
                    <div>
                        <h1 class="web_title web_grey">Reconocimientos
                        </h1>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="row justify-content-md-center">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-12" >
                            <div class="partner_item">
                                <a href="https://youtu.be/S5mJkTProiA" target="_blank">


                                    <asp:Image ID="ir1" runat="server" ImageUrl="~/Assets/img/website/reconocimientos/1.jpg" />


                                </a>
                            </div>

                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                            <div class="partner_item">
                                <a href="https://youtu.be/S5mJkTProiA" target="_blank">

                                    <asp:Image ID="ir2" runat="server" ImageUrl="~/Assets/img/website/reconocimientos/2.jpg" />

                                </a>
                            </div>


                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                            <div class="partner_item">
                                <a href="https://youtu.be/S5mJkTProiA" target="_blank">
                                    <asp:Image ID="ir3" runat="server" ImageUrl="~/Assets/img/website/reconocimientos/3.jpg" />
                                </a>
                            </div>


                        </div>
                       
                    </div>
                </div>
            </div>

        </div>
    </section>


    <section id="about_partners" class="about-partners" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12" style="display: flex">
                    <div>
                        <h1 class="web_title web_grey">Socios Estratégicos
                        </h1>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="row justify-content-md-center">
                        
                      
                        <div class="col-lg-2 col-md-4 col-sm-6 col-6">
                            <div class="partner_item">
                                <a href="https://www.pershing.com/" target="_blank">
                                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Assets/img/website/partners/mellon.png" />
                                </a>
                            </div>


                        </div>

                        <div class="col-lg-2 col-md-4 col-sm-6 col-6">
                            <div class="partner_item">
                                <a href="https://www.bloomberg.com/" target="_blank">
                                    <asp:Image ID="Image7" runat="server" ImageUrl="~/Assets/img/website/partners/bloomberg.png" />
                                </a>
                            </div>


                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 col-6">
                            <div class="partner_item">
                                <a href="https://www.salesforce.com/" target="_blank">

                                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Assets/img/website/partners/salesforce.png" />

                                </a>
                            </div>


                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 col-6">
                            <div class="partner_item">
                                <a href="https://britech.global/es/" target="_blank">
                                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Assets/img/website/partners/britech.png" />

                                </a>
                            </div>


                        </div>
                        
                        <div class="col-lg-2 col-md-4 col-sm-6 col-6">
                            <div class="partner_item">
                                <a href="https://www.munizlaw.com" target="_blank">
                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/Assets/img/website/partners/estudiom.png" />
                                </a>
                            </div>


                        </div>
                       
                           <div class="col-lg-2 col-md-4 col-sm-6 col-6">
                            <div class="partner_item">
                                <a href="https://fintechperu.com/" target="_blank">
                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Assets/img/website/partners/fintech.png" />
                                </a>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>





    <img src="/Assets/img/website/mobile/25k_mobile.png" style="width: 100%;" class="show_mobile" />
    <section id="about_social" class="proyecto-social">
        <div class="container web_middle_parent" style="min-height: 100vh; height: unset">
            <div class="row web_middle_child" style="margin: auto 0px;">
                <img class="proyecto_img hide_mobile" src="/Assets/img/website/nosotros/25k1k.png" />
                <div class="col-lg-8 col-md-12 ">
                    <h1 class="web_title">
                        <asp:Literal ID="ltTitle" runat="server"></asp:Literal>
                    </h1>
                    <br />

                     <p class="web_subtitle web_white">
                         
                        <asp:Literal ID="ltDesc" runat="server"></asp:Literal>
                           </p>
                   
                  
                    <br />
                    <br />

                </div>
                <div class="col-md-12">
                    <div class="row">
                        <asp:Repeater ID="rpPublicaciones" runat="server">
                            <ItemTemplate>
                                  <div class="col-md-4">
                            <asp:HyperLink ID="LinkButton1" CssClass="proyecto_item web_white" runat="server" NavigateUrl='<%# Eval("cta") %>' Target="_blank">
                                <i class='<%# Eval("rrss") %>'></i>
                                <div>
                                    <h1 class="web_subtitle">
                                      <b> <%# Eval("titulo") %></b>
                                    </h1>
                                    <h4 class="web_text">
                                        <%# Eval("descripcion") %>
                                    </h4>
                                </div>
                            </asp:HyperLink>
                        </div>
                            </ItemTemplate>
                        </asp:Repeater>
                      

                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="certificates" class="about-partners" style="background:#F3F3F3">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3" style="display: flex">
                     <div style="margin:auto;width:150px">
                         <img src="/Assets/img/website/nosotros/sello.svg" style="width:150px"/>
                         </div>
                  </div>
                <div class="col-lg-9 col-md-9" style="display: flex">
                    <div style="margin:auto">
                        <h1 class="web_title web_grey">
                            Somos una empresa  que está comprometida con construir y mantener una cultura empresarial de alta confianza y ofrece una experiencia de trabajo de estándares mundiales a sus colaboradores.
                        </h1>
                        <br />
                        <br />
                         <a href="#" data-toggle="modal" data-target="#cafe_modal" class="btn-zest-black web_subtitle">Conoce más
                        </a>
                    </div>
                </div>
                  <div class="modal fade" id="cafe_modal" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog web_middle_parent modal-lg " role="document">
                            <div class="modal-content web_middle_child" style="background: unset; border: unset;margin:auto auto">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>
                               <iframe style="width:100%;height:50vh" src="https://www.youtube.com/embed/d31JH9_Zxl8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript" src="https://sorgalla.com/jcarousel/dist/jquery.jcarousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jcarousel/0.3.9/jquery.jcarousel-autoscroll.min.js"></script>
    <script src="<%=ResolveClientUrl("~/Assets/js/carousel.js") %>" type="text/javascript"></script>
    <script>
        $(function () {

            $("#navbar").removeClass("navbar-light");
            $("#navbar").addClass("navbar-dark scrolled");
            $("#liaboutus").addClass("active");
            $('.jcarousel').jcarousel({
            }).jcarouselAutoscroll({
                interval: 100000,
                target: '+=1',
                autostart: false
            });
            interval();
        });
        var i = 1;
        function interval() {
            $(".gr").removeClass("active");
            $(".p" + i).addClass("active");
            $(".gr" + i).addClass("active");
            i++;
            if (i > 6)
                i = 1;
            setTimeout(function () { interval(); }, 13000);
        }

        $(".p1").click(function () {
            $(".gr").removeClass("active");
            $(this).addClass("active");
            $(".gr1").addClass("active");
        }
        );
        $(".p2").click(function () {
            $(".gr").removeClass("active");
            $(this).addClass("active");
            $(".gr2").addClass("active");
        }
        );
        $(".p3").click(function () {
            $(".gr").removeClass("active");
            $(this).addClass("active");
            $(".gr3").addClass("active");
        }
        );
        $(".p4").click(function () {
            $(".gr").removeClass("active");
            $(this).addClass("active");
            $(".gr4").addClass("active");
        }
        );
        $(".p5").click(function () {
            $(".gr").removeClass("active");
            $(this).addClass("active");
            $(".gr5").addClass("active");
        }
        ); $(".p6").click(function () {
            $(".gr").removeClass("active");
            $(this).addClass("active");
            $(".gr6").addClass("active");
        }
        );

        var canvas = document.getElementById('nokey'),
            can_w = parseInt(canvas.getAttribute('width')),
            can_h = parseInt(canvas.getAttribute('height')),
            ctx = canvas.getContext('2d');

        // console.log(typeof can_w);

        var ball = {
            x: 0,
            y: 0,
            vx: 0,
            vy: 0,
            r: 0,
            alpha: 1,
            phase: 0
        },
            ball_color = {
                r: 26,
                g: 26,
                b: 26
            },
            R = 3,
            balls = [],
            alpha_f = 0.03,
            alpha_phase = 0,

            // Line
            link_line_width = 0.8,
            dis_limit = 260,
            add_mouse_point = true,
            mouse_in = false,
            mouse_ball = {
                x: 0,
                y: 0,
                vx: 0,
                vy: 0,
                r: 0,
                type: 'mouse'
            };

        // Random speed
        function getRandomSpeed(pos) {
            var min = -1,
                max = 1;
            switch (pos) {
                case 'top':
                    return [randomNumFrom(min, max), randomNumFrom(0.1, max)];
                    break;
                case 'right':
                    return [randomNumFrom(min, -0.1), randomNumFrom(min, max)];
                    break;
                case 'bottom':
                    return [randomNumFrom(min, max), randomNumFrom(min, -0.1)];
                    break;
                case 'left':
                    return [randomNumFrom(0.1, max), randomNumFrom(min, max)];
                    break;
                default:
                    return;
                    break;
            }
        }
        function randomArrayItem(arr) {
            return arr[Math.floor(Math.random() * arr.length)];
        }
        function randomNumFrom(min, max) {
            return Math.random() * (max - min) + min;
        }
        // Random Ball
        function getRandomBall() {
            var pos = randomArrayItem(['top', 'right', 'bottom', 'left']);
            switch (pos) {
                case 'top':
                    return {
                        x: randomSidePos(can_w),
                        y: -R,
                        vx: getRandomSpeed('top')[0],
                        vy: getRandomSpeed('top')[1],
                        r: R,
                        alpha: 1,
                        phase: randomNumFrom(0, 10)
                    }
                    break;
                case 'right':
                    return {
                        x: can_w + R,
                        y: randomSidePos(can_h),
                        vx: getRandomSpeed('right')[0],
                        vy: getRandomSpeed('right')[1],
                        r: R,
                        alpha: 1,
                        phase: randomNumFrom(0, 10)
                    }
                    break;
                case 'bottom':
                    return {
                        x: randomSidePos(can_w),
                        y: can_h + R,
                        vx: getRandomSpeed('bottom')[0],
                        vy: getRandomSpeed('bottom')[1],
                        r: R,
                        alpha: 1,
                        phase: randomNumFrom(0, 10)
                    }
                    break;
                case 'left':
                    return {
                        x: -R,
                        y: randomSidePos(can_h),
                        vx: getRandomSpeed('left')[0],
                        vy: getRandomSpeed('left')[1],
                        r: R,
                        alpha: 1,
                        phase: randomNumFrom(0, 10)
                    }
                    break;
            }
        }
        function randomSidePos(length) {
            return Math.ceil(Math.random() * length);
        }

        // Draw Ball
        function renderBalls() {
            Array.prototype.forEach.call(balls, function (b) {
                if (!b.hasOwnProperty('type')) {
                    ctx.fillStyle = 'rgba(' + ball_color.r + ',' + ball_color.g + ',' + ball_color.b + ',' + b.alpha + ')';
                    ctx.beginPath();
                    ctx.arc(b.x, b.y, R, 0, Math.PI * 2, true);
                    ctx.closePath();
                    ctx.fill();
                }
            });
        }

        // Update balls
        function updateBalls() {
            var new_balls = [];
            Array.prototype.forEach.call(balls, function (b) {
                b.x += b.vx;
                b.y += b.vy;

                if (b.x > -(50) && b.x < (can_w + 50) && b.y > -(50) && b.y < (can_h + 50)) {
                    new_balls.push(b);
                }

                // alpha change
                b.phase += alpha_f;
                b.alpha = Math.abs(Math.cos(b.phase));
                // console.log(b.alpha);
            });

            balls = new_balls.slice(0);
        }

        // loop alpha
        function loopAlphaInf() {

        }

        // Draw lines
        function renderLines() {
            var fraction, alpha;
            for (var i = 0; i < balls.length; i++) {
                for (var j = i + 1; j < balls.length; j++) {

                    fraction = getDisOf(balls[i], balls[j]) / dis_limit;

                    if (fraction < 1) {
                        alpha = (1 - fraction).toString();

                        ctx.strokeStyle = 'rgba(150,150,150,' + alpha + ')';
                        ctx.lineWidth = link_line_width;

                        ctx.beginPath();
                        ctx.moveTo(balls[i].x, balls[i].y);
                        ctx.lineTo(balls[j].x, balls[j].y);
                        ctx.stroke();
                        ctx.closePath();
                    }
                }
            }
        }

        // calculate distance between two points
        function getDisOf(b1, b2) {
            var delta_x = Math.abs(b1.x - b2.x),
                delta_y = Math.abs(b1.y - b2.y);

            return Math.sqrt(delta_x * delta_x + delta_y * delta_y);
        }

        // add balls if there a little balls
        function addBallIfy() {
            if (balls.length < 20) {
                balls.push(getRandomBall());
            }
        }

        // Render
        function render() {
            ctx.clearRect(0, 0, can_w, can_h);

            renderBalls();

            renderLines();

            updateBalls();

            addBallIfy();

            window.requestAnimationFrame(render);
        }

        // Init Balls
        function initBalls(num) {
            for (var i = 1; i <= num; i++) {
                balls.push({
                    x: randomSidePos(can_w),
                    y: randomSidePos(can_h),
                    vx: getRandomSpeed('top')[0],
                    vy: getRandomSpeed('top')[1],
                    r: R,
                    alpha: 1,
                    phase: randomNumFrom(0, 10)
                });
            }
        }
        // Init Canvas
        function initCanvas() {
            canvas.setAttribute('width', window.innerWidth);
            canvas.setAttribute('height', window.innerHeight);

            can_w = parseInt(canvas.getAttribute('width'));
            can_h = parseInt(canvas.getAttribute('height'));
        }
        window.addEventListener('resize', function (e) {
            console.log('Window Resize...');
            initCanvas();
        });

        function goMovie() {
            initCanvas();
            initBalls(30);
            window.requestAnimationFrame(render);
        }
        goMovie();

        // Mouse effect
        canvas.addEventListener('mouseenter', function () {
            mouse_in = true;
            balls.push(mouse_ball);
        });
        canvas.addEventListener('mouseleave', function () {
            mouse_in = false;
            var new_balls = [];
            Array.prototype.forEach.call(balls, function (b) {
                if (!b.hasOwnProperty('type')) {
                    new_balls.push(b);
                }
            });
            balls = new_balls.slice(0);
        });
        canvas.addEventListener('mousemove', function (e) {
            var e = e || window.event;
            mouse_ball.x = e.pageX;
            mouse_ball.y = e.pageY;
            // console.log(mouse_ball);
        });

    </script>

</asp:Content>
