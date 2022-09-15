<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="Legalfundation.aspx.cs" Inherits="Zest_App.Resources.Views.Website.Legalfundation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section class="section_title" style="padding: 50px">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="web_title">Fundación Zest
                        <br />
                        AUTORIZACIÓN PARA EL TRATAMIENTO DE DATOS PERSONALES 
                    </h1>
                </div>
            </div>
        </div>
    </section>
    <section class="section_body" style="background: #000;padding-top:40px !important">
        <div class="container">
            <div class="row">
                <div class="col-md-12" style="text-align: justify">
                    <p class="web_text web_white">
                        Por medio de la aceptación de los presentes términos y condiciones, el usuario otorga libremente su consentimiento para que 
                        Fundación Zest <b>(Fundación Zest para incentivar la Educación Financiera de los Peruanos),</b> que registrada en el Consejo de
                        Supervigilancia de Fundaciones: N° 029-2021-JUS/CSF, identificada con RUC N° (20607191434) y con domicilio en Calle Coronel
                        Andres Reyes 360, San Isidro, recopile, procese y almacene su información personal en el banco de datos denominado “Salesforce: 
                        Prospectos” por un plazo indeterminado para la(s) siguiente(s) finalidad(es) específica(s): 
                    </p>
                    <p class="web_text web_white">
                       <ul>
                           <li style="color:#fff;font-size:0.8rem">
                               (i) Perfilamiento y prospección comercial
                           </li>
                           <li style="color:#fff;font-size:0.8rem">
                               (ii) Contactar y enviar información sobre ofertas educativas, envío de publicidad mediante cualquier medio y soporte para fines estadísticos, información sobre gestiones institucionales
                           </li>
                           <li style="color:#fff;font-size:0.8rem">
                               (iii) Envío periódico de información genérica del mercado elaborada y/o recopilada por nuestra empresa (análisis diarios, blogs mensuales, entre otros).
                           </li>
                       </ul>
                    </p>
                    <p class="web_text web_white">
                        Fundación Zest deja constancia de que cualquier información enviada al usuario fue solicitada por éste con motivo de la aceptación de estos términos 
                        y condiciones, y tiene exclusivamente fines informativos y educativos, por lo cual no constituye en ninguna circunstancia una oferta al pública, o 
                        una invitación a ofrecer, cualquier tipo de productos o servicios financieros dentro de la República del Perú. Asimismo, en ningún caso debe entenderse
                        esta información como una recomendación de inversión por parte de nuestra empresa.
                    </p>
                    <p class="web_text web_white">
                      Se deja constancia que la información a ser enviada ha sido elaborada y/o recopilada por nuestra empresa a través de fuentes públicas por lo cual no se garantiza 
                        que esta sea exacta, actualizada, idónea y completa. En tal sentido, cualquier opinión vertida no debe tomarse como una afirmación absoluta e inalterable ni
                        sustituir el juicio y el criterio propios de la persona a la que llegue.
                    </p>
                    <p class="web_text web_white">
                      Cuando se suscriban convenios para realizar actividades académicas con otras instituciones, y si se ha comunicado a los titulares, los datos únicamente podrán 
                        ser compartidos o transferidos para los fines de registro de las certificaciones que se otorguen como parte de estos convenios.
                    </p>
                      <p class="web_text web_white">
                     Fundación Zest podrá tratar la información del usuario directamente o mediante terceros que pueden encontrarse dentro o fuera del Perú, los cuales están limitados 
                          por las finalidades antes indicadas. La relación de los terceros es la siguiente:
                    </p>
                      <p class="web_text web_white">
                       <ul>
                           <li style="color:#fff;font-size:0.8rem">
                              Salesforce Inc.
                           </li>
                           <li style="color:#fff;font-size:0.8rem">
                               Salesforce Tower, 415 Mission Street, 3rd Floor, San Francisco, CA 94105. EE.UU.
                           </li>
                           <li style="color:#fff;font-size:0.8rem">
                              CRM de la Empresa (Banco de Datos)
                           </li>
                       </ul>
                    </p>
                       <p class="web_text web_white">
                    Esta autorización es voluntaria; sin ella, las finalidades arriba indicadas no se podrán realizar.
                    </p>
                       <p class="web_text web_white">
                    El usuario podrá revocar o ejercer los derechos de acceso, rectificación, cancelación y oposición de los datos personales previstos en la Ley N° 29733 de manera gratuita, escribiendo a
                          <a href="mailto:fundacion@zest.pe" style="color: #dabe04"> fundacion@zest.pe</a>. 
                    </p>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $("#navbar").removeClass("navbar-light");
            $("#navbar").addClass("navbar-dark scrolled");
            $("#lifaq").addClass("active");
            $(".contact-section").hide();

        });
    </script>
</asp:Content>
