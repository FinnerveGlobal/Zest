<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Zest_App.Resources.Views.Website.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <section class="home-landing" runat="server" id="secLanding" style="display: flex;display: -webkit-flex;">
          <div class="sello">
                     <div class="container">
                         <img src="/Assets/img/website/nosotros/sello_white.svg" style="float:right"/>
                     </div>
                
            </div>
        <canvas id="nokey" width="800" height="800" style="position: absolute; z-index: 1; width: 60%; left: 20%; top: 20%"></canvas>
        <asp:Image ID="Image8" CssClass="home-landing-back hide_mobile" ImageUrl="~/Assets/img/assets/franjas-yellow.svg" runat="server" />
        <asp:Image ID="Image4" CssClass="home-landing-back2 hide_mobile" ImageUrl="~/Assets/img/assets/franjas-yellow.svg" runat="server" />

        <div class="text-center" style="margin: auto">
                
           
            <h1 class="web_header web_yellow">

                <asp:Literal ID="ltLandingTitle" runat="server"></asp:Literal>

            </h1>
            <br />
            <h4 class="web_white web_subheader">
                <asp:Literal ID="ltLandingDesc" runat="server"></asp:Literal>
            </h4>
        </div>
    </section>
    <section class="home-resumen" runat="server" id="secResumen" style="display: flex;display: -webkit-flex;">
        <div class="" style="margin: auto">
            <h1 class="web_title web_black web_text_justify_center">
                <b class="web_yellow web_header">"</b><asp:Literal ID="ltResumenCita" runat="server"></asp:Literal>
                <b class="web_yellow web_header">"</b>
                <br />
                <br />
                <span style="display: block;" class="web_subtitle f_right">
                 <b class="web_header" style="color: #FBFBFB">"</b>  &nbsp;<asp:Literal ID="ltResumenAuthor" runat="server"></asp:Literal>&nbsp;<b class="web_header" style="color: #FBFBFB">"</b>
                </span>
            </h1>
        </div>

    </section>
    <section class="home-cifras-clave" runat="server" id="secCifras" style="padding-bottom:70px !important">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="web_title">Nuestros números en la historia Zest</h1>
                    <h4 class="web_subtitle" style="float:right;color:#fff;"><asp:Literal ID="ltCifrasFecha" runat="server"></asp:Literal></h4>
                </div>
                <div class="col-md-4">
                    <asp:Image ID="Image1" CssClass="cc-back" ImageUrl="~/Assets/img/website/zest-home-cifras.svg" runat="server" data-aos="fade-right" data-aos-duration="1500" />
                    <div class="cifra-clave" data-aos="fade-in">
                        <h1>
                            <span>USD</span>
                            +<b>
                                <asp:Literal ID="ltCifra1" runat="server"></asp:Literal>
                            </b>Millones
                        </h1>
                        <h4 class="web_subtitle">volumen de inversión
                        </h4>
                    </div>

                </div>
                <div class="col-md-4">
                    <asp:Image ID="Image2" CssClass="cc-back" ImageUrl="~/Assets/img/website/zest-home-cifras.svg" runat="server" data-aos="fade-right" data-aos-duration="1500" />
                    <div class="cifra-clave" data-aos="fade-in">
                        <h1>
                            <span>USD</span>
                            +<b><asp:Literal ID="ltCifra2" runat="server"></asp:Literal></b>
                            Millones
                        </h1>
                        <h4 class="web_subtitle">intereses pagados
                        </h4>
                    </div>

                </div>
                <div class="col-md-4">
                    <asp:Image ID="Image3" CssClass="cc-back" ImageUrl="~/Assets/img/website/zest-home-cifras.svg" runat="server" data-aos="fade-right" data-aos-duration="1500" />
                    <div class="cifra-clave" data-aos="fade-in">
                        <h1>+<b><asp:Literal ID="ltCifra3" runat="server"></asp:Literal></b>
                            Títulos
                        </h1>
                        <h4 class="web_subtitle">internacionales emitidos
                            <br />
                            en el mercado de capitales
                        </h4>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--<section class="home-cifras-text text-center">
        <h1><b>"Nuestros números en la historia Zest"</b></h1>
    </section>-->
    <section class="home-app" runat="server" id="secApp2" style="display:none">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-5 col-sm-12">
                    <asp:Image ID="imgApp" CssClass="home-app-img" ImageUrl="~/Assets/img/website/zest-app.png" runat="server" />
                </div>
                <div class="col-lg-6 col-md-7 col-sm-12">
                    <h1 class="web_title web_middle">Zest App</h1>
                    <h4 class="web_subtitle web_white">
                        <br />
                        Revisa tus inversiones y entérate de lo que está pasando en el mercado desde nuestra app<br />
                        <br />
                        Búscala como "Zest Capital" en PlayStore o AppStore
                        <br />
                        <br />
                        <br />
                    </h4>
                    <h4 class="web_subtitle web_white">¡Descárgala hoy!</h4>
                    <div class="btn-stores" style="padding: 30px 0px">
                        <a class="appstore" href="#">
                            <asp:Image ID="appstore" ImageUrl="~/Assets/img/website/appstore.png" runat="server" />
                        </a>
                        <a class="playstore" href="#">
                            <asp:Image ID="playstore" ImageUrl="~/Assets/img/website/playstore.png" runat="server" />
                        </a>
                    </div>
                    <h6 class="web_subtitle web_white">
                        <span class="web_yellow">¿Primera vez en el app?</span><br />
                        Conoce todo lo que puede hacer <a href="/apphow" class="web_yellow">aquí</a>

                    </h6>
                </div>
            </div>
        </div>
    </section>
    <img src="/Assets/img/website/mobile/app_mobile.png" style="width:100%;" class="show_mobile"/>
     <section class="home-zest-fundation" runat="server" id="secApp">
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-5 hex-back">
                    <img src="/Assets/img/website/zest_app.png" style="width: 100%;" />
                </div>
                <div class="col-lg-7 col-md-12 col-sm-12 web_middle_parent web_hexagons" >
                    <div class="web_middle_child">
                        <h1 class="web_title ">Lanzamos Zest App</h1>
                    <h4 class="web_subtitle web_white ">
                        <br />
                        Revisa tus inversiones y entérate de lo que está pasando en el mercado desde nuestra app<br />
                        <br />
                        Búscala como "Zest Capital" en Google Play o App Store
                        <br />
                        <br />
                        <br />
                    </h4>
                    <h4 class="web_subtitle web_white">¡Descárgala hoy!</h4>
                    <div class="btn-stores" style="padding: 30px 0px">
                        <a class="appstore" href="https://apps.apple.com/pe/app/zest-app/id1555182708" target="_blank">
                            <asp:Image ID="Image6" ImageUrl="~/Assets/img/website/appstore.png" runat="server" />
                        </a>
                        <a class="playstore" href="https://play.google.com/store/apps/details?id=com.zestcapital.app" target="_blank">
                            <asp:Image ID="Image9" ImageUrl="~/Assets/img/website/playstore.png" runat="server" />
                        </a>
                    </div>
                    <h6 class="web_subtitle web_white">
                        <span class="web_yellow">¿Primera vez en el app?</span><br />
                        Conoce todo lo que puede hacer <a href="/apphow" class="web_yellow">aquí</a>

                    </h6>
                    </div>

                </div>
            </div>
            </div>
    </section>
    <img src="/Assets/img/website/mobile/cafe_mobile.png" style="width:100%" class="show_mobile"/>
    <section class="home-zestcafe" runat="server" id="secCafe">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-7 col-md-12 col-sm-12 web_middle_parent web_hexagons">
                    <div class="home-zestcafe-back web_middle_child">
                        <img src="/Assets/img/logos/zestCafe.svg" class="home_logos" />
                        <br />
                        <br />
                        <h4 class="web_subtitle web_black">Un nuevo espacio para dialogar sobre el mercado de capitales
                        </h4>
                        <br />
                        <br />
                        <a href="#" data-toggle="modal" data-target="#cafe_modal" class="btn-zest-black web_subtitle">Conoce más
                        </a>
                    </div>

                </div>

                <div class="col-md-5 hex-back" id="hex_1">
                    <img src="/Assets/img/website/zest_cafe.png" style="width: 100%;" />
                </div>
            </div>
            </div>
    </section>
     <!-- Modal -->
                    <div class="modal fade" id="cafe_modal" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog web_middle_parent modal-lg " role="document">
                            <div class="modal-content web_middle_child" style="background: unset; border: unset;margin:auto auto">
                                <button type="button" class="close web_white" data-dismiss="modal" aria-label="Close" style="position: absolute; right: 0; top: 40px;z-index:10000">
                                    <span aria-hidden="true" style="font-size: 44px;">&times;</span>
                                </button>
                               <iframe style="width:100%;height:50vh" src="https://www.youtube.com/embed/oN52BdXn7PM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>


    <img src="/Assets/img/website/mobile/fundacion_mobile.png" style="width:100%" class="show_mobile"/>
    <section class="home-zest-fundation" runat="server" id="secFundation">
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-5 hex-back">
                    <img src="/Assets/img/website/zest_fund.png" style="width: 100%;" />
                </div>
                <div class="col-lg-7 col-md-12 col-sm-12 web_middle_parent web_hexagons" >
                    <div class="web_middle_child">
                        <img src="/Assets/img/logos/zestFundation.svg" class="home_logos" />
                        <br />
                        <br />
                        <br />
                        <h4 class="web_subtitle web_white">Promovemos e incentivamos la educación financiera, ofreciéndote herramientas para alcanzar más rápido tus metas financieras

                        </h4>
                        <br />
                        <br />
                        <a href="/events" class="btn-zest-white web_subtitle">Conoce más 
                        </a>
                    </div>

                </div>
            </div>
            </div>
    </section>
    
    <img src="/Assets/img/website/mobile/venture_mobile.png" style="width:100%" class="show_mobile"/>
    <section class="home-venture" runat="server" id="secVenture">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-7 col-md-12 col-sm-12 web_middle_parent web_hexagons" >
                    <div class="web_middle_child" >
                        <img src="/Assets/img/logos/zestVenture.svg" class="home_logos" />
                        <br />
                        <br />
                        <h4 class="web_subtitle web_black" style="width: 100%">Apoyamos el desarrollo de proyectos de alta escalabilidad en Latinoamérica, con financiamiento para seguir creciendo
                        <br />
                            <br />
                            <br />
                        </h4>

                        <div class="row" style="margin-bottom: 30px;">
                            <div class="col-12" style="display: inline-flex;display: -webkit-inline-flex;">
                                <a href="https://www.instagram.com/oakberrype/" target="_blank">
                                    <asp:Image ID="Image5" ImageUrl="~/Assets/img/website/oak_berry.png" runat="server" Style="width: 70px; height: 70px; border-radius: 10px" />
                                </a>
                                <label class="web_subtitle" style="margin: auto auto auto 30px; font-weight: normal;">
                                    Red de fast food saludable con más
                            de 300 tiendas en 10 países
                                </label>

                            </div>
                            <div class="col-12" style="display: inline-flex;display: -webkit-inline-flex; margin-top: 20px;">
                                <a href="https://www.instagram.com/bonitabarecozinha/" target="_blank">
                                    <asp:Image ID="Image7" ImageUrl="~/Assets/img/website/bonita_logo.jpg" runat="server" Style="width: 70px; height: 70px; border-radius: 10px" />
                                </a>
                                <label class="web_subtitle" style="margin: auto auto auto 30px; font-weight: normal;">
                                    Restobar concepto inspirado en
                            villas cubanas

                                </label>

                            </div>
                        </div>
                        <br />
                        <br />
                        <a href="mailto:venture@zestcapital.com.pe?subject=Financiamiento para proyectos" class="btn-zest-black web_subtitle">Contáctanos
                        </a>
                    </div>
                </div>

                <div class="col-md-5 hex-back" id="hex_3">
                    <img src="/Assets/img/website/zest_venture.png" style="width: 100%;" />
                </div>
            </div>
        </div>

    </section>
      <section class="publicidad">
          <div class="container">
              <div class="row">
                  <div class="col-md-12">
                      <iframe src="https://anchor.fm/zestcapital/embed" style="width: 100%; margin-top:10%; height: 200px;border:20px #dabe04 solid;border-radius:10px" frameborder="0" scrolling="no"></iframe>
                  </div>
              </div>
          </div>           
       </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        var btmp = true;
        var btmp2 = true;
        $(function () {
            $(".secNews").show();
            $("#navbar").removeClass("navbar-light");
            $("#navbar").addClass("navbar-dark scrolled");

            $(allInView);
            $(window).scroll(allInView);


        });


        function isScrolledIntoView(elem) {
            var docViewTop = $(window).scrollTop();
            var docViewBottom = docViewTop + $(window).height();

            var elemTop = $(elem).offset().top;
            var elemBottom = elemTop + $(elem).height() + 100;

            return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
        }

        function allInView() {
            if (isScrolledIntoView($(".counter"))) {
                if (btmp) {
                    btmp = false;
                    const counters = document.querySelectorAll('.counter');

                    counters.forEach(counter => {
                        const updateCount = () => {
                            const target = +counter.getAttribute('data-target');
                            const count = +counter.innerText;

                            if (count < target) {
                                counter.innerText = (count + 1);
                                setTimeout(updateCount, 15);
                            } else {
                                counter.innerText = target;
                            }
                        };

                        updateCount();
                    });
                }
            }
            else {
                btmp = true;
                const counters = document.querySelectorAll('.counter');
                counters.forEach(counter => {
                    counter.innerText = "0";
                });
            }

            if (isScrolledIntoView($(".counter2"))) {
                if (btmp2) {
                    btmp2 = false;
                    const counters = document.querySelectorAll('.counter2');

                    counters.forEach(counter => {
                        const updateCount = () => {
                            const target = +counter.getAttribute('data-target');
                            const count = +counter.innerText;

                            if (count < target) {
                                counter.innerText = (count + 1);
                                setTimeout(updateCount, 300);
                            } else {
                                counter.innerText = target;
                            }
                        };

                        updateCount();
                    });
                }
            }
            else {
                btmp2 = true;
                const counters = document.querySelectorAll('.counter2');
                counters.forEach(counter => {
                    counter.innerText = "0";
                });
            }

        }


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
                r: 207,
                g: 255,
                b: 4
            },
            R = 2,
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
