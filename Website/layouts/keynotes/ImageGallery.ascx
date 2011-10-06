<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageGallery.ascx.cs"
    Inherits="Keynotes.layouts.keynotes.ImageGallery" %>
<%@ Register TagPrefix="sc" Namespace="Sitecore.Web.UI.WebControls" Assembly="Sitecore.Kernel" %>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/js/image.js"></script>
<div class="container">
    <h1>
        Sitecore Evolution Image Gallery<small>by Tim Ward</small></h1>
</div>
<div id="main" class="container">
    <%--Starter Image   --%>
    <div class="main_image">
        <img src="banner1.jpg" alt="- banner1" />
        <div class="desc">
            <a href="#" class="collapse">Close Me!</a>
            <div class="block">
                <h2>
                    Slowing Down</h2>
                <small>04/10/09</small>
                <p>
                    Autem conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula,
                    ratis, autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et.<br />
                    <a href="http://store.glennz.com/slowingdown.html" target="_blank">Artwork By Glenn
                        Jones</a>
                </p>
            </div>
        </div>
    </div>
    <%--Image List--%>
    <div class="image_thumb">
        <ul>
            <asp:ListView ID="ImageList" runat="server">
                <ItemTemplate>
                    <li><a href="banner1.jpg">
                        <img src="banner1_thumb.jpg" alt="Slowing Dow" /></a>
                        <div class="block">
                            <h2>
                                Slowing Down</h2>
                            <small>04/10/09</small>
                            <p>
                                Autem conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula,
                                ratis, autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et.<br />
                                <a href="http://store.glennz.com/slowingdown.html" target="_blank">Artwork By Glenn
                                    Jones</a>
                            </p>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:ListView>
          <%--  <li><a href="banner1.jpg">
                <img src="banner1_thumb.jpg" alt="Slowing Dow" /></a>
                <div class="block">
                    <h2>
                        Slowing Down</h2>
                    <small>04/10/09</small>
                    <p>
                        Autem conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula,
                        ratis, autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et.<br />
                        <a href="http://store.glennz.com/slowingdown.html" target="_blank">Artwork By Glenn
                            Jones</a>
                    </p>
                </div>
            </li>
            <li><a href="banner2.jpg">
                <img src="banner2_thumb.jpg" alt="Organized Food Fight" /></a>
                <div class="block">
                    <h2>
                        Organized Food Fight</h2>
                    <small>04/11/09</small>
                    <p>
                        Autem conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula,
                        ratis, autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et. Autem
                        conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula, ratis,
                        autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et.</p>
                    <p>
                        Autem conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula,
                        ratis, autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et.<br />
                        <a href="http://store.glennz.com/orfofi.html" target="_blank">Artwork By Glenn Jones</a></p>
                </div>
            </li>
            <li><a href="banner3.jpg">
                <img src="banner3_thumb.jpg" alt="Endangered Species" /></a>
                <div class="block">
                    <h2>
                        Endangered Species</h2>
                    <small>04/12/09</small>
                    <p>
                        Autem conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula,
                        ratis, autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et.<br />
                        <a href="http://store.glennz.com/ensp.html" target="_blank">Artwork By Glenn Jones</a></p>
                </div>
            </li>
            <li><a href="banner4.jpg">
                <img src="banner4_thumb.jpg" alt="Evolution" /></a>
                <div class="block">
                    <h2>
                        Evolution</h2>
                    <small>04/13/09</small>
                    <p>
                        Autem conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula,
                        ratis, autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et. Autem
                        conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula, ratis,
                        autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et.<br />
                        <a href="http://store.glennz.com/evolution.html" target="_blank">Artwork By Glenn Jones</a></p>
                </div>
            </li>
            <li><a href="banner5.jpg">
                <img src="banner5_thumb.jpg" alt="Puzzled Putter" /></a>
                <div class="block">
                    <h2>
                        Puzzled Putter</h2>
                    <small>04/14/09</small>
                    <p>
                        Autem conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula,
                        ratis, autem. Neo nostrud letatio aliquam validus eum quadrum, volutpat et.
                        <br />
                        <a href="http://store.glennz.com/puzzledputter.html" target="_blank">Artwork By Glenn
                            Jones</a></p>
                </div>
            </li>
            <li><a href="banner6.jpg">
                <img src="banner6_thumb.jpg" alt="Secret Habit" /></a>
                <div class="block">
                    <h2>
                        Secret Habit</h2>
                    <small>04/15/09</small>
                    <p>
                        Autem conventio nimis quis ad, nisl secundum sed, facilisi, vicis augue regula,
                        ratis, autem.<br />
                        <a href="http://store.glennz.com/secrethabit1.html" target="_blank">Artwork By Glenn
                            Jones</a></p>
                </div>
            </li>--%>
        </ul>
    </div>
</div>
