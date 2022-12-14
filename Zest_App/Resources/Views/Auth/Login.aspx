<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/Layout/auth.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Zest_App.Resources.Views.Auth.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>

            <div class="top_input" style="margin-top: 15vh">
                <label style="text-align: left;">Ingrese su email</label>
                <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" placeholder="Email"></asp:TextBox>
                <span class="has-error">
                    <asp:Literal ID="ltErrorUs" runat="server"></asp:Literal>
                </span>
            </div>
            <div class="top_input" style="text-align: left;">
                <label style="text-align: left;">Ingrese su celular</label>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <asp:DropDownList ID="ddlCode" CssClass="input-group-text" runat="server" style="width:80px">
                            <asp:ListItem Value="+93">Afghanistan (+93)</asp:ListItem>
                            <asp:ListItem Value="+355">Albania (+355)</asp:ListItem>
                            <asp:ListItem Value="+213">Algeria (+213)</asp:ListItem>
                            <asp:ListItem Value="+684">American Samoa (+684)</asp:ListItem>
                            <asp:ListItem Value="+376">Andorra (+376)</asp:ListItem>
                            <asp:ListItem Value="+244">Angola (+244)</asp:ListItem>
                            <asp:ListItem Value="+264">Anguilla (+264)</asp:ListItem>
                            <asp:ListItem Value="+672">Antarctica (Casey) (+672)</asp:ListItem>
                            <asp:ListItem Value="+672">Antarctica (Scott) (+672)</asp:ListItem>
                            <asp:ListItem Value="+268">Antigua (+268)</asp:ListItem>
                            <asp:ListItem Value="+54">Argentina (+54)</asp:ListItem>
                            <asp:ListItem Value="+374">Armenia (+374)</asp:ListItem>
                            <asp:ListItem Value="+297">Aruba (+297)</asp:ListItem>
                            <asp:ListItem Value="+247">Ascension Islands (+247)</asp:ListItem>
                            <asp:ListItem Value="+0">Atlantic Ocean (+0)</asp:ListItem>
                            <asp:ListItem Value="+61">Australia (+61)</asp:ListItem>
                            <asp:ListItem Value="+0">Australia Territory (+0)</asp:ListItem>
                            <asp:ListItem Value="+43">Austria (+43)</asp:ListItem>
                            <asp:ListItem Value="+994">Azerbaijan (+994)</asp:ListItem>
                            <asp:ListItem Value="+242">Bahamas (+242)</asp:ListItem>
                            <asp:ListItem Value="+973">Bahrain (+973)</asp:ListItem>
                            <asp:ListItem Value="+880">Bangladesh (+880)</asp:ListItem>
                            <asp:ListItem Value="+246">Barbados (+246)</asp:ListItem>
                            <asp:ListItem Value="+268">Barbuda (+268)</asp:ListItem>
                            <asp:ListItem Value="+375">Belarus (+375)</asp:ListItem>
                            <asp:ListItem Value="+32">Belgium (+32)</asp:ListItem>
                            <asp:ListItem Value="+501">Belize (+501)</asp:ListItem>
                            <asp:ListItem Value="+229">Benin (+229)</asp:ListItem>
                            <asp:ListItem Value="+441">Bermuda (+441)</asp:ListItem>
                            <asp:ListItem Value="+975">Bhutan (+975)</asp:ListItem>
                            <asp:ListItem Value="+591">Bolivia (+591)</asp:ListItem>
                            <asp:ListItem Value="+387">Bosnia Herzegovina (+387)</asp:ListItem>
                            <asp:ListItem Value="+267">Botswana (+267)</asp:ListItem>
                            <asp:ListItem Value="+55">Brazil (+55)</asp:ListItem>
                            <asp:ListItem Value="+284">British Virgin Islands (+284)</asp:ListItem>
                            <asp:ListItem Value="+673">Brunei (+673)</asp:ListItem>
                            <asp:ListItem Value="+359">Bulgaria (+359)</asp:ListItem>
                            <asp:ListItem Value="+226">Burkina Faso (+226)</asp:ListItem>
                            <asp:ListItem Value="+257">Burundi (+257)</asp:ListItem>
                            <asp:ListItem Value="+855">Cambodia (+855)</asp:ListItem>
                            <asp:ListItem Value="+237">Cameroon (+237)</asp:ListItem>
                            <asp:ListItem Value="+1">Canada (+1)</asp:ListItem>
                            <asp:ListItem Value="+238">Cape Verde Island (+238)</asp:ListItem>
                            <asp:ListItem Value="+345">Cayman Island (+345)</asp:ListItem>
                            <asp:ListItem Value="+236">Central Africa Republic (+236)</asp:ListItem>
                            <asp:ListItem Value="+235">Chad Republic (+235)</asp:ListItem>
                            <asp:ListItem Value="+56">Chile (+56)</asp:ListItem>
                            <asp:ListItem Value="+86">China (+86)</asp:ListItem>
                            <asp:ListItem Value="+61">Christmas/Cocos (+61)</asp:ListItem>
                            <asp:ListItem Value="+57">Colombia (+57)</asp:ListItem>
                            <asp:ListItem Value="+269">Comoros (+269)</asp:ListItem>
                            <asp:ListItem Value="+242">Congo (+242)</asp:ListItem>
                            <asp:ListItem Value="+682">Cook Island (+682)</asp:ListItem>
                            <asp:ListItem Value="+506">Costa Rica (+506)</asp:ListItem>
                            <asp:ListItem Value="+385">Croatia (+385)</asp:ListItem>
                            <asp:ListItem Value="+53">Cuba (+53)</asp:ListItem>
                            <asp:ListItem Value="+599">Curacao (+599)</asp:ListItem>
                            <asp:ListItem Value="+357">Cyprus (+357)</asp:ListItem>
                            <asp:ListItem Value="+420">Czech Republic (+420)</asp:ListItem>
                            <asp:ListItem Value="+243">Dem. Rep. of Congo (+243)</asp:ListItem>
                            <asp:ListItem Value="+45">Denmark (+45)</asp:ListItem>
                            <asp:ListItem Value="+246">Diego Garcia (+246)</asp:ListItem>
                            <asp:ListItem Value="+253">Djibouti (+253)</asp:ListItem>
                            <asp:ListItem Value="+767">Dominica (+767)</asp:ListItem>
                            <asp:ListItem Value="+809">Dominican Republic (+809)</asp:ListItem>
                            <asp:ListItem Value="+670">East Timor (+670)</asp:ListItem>
                            <asp:ListItem Value="+56">Easter Island (+56)</asp:ListItem>
                            <asp:ListItem Value="+593">Ecuador (+593)</asp:ListItem>
                            <asp:ListItem Value="+20">Egypt (+20)</asp:ListItem>
                            <asp:ListItem Value="+503">El Salvador (+503)</asp:ListItem>
                            <asp:ListItem Value="+240">Equatorial Guinea (+240)</asp:ListItem>
                            <asp:ListItem Value="+291">Eritrea (+291)</asp:ListItem>
                            <asp:ListItem Value="+372">Estonia (+372)</asp:ListItem>
                            <asp:ListItem Value="+251">Ethiopia (+251)</asp:ListItem>
                            <asp:ListItem Value="+298">Faeroe Islands (+298)</asp:ListItem>
                            <asp:ListItem Value="+679">Fiji Islands (+679)</asp:ListItem>
                            <asp:ListItem Value="+358">Finland (+358)</asp:ListItem>
                            <asp:ListItem Value="+33">France (+33)</asp:ListItem>
                            <asp:ListItem Value="+596">French Antilles (+596)</asp:ListItem>
                            <asp:ListItem Value="+594">French Guiana (+594)</asp:ListItem>
                            <asp:ListItem Value="+689">French Polynesia (+689)</asp:ListItem>
                            <asp:ListItem Value="+241">Gabon (+241)</asp:ListItem>
                            <asp:ListItem Value="+220">Gambia (+220)</asp:ListItem>
                            <asp:ListItem Value="+995">Georgia (+995)</asp:ListItem>
                            <asp:ListItem Value="+49">Germany (+49)</asp:ListItem>
                            <asp:ListItem Value="+233">Ghana (+233)</asp:ListItem>
                            <asp:ListItem Value="+350">Gibraltar (+350)</asp:ListItem>
                            <asp:ListItem Value="+881">Global Mobile Satellite System (GMSS) (+881)</asp:ListItem>
                            <asp:ListItem Value="+30">Greece (+30)</asp:ListItem>
                            <asp:ListItem Value="+299">Greenland (+299)</asp:ListItem>
                            <asp:ListItem Value="+473">Grenada (+473)</asp:ListItem>
                            <asp:ListItem Value="+590">Guadeloupe (+590)</asp:ListItem>
                            <asp:ListItem Value="+671">Guam (+671)</asp:ListItem>
                            <asp:ListItem Value="+502">Guatemala (+502)</asp:ListItem>
                            <asp:ListItem Value="+224">Guinea (+224)</asp:ListItem>
                            <asp:ListItem Value="+592">Guyana (+592)</asp:ListItem>
                            <asp:ListItem Value="+509">Haiti (+509)</asp:ListItem>
                            <asp:ListItem Value="+504">Honduras (+504)</asp:ListItem>
                            <asp:ListItem Value="+852">Hong Kong (+852)</asp:ListItem>
                            <asp:ListItem Value="+36">Hungary (+36)</asp:ListItem>
                            <asp:ListItem Value="+354">Iceland (+354)</asp:ListItem>
                            <asp:ListItem Value="+91">India (+91)</asp:ListItem>
                            <asp:ListItem Value="+0">Indian Ocean (+0)</asp:ListItem>
                            <asp:ListItem Value="+62">Indonesia (+62)</asp:ListItem>
                            <asp:ListItem Value="+871">Inmarsat (Atlantic Ocean - East) (+871)</asp:ListItem>
                            <asp:ListItem Value="+874">Inmarsat (Atlantic Ocean - West) (+874)</asp:ListItem>
                            <asp:ListItem Value="+873">Inmarsat (Indian Ocean) (+873)</asp:ListItem>
                            <asp:ListItem Value="+872">Inmarsat (Pacific Ocean) (+872)</asp:ListItem>
                            <asp:ListItem Value="+870">Inmarsat SNAC (+870)</asp:ListItem>
                            <asp:ListItem Value="+98">Iran (+98)</asp:ListItem>
                            <asp:ListItem Value="+964">Iraq (+964)</asp:ListItem>
                            <asp:ListItem Value="+353">Ireland (+353)</asp:ListItem>
                            <asp:ListItem Value="+8817">Iridium (Mobile Satellite service) (+8817)</asp:ListItem>
                            <asp:ListItem Value="+972">Israel (+972)</asp:ListItem>
                            <asp:ListItem Value="+39">Italy (+39)</asp:ListItem>
                            <asp:ListItem Value="+225">Ivory Coast (+225)</asp:ListItem>
                            <asp:ListItem Value="+876">Jamaica (+876)</asp:ListItem>
                            <asp:ListItem Value="+81">Japan (+81)</asp:ListItem>
                            <asp:ListItem Value="+962">Jordan (+962)</asp:ListItem>
                            <asp:ListItem Value="+7">Kazakhstan (+7)</asp:ListItem>
                            <asp:ListItem Value="+254">Kenya (+254)</asp:ListItem>
                            <asp:ListItem Value="+686">Kiribati (+686)</asp:ListItem>
                            <asp:ListItem Value="+7">Kirighzia (+7)</asp:ListItem>
                            <asp:ListItem Value="+965">Kuwait (+965)</asp:ListItem>
                            <asp:ListItem Value="+996">Kyrgyz Republic (+996)</asp:ListItem>
                            <asp:ListItem Value="+7">Kyrgyzstan (+7)</asp:ListItem>
                            <asp:ListItem Value="+856">Laos (+856)</asp:ListItem>
                            <asp:ListItem Value="+371">Latvia (+371)</asp:ListItem>
                            <asp:ListItem Value="+961">Lebanon (+961)</asp:ListItem>
                            <asp:ListItem Value="+266">Lesotho (+266)</asp:ListItem>
                            <asp:ListItem Value="+231">Liberia (+231)</asp:ListItem>
                            <asp:ListItem Value="+218">Libya (+218)</asp:ListItem>
                            <asp:ListItem Value="+423">Liechtenstein (+423)</asp:ListItem>
                            <asp:ListItem Value="+370">Lithuania (+370)</asp:ListItem>
                            <asp:ListItem Value="+352">Luxembourg (+352)</asp:ListItem>
                            <asp:ListItem Value="+853">Macao (+853)</asp:ListItem>
                            <asp:ListItem Value="+389">Macedonia (+389)</asp:ListItem>
                            <asp:ListItem Value="+261">Madagascar (+261)</asp:ListItem>
                            <asp:ListItem Value="+265">Malawi (+265)</asp:ListItem>
                            <asp:ListItem Value="+60">Malaysia (+60)</asp:ListItem>
                            <asp:ListItem Value="+960">Maldives (+960)</asp:ListItem>
                            <asp:ListItem Value="+223">Mali Republic (+223)</asp:ListItem>
                            <asp:ListItem Value="+356">Malta (+356)</asp:ListItem>
                            <asp:ListItem Value="+692">Marshall Islands (+692)</asp:ListItem>
                            <asp:ListItem Value="+596">Martinique (+596)</asp:ListItem>
                            <asp:ListItem Value="+222">Mauritania (+222)</asp:ListItem>
                            <asp:ListItem Value="+230">Mauritius (+230)</asp:ListItem>
                            <asp:ListItem Value="+269">Mayotte Island (+269)</asp:ListItem>
                            <asp:ListItem Value="+521">Mexico Band 1 (+521)</asp:ListItem>
                            <asp:ListItem Value="+522">Mexico Band 2 (+522)</asp:ListItem>
                            <asp:ListItem Value="+523">Mexico Band 3 (+523)</asp:ListItem>
                            <asp:ListItem Value="+524">Mexico Band 4 (+524)</asp:ListItem>
                            <asp:ListItem Value="+525">Mexico Band 5 (+525)</asp:ListItem>
                            <asp:ListItem Value="+526">Mexico Band 6 (+526)</asp:ListItem>
                            <asp:ListItem Value="+527">Mexico Band 7 (+527)</asp:ListItem>
                            <asp:ListItem Value="+528">Mexico Band 8 (+528)</asp:ListItem>
                            <asp:ListItem Value="+691">Micronesia (+691)</asp:ListItem>
                            <asp:ListItem Value="+808">Midway Island (+808)</asp:ListItem>
                            <asp:ListItem Value="+373">Moldova (+373)</asp:ListItem>
                            <asp:ListItem Value="+377">Monaco (+377)</asp:ListItem>
                            <asp:ListItem Value="+976">Mongolia (+976)</asp:ListItem>
                            <asp:ListItem Value="+664">Montserrat (+664)</asp:ListItem>
                            <asp:ListItem Value="+212">Morocco (+212)</asp:ListItem>
                            <asp:ListItem Value="+258">Mozambique (+258)</asp:ListItem>
                            <asp:ListItem Value="+95">Myanmar (Burma) (+95)</asp:ListItem>
                            <asp:ListItem Value="+264">Namibia (+264)</asp:ListItem>
                            <asp:ListItem Value="+674">Nauru (+674)</asp:ListItem>
                            <asp:ListItem Value="+977">Nepal (+977)</asp:ListItem>
                            <asp:ListItem Value="+31">Netherlands (+31)</asp:ListItem>
                            <asp:ListItem Value="+599">Netherlands Antilles (+599)</asp:ListItem>
                            <asp:ListItem Value="+869">Nevis Island (+869)</asp:ListItem>
                            <asp:ListItem Value="+687">New Caledonia (+687)</asp:ListItem>
                            <asp:ListItem Value="+64">New Zealand (+64)</asp:ListItem>
                            <asp:ListItem Value="+505">Nicaragua (+505)</asp:ListItem>
                            <asp:ListItem Value="+227">Niger (+227)</asp:ListItem>
                            <asp:ListItem Value="+234">Nigeria (+234)</asp:ListItem>
                            <asp:ListItem Value="+683">Niue Island (+683)</asp:ListItem>
                            <asp:ListItem Value="+672">Norfolk Island (+672)</asp:ListItem>
                            <asp:ListItem Value="+850">North Korea (+850)</asp:ListItem>
                            <asp:ListItem Value="+670">Northern Marianas Islands (Saipan, Rota, & Tinian) (+670)</asp:ListItem>
                            <asp:ListItem Value="+47">Norway (+47)</asp:ListItem>
                            <asp:ListItem Value="+968">Oman (+968)</asp:ListItem>
                            <asp:ListItem Value="+92">Pakistan (+92)</asp:ListItem>
                            <asp:ListItem Value="+680">Palau (+680)</asp:ListItem>
                            <asp:ListItem Value="+970">Palestine (+970)</asp:ListItem>
                            <asp:ListItem Value="+809">Palm Island (+809)</asp:ListItem>
                            <asp:ListItem Value="+507">Panama (+507)</asp:ListItem>
                            <asp:ListItem Value="+675">Papau New Guinea (+675)</asp:ListItem>
                            <asp:ListItem Value="+595">Paraguay (+595)</asp:ListItem>
                            <asp:ListItem Value="+51" Selected="True">Peru (+51)</asp:ListItem>
                            <asp:ListItem Value="+63">Philippines (+63)</asp:ListItem>
                            <asp:ListItem Value="+48">Poland (+48)</asp:ListItem>
                            <asp:ListItem Value="+351">Portugal (+351)</asp:ListItem>
                            <asp:ListItem Value="+239">Principe (+239)</asp:ListItem>
                            <asp:ListItem Value="+974">Qatar (+974)</asp:ListItem>
                            <asp:ListItem Value="+262">Reunion Island (+262)</asp:ListItem>
                            <asp:ListItem Value="+40">Romania (+40)</asp:ListItem>
                            <asp:ListItem Value="+7">Russia (+7)</asp:ListItem>
                            <asp:ListItem Value="+250">Rwanda (+250)</asp:ListItem>
                            <asp:ListItem Value="+7">Sakhalin (+7)</asp:ListItem>
                            <asp:ListItem Value="+378">San Marino (+378)</asp:ListItem>
                            <asp:ListItem Value="+239">Sao Tome (+239)</asp:ListItem>
                            <asp:ListItem Value="+966">Saudi Arabia (+966)</asp:ListItem>
                            <asp:ListItem Value="+221">Senegal Republic (+221)</asp:ListItem>
                            <asp:ListItem Value="+381">Serbia (+381)</asp:ListItem>
                            <asp:ListItem Value="+248">Seychelles (+248)</asp:ListItem>
                            <asp:ListItem Value="+232">Sierra Leone (+232)</asp:ListItem>
                            <asp:ListItem Value="+65">Singapore (+65)</asp:ListItem>
                            <asp:ListItem Value="+421">Slovakia (+421)</asp:ListItem>
                            <asp:ListItem Value="+386">Slovenia (+386)</asp:ListItem>
                            <asp:ListItem Value="+677">Solomon Islands (+677)</asp:ListItem>
                            <asp:ListItem Value="+252">Somalia (+252)</asp:ListItem>
                            <asp:ListItem Value="+27">South Africa (+27)</asp:ListItem>
                            <asp:ListItem Value="+82">South Korea (+82)</asp:ListItem>
                            <asp:ListItem Value="+34">Spain (+34)</asp:ListItem>
                            <asp:ListItem Value="+94">Sri Lanka (+94)</asp:ListItem>
                            <asp:ListItem Value="+290">St. Helena (+290)</asp:ListItem>
                            <asp:ListItem Value="+869">St. Kitts (+869)</asp:ListItem>
                            <asp:ListItem Value="+758">St. Lucia (+758)</asp:ListItem>
                            <asp:ListItem Value="+508">St. Pierre & Miquelon (+508)</asp:ListItem>
                            <asp:ListItem Value="+784">St. Vincent & Grenadines (+784)</asp:ListItem>
                            <asp:ListItem Value="+249">Sudan (+249)</asp:ListItem>
                            <asp:ListItem Value="+597">Suriname (+597)</asp:ListItem>
                            <asp:ListItem Value="+268">Swaziland (+268)</asp:ListItem>
                            <asp:ListItem Value="+46">Sweden (+46)</asp:ListItem>
                            <asp:ListItem Value="+41">Switzerland (+41)</asp:ListItem>
                            <asp:ListItem Value="+963">Syria (+963)</asp:ListItem>
                            <asp:ListItem Value="+886">Taiwan (+886)</asp:ListItem>
                            <asp:ListItem Value="+992">Tajikistan (+992)</asp:ListItem>
                            <asp:ListItem Value="+255">Tanzania (+255)</asp:ListItem>
                            <asp:ListItem Value="+66">Thailand (+66)</asp:ListItem>
                            <asp:ListItem Value="+228">Togo (+228)</asp:ListItem>
                            <asp:ListItem Value="+690">Tokelau (+690)</asp:ListItem>
                            <asp:ListItem Value="+676">Tonga (+676)</asp:ListItem>
                            <asp:ListItem Value="+868">Trinidad/Tobago (+868)</asp:ListItem>
                            <asp:ListItem Value="+216">Tunisia (+216)</asp:ListItem>
                            <asp:ListItem Value="+90">Turkey (+90)</asp:ListItem>
                            <asp:ListItem Value="+993">Turkmenistan (+993)</asp:ListItem>
                            <asp:ListItem Value="+649">Turks/Caicos (+649)</asp:ListItem>
                            <asp:ListItem Value="+688">Tuvalu Islands (+688)</asp:ListItem>
                            <asp:ListItem Value="+256">Uganda (+256)</asp:ListItem>
                            <asp:ListItem Value="+380">Ukraine (+380)</asp:ListItem>
                            <asp:ListItem Value="+971">United Arab Emirates (+971)</asp:ListItem>
                            <asp:ListItem Value="+44">United Kingdom (+44)</asp:ListItem>
                            <asp:ListItem Value="+878">Universal Personal Telecommunications (UPT) (+878)</asp:ListItem>
                            <asp:ListItem Value="+598">Uruguay (+598)</asp:ListItem>
                            <asp:ListItem Value="+340">US Virgin Islands (+340)</asp:ListItem>
                            <asp:ListItem Value="+1">USA (+1)</asp:ListItem>
                            <asp:ListItem Value="+998">Uzbekistan (+998)</asp:ListItem>
                            <asp:ListItem Value="+678">Vanuatu (+678)</asp:ListItem>
                            <asp:ListItem Value="+39">Vatican City (+39)</asp:ListItem>
                            <asp:ListItem Value="+58">Venezuela (+58)</asp:ListItem>
                            <asp:ListItem Value="+84">Vietnam (+84)</asp:ListItem>
                            <asp:ListItem Value="+808">Wake Island (+808)</asp:ListItem>
                            <asp:ListItem Value="+685">West Samoa (+685)</asp:ListItem>
                            <asp:ListItem Value="+967">Yemen Arab Rep. (+967)</asp:ListItem>
                            <asp:ListItem Value="+381">Yugoslavia (+381)</asp:ListItem>
                            <asp:ListItem Value="+260">Zambia (+260)</asp:ListItem>
                            <asp:ListItem Value="+255">Zanzibar (+255)</asp:ListItem>
                            <asp:ListItem Value="+263">Zimbabwe (+263)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" placeholder="999999999" TextMode="Phone"></asp:TextBox>
                </div>

                <span class="has-error">
                    <asp:Literal ID="ltErrorPass" runat="server"></asp:Literal>
                </span>
            </div>
            <div class="pad_submit" style="margin-bottom: 20px;">
                <asp:Button ID="btn_send" runat="server" Text="Continuar" Style="width: 120px" CssClass="next text-center" OnClick="btn_send_Click" />
            </div>
            <div class="pad_submit">
                <a class="prev text-center" href="Home.aspx" runat="server" style="width: 120px">Atrás</a>
            </div>
            <div class="top_logo" style="margin-top: 10vh">
                <asp:Image ID="img_logo" Style="width: 150px" ImageUrl="~/Assets/img/logos/logo a pedido.svg" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
