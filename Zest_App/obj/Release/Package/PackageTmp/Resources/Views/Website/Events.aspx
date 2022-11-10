<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Zest_App.Resources.Views.Website.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="canonical" href="http://ospzest.finnerve.com/events" />
    <style>
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section class="eventHeader">
        <div class="container-fluid">
            <div class="row">
                <div id="carEvents" class="carousel slide" data-ride="carousel" style="width: 100%">
                    <ol class="carousel-indicators">
                        <li data-target="#carEvents" data-slide-to="0" class="active"></li>
                        <li data-target="#carEvents" data-slide-to="1"></li>
                        <li data-target="#carEvents" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <asp:Repeater ID="rpEvents" runat="server">
                            <ItemTemplate>
                                <div class="carousel-item  <%# Container.ItemIndex == 0 ? "active" : ""%>">
                                    <div class="carousel-event" style='<%# "background-image:url("+Eval("url_img_banner")+")"%>;background-position: right bottom;'>
                                        <div class="carousel-event-content col-lg-5 col-md-7 col-sm-12">
                                            <h1 class="web_header web_white">
                                                <%# Eval("titulo") %>
                                            </h1>
                                            <p class="web_text web_white">
                                                <%# Eval("descripcion") %>
                                            </p>
                                            <span class="web_text web_white" style="text-align: left; display: block; width: 100%">
                                                <img src="/Assets/img/website/iconos/icon_calendar_white.svg" style="width: 20px; margin-right: 10px;" /><%# ((DateTime)Eval("event_date")).Day %> de <%# ((DateTime)Eval("event_date")).ToString("MMMM",System.Globalization.CultureInfo.CreateSpecificCulture("es")) %>  <%# ((DateTime)Eval("event_date")).Year %><br />
                                                <br />
                                                <img src="/Assets/img/website/iconos/icon_reloj_white.svg" style="width: 20px; margin-right: 10px;" /><%# ((DateTime)Eval("event_date")).ToShortTimeString() %><br />
                                                <br />
                                                <img src="/Assets/img/website/iconos/icon_mapa_white.svg" style="width: 20px; margin-right: 10px;" /><%# Eval("lugar") %> 
                                            </span>
                                            <br />
                                            <a class="btn-zest-yellow" href='<%# Eval("cta") %>'>más detalle</a>
                                        </div>
                                    </div>

                                </div>

                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                    <a class="carousel-control-prev hide_mobile" href="#carEvents" role="button" data-slide="prev">
                        <span class="action_carousel" aria-hidden="true">&lsaquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next hide_mobile" href="#carEvents" role="button" data-slide="next">
                        <span class="action_carousel" aria-hidden="true">&rsaquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>

    </section>
  
    <section class="event_items" style="margin: 70px 0px">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                  <ul class="nav text-center events_title" id="myEvents" role="tablist" >
                  <li class="nav-item" >
                    <a class="btn_zest_nav web_title web_grey active" id="home-tab" data-toggle="tab" href="#present" role="tab" aria-controls="home" aria-selected="true">Próximos eventos</a>
                  </li>
                  <li class="nav-item" >
                    <a class="btn_zest_nav web_title web_grey" id="profile-tab" data-toggle="tab" href="#past" role="tab" aria-controls="profile" aria-selected="false">Eventos pasados</a>
                  </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="present" role="tabpanel" aria-labelledby="home-tab">
                       <asp:UpdatePanel ID="upFullEvents" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <asp:Repeater ID="rpFullEvents" runat="server">
                            <ItemTemplate>

                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="caja_evento">
                                        <div class="caja_evento_header" style='<%# "background-image:url("+Eval("url_img")+")"%>;background-position: right bottom;'>
                                            <img style="display:none" src="/Assets/img/website/cinta.svg" />
                                        </div>
                                        <p class="caja_evento_detalle web_text">
                                            <b class="web_subtitle" style="font-weight: bold"><%# Eval("titulo") %></b><br /><br />
                                          
                                            <span class="web_text web_black" style="text-align: left; display: block; width: 100%">
                                                <%# ((DateTime)Eval("event_date")).Day %> de <%# ((DateTime)Eval("event_date")).ToString("MMMM",System.Globalization.CultureInfo.CreateSpecificCulture("es")) %>  <%# ((DateTime)Eval("event_date")).Year %>
                                                <br /><%# ((DateTime)Eval("event_date")).ToShortTimeString() %> 
                                                <br />
                                                <%# Eval("lugar") %> 
                                            </span>
                                        </p>
                                        <div class="caja_evento_cta">
                                            <a class="btn-zest-yellow-border" style="margin: auto" href='<%# Eval("cta") %>'>ver más
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                       
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
                  </div>
                  <div class="tab-pane fade" id="past" role="tabpanel" aria-labelledby="profile-tab">
                       <asp:UpdatePanel ID="upPastEvents" runat="server" >
                <ContentTemplate>
                    <div class="row">
                      
                        <asp:Repeater ID="rpPastEvents" runat="server" >
                            <ItemTemplate>
                                <div class="col-md-4">
                                    <div class="caja_evento">
                                        <div class="caja_evento_header" style='<%# "background-image:url("+Eval("url_img")+")"%>;background-position: right bottom;'>
                                         <img style="display:none" src="/Assets/img/website/cinta.svg" />
                                        </div>
                                        <p class="caja_evento_detalle web_text">
                                            <b class="web_subtitle" style="font-weight: bold"><%# Eval("titulo") %></b><br /><br />
                                           
                                            <span class="web_text web_black" style="text-align: left; display: block; width: 100%">
                                                <%# ((DateTime)Eval("event_date")).Day %> de <%# ((DateTime)Eval("event_date")).ToString("MMMM",System.Globalization.CultureInfo.CreateSpecificCulture("es")) %>  <%# ((DateTime)Eval("event_date")).Year %>
                                                <br /><%# ((DateTime)Eval("event_date")).ToShortTimeString() %> 
                                                <br />
                                                <%# Eval("lugar") %> 
                                                
                                            </span>
                                        </p>
                                        <div class="caja_evento_cta">
                                            <a class="btn-zest-yellow-border" style="margin: auto" href='<%# Eval("cta") %>'>ver más
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
                  </div>
                </div>
                </div>
            </div>
           

        </div>
        <div class="container" style="margin-top:20px">
           
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
        function endReq(sender, args) {
            $(function () {
                var cw = $('.same-height').width();
                $('.same-height').css({ 'height': cw + 'px' });

                $("#navbar").addClass("navbar-light");

                $(".newsLetter").show();
            });

            /*  $("html").click(function () {
                  $('.shadow_screen').removeClass('active');
                  $('.dropdown-menu').removeClass('show');
              });
              $("#menuef").click(function () {
                  $('.shadow_screen').toggleClass('active');
                  $('.dropdown-menu').toggleClass('show');
                  event.stopPropagation();
              });*/

        }

        $(function () {
            var cw = $('.same-height').width();
            $('.same-height').css({ 'height': cw + 'px' });

            $("#navbar").addClass("navbar-light scrolled");
            $("#liEvents").addClass("active");
            $(".newsLetter").show();

        });

        /* $("html").click(function () {
             $('.shadow_screen').removeClass('active');
             $('.dropdown-menu').removeClass('show');
 
         });
 
         $("#menuef").click(function () {
             $('.shadow_screen').toggleClass('active');
             $('.dropdown-menu').toggleClass('show');
             event.stopPropagation();
         });*/


    </script>
</asp:Content>
