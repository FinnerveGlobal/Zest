<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/web.Master" AutoEventWireup="true" CodeBehind="Legalinfo.aspx.cs" Inherits="Zest_App.Resources.Views.Website.Legalinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section class="section_title" style="padding:50px">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="web_title">Términos y Condiciones
                    </h1>
                </div>
            </div>
        </div>
    </section>
    <section class="section_body" style="background:#000">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="web_subtitle web_white">Disclaimer
                        <br />
                        <br />
                    </h1>
                </div>
                <div class="col-md-12" style="text-align: justify">
                    <p class="web_text web_white">
                        Zest Capital Perú S.A.C. es una sociedad gestora de fondos de inversión cuyos certificados son colocados mediante oferta privada
                        dirigida exclusivamente para inversionistas institucionales. De conformidad con el artículo 12 de la Ley de Fondos de Inversión y sus
                        Sociedades Administradoras, se deja constancia de que nuestra empresa, así como los fondos de inversión que administramos, no
                        se encuentra bajo supervisión alguna de la Superintendencia del Mercado de Valores (SMV).
                    </p>
                    <p class="web_text web_white">
                        Esta página web está dirigida para Inversionistas Institucionales conforme este término se define en la Resolución SMV No. 021-
                        2013-SMV/01 y sus normas modificatorias. Cualquiera que no pertenezca a esta categoría, o comprenda el alcance de tal condición,
                        debe de salir de esta página web. Este sitio no está destinado para y no debe acceder a él otro tipo de inversionistas, ya que su
                        contenido está enfocado para inversionistas sofisticados con capacidad de comprender, gestionar y evaluar adecuadamente los
                        riesgos asociados a cualquier decisión de inversión que realice de tiempo en tiempo.
                    </p>
                    <p class="web_text web_white">
                        El contenido de esta página web tiene exclusivamente fines informativos y no constituye de ninguna manera una oferta al público, o
                        una invitación a ofrecer, de servicios o productos financieros dentro de la República del Perú. Asimismo, en ninguna circunstancia
                        debe entenderse que la información contenida en este sitio es una recomendación de inversión.
                    </p>
                    <p class="web_text web_white">
                        Si bien nuestra empresa busca asegurar que la información contenida en esta página web sea precisa y esté actualizada, no
                        garantizamos la idoneidad, exactitud, oportunidad o integridad de ésta y no aceptamos ninguna responsabilidad derivada de
                        cualquier inexactitud u omisión en el uso o dependencia de la información brindada en esta página web. Asimismo, nos reservamos
                        el derecho de modificar o cambiar la información proporcionada en este sitio en cualquier momento y sin previo aviso. Debido a lo
                        anterior, le aconsejamos que confirme la exactitud de cualquier información contenida en esta página web directamente con
                        nosotros.
                    </p>
                    <p class="web_text web_white">
                        Nuestra compañía le brinda al usuario el derecho limitado de utilizar nuestra página web. Dicho derecho se sujeta al acuerdo de
                        cumplir con los términos y condiciones aquí establecidos en su totalidad, así como cualquier otra regla, procedimiento, política,
                        términos y condiciones que sean aplicables en todo o parte a esta página web.
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

        });
    </script>
</asp:Content>
