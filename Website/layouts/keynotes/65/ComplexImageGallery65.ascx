<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ComplexImageGallery65.ascx.cs"
    Inherits="Keynotes.layouts.keynotes.ComplexImageGallery" EnableViewState="false" %>
<%@ Register Assembly="Sitecore.FileDropAreaGridView" Namespace="Sitecore.Web.UI.WebControls"
    TagPrefix="cc2" %>
<%@ Register Assembly="Sitecore.Kernel" Namespace="Sitecore.Shell.Applications.ContentEditor"
    TagPrefix="cc1" %>
<%@ Import Namespace="Sitecore.Data.Fields" %>
<%@ Import Namespace="Sitecore.Data.Items" %>
<%@ Register TagPrefix="sc" Namespace="Sitecore.Web.UI.WebControls" Assembly="Sitecore.Kernel" %>
<%@ Register TagPrefix="fda" Namespace="Sitecore.Web.UI.WebControls" %>
<link rel="stylesheet" type="text/css" media="all" href="/css/complex/reset.css" />
<link rel="stylesheet" type="text/css" media="all" href="/css/complex/clearfix.css" />
<link rel="stylesheet" type="text/css" media="all" href="/css/complex/style.css" />
<link rel="stylesheet" type="text/css" media="all" href="/css/complex/fonts.css" />
<link rel="stylesheet" type="text/css" media="all" href="/css/complex/jquery.dualSlider.0.3.css" />
<script src="/js/complex/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="/js/complex/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="/js/complex/jquery.timers-1.2.js" type="text/javascript"></script>
<script src="/js/complex/jquery.dualSlider.0.3.js" type="text/javascript"></script>
<script type="text/javascript">
    $.noConflict();
</script>
<script type="text/javascript">

//        jQuery(document).ready(function () {
//            jQuery(".carousel").dualSlider({
//                auto: <%= AutoScroll %>,
//                autoDelay: 6000,
//                easingCarousel: "swing",
//                easingDetails: "easeOutBack",
//                durationCarousel: 1000,
//                durationDetails: 500
//            });
//        });
        


        
        jQuery(document).ready(function () {
            jQuery(".carousel").dualSlider({
                auto: <%= AutoScroll %>,
                autoDelay: <%= GetSlideDelay %>,
                easingCarousel: "<%= GetTransitionType %>",
                easingDetails: "easeOutBack",
                durationCarousel: 1000,
                durationDetails: <%= GetDetailsSlideDelay %>
            });
        });


    jQuery(function () {


        jQuery('.previous').bind('click', function () {

//            jQuery.ajax({
//                url: "/Services/Analytics.asmx/RegisterClientGoal",
//                data: "{ 'goalId': '" + '{226A002F-FDAB-45C2-8A1E-5A934B191E50}' + "' }",
//                dataType: "json",
//                type: "POST",
//                contentType: "application/json; charset=utf-8",
//                dataFilter: function () { },
//                success: function () { },
//                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    alert(textStatus);
//                }
//            });
 jQuery.ajax({
 type: "POST",
      url: "/?sc_trk=VideoStop",
      data: "{}",
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(msg) {
        // Replace the div's content with the page method's return.
        $("#Result").text(msg.d);
      }
    });

        });


         jQuery('.more').bind('click', function () {

//            jQuery.ajax({
//                url: "/Services/Analytics.asmx/RegisterClientGoal",
//                data: "{ 'goalId': '" + '{226A002F-FDAB-45C2-8A1E-5A934B191E50}' + "' }",
//                dataType: "json",
//                type: "POST",
//                contentType: "application/json; charset=utf-8",
//                dataFilter: function () { },
//                success: function () { },
//                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    alert(textStatus);
//                }
//            });
 jQuery.ajax({
 type: "POST",
      url: "/?sc_trk=ReadMore",
      data: "{}",
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(msg) {
        // Replace the div's content with the page method's return.
        $("#Result").text(msg.d);
      }
    });

        });



         jQuery('.play').bind('click', function () {

//            jQuery.ajax({
//                url: "/Services/Analytics.asmx/RegisterClientGoal",
//                data: "{ 'goalId': '" + '{226A002F-FDAB-45C2-8A1E-5A934B191E50}' + "' }",
//                dataType: "json",
//                type: "POST",
//                contentType: "application/json; charset=utf-8",
//                dataFilter: function () { },
//                success: function () { },
//                error: function (XMLHttpRequest, textStatus, errorThrown) {
//                    alert(textStatus);
//                }
//            });
 jQuery.ajax({
 type: "POST",
      url: "/?sc_trk=VideoPlay",
      data: "{}",
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(msg) {
        // Replace the div's content with the page method's return.
        $("#Result").text(msg.d);
      }
    });

        });


          jQuery('#video-player').bind('pause', function () {

           alert('found');
              });

        jQuery('#video').bind('ended', function () {

            jQuery.ajax({
                url: "/Analytics.asmx/RegisterClientGoal",
                data: "{ 'length': '" + temp + "' }",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataFilter: function () { },
                success: function () { },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        });

        jQuery('#video').bind('pause', function () {

            jQuery.ajax({
                url: "/Analytics.asmx/RegisterClientGoal",
                data: "{ 'length': '" + temp + "', 'time': '" + jQuery('#video').attr('currentTime') + "' }",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataFilter: function () { },
                success: function () { },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        });

        jQuery('#video').bind('play', function () {
            jQuery.ajax({
                url: "/Analytics.asmx/RegisterClientGoal",
                data: "{ 'length': '" + temp + "' }",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataFilter: function () { },
                success: function () { },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        });
    });
</script>
<div class="wrapper clearfix">
    <sc:EditFrame ID="GalleryFrame" runat="server" Buttons="/sitecore/content/Applications/WebEdit/Edit Frame Buttons/Keynote">
        <div class="carousel clearfix">
            <div class="panel">
                <div class="details_wrapper">
                    <div class="details">
                        <asp:ListView ID="DetailsList" runat="server">
                            <ItemTemplate>
                                <div class="detail">
                                    <h2 class="Lexia-Bold">
                                        <a href="#">Dreamcore Australia</a>
                                        <sc:Text ID="DetailsText" Field="Title" runat="server" Item='<%# ((ReferenceField)((Item)Container.DataItem).Fields["Text"]).TargetItem %>' />
                                        <a href='http://www.twitter.com/<%# ((ReferenceField)((Item)Container.DataItem).Fields["Text"]).TargetItem.Fields["Twitter Hash"].Value %>'>
                                            <sc:Text ID="SocialTags" Field="Twitter Hash" runat="server" Item='<%# ((ReferenceField)((Item)Container.DataItem).Fields["Text"]).TargetItem %>' />
                                        </a>
                                    </h2>
                                    <sc:Link ID="ReadMoreLink" runat="server" Field="Read More Link" class="more" Item='<%# ((ReferenceField)((Item)Container.DataItem).Fields["Text"]).TargetItem %>'>Read More...</sc:Link>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
                <div class="paging">
                    <div id="numbers">
                    </div>
                    <a href="javascript:void(0);" class="previous" title="Previous">Previous</a> <a href="javascript:void(0);"
                        class="next" title="Next">Next</a>
                </div>
                <a href="javascript:void(0);" class="play" title="Turn on autoplay">Play</a> <a href="javascript:void(0);"
                    class="pause" title="Turn off autoplay">Pause</a>
            </div>
            <div class="backgrounds">
                <asp:ListView ID="ImageItems" runat="server">
                    <ItemTemplate>
                        <div class="item item_3">
                            <sc:FieldRenderer ID="ImageItem" Parameters="w=604&amp;h=340" runat="server" FieldName="Image"
                                Item="<%# ((Item)Container.DataItem) %>" />
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:ListView ID="VideoItems" runat="server">
                    <ItemTemplate>
                        <div class="item item_1">
                             <object width="604" height="340">
                                <param name="allowfullscreen" value="true" />
                                <param name="allowscriptaccess" value="always" />
                                <param name="movie" value="<%# ((Item)Container.DataItem).Fields["Url"].Value %>" />
                                <embed src="<%# ((Item)Container.DataItem).Fields["Url"].Value %>" type="application/x-shockwave-flash"
                                    allowfullscreen="true" allowscriptaccess="always" width="604" height="340" wmode="transparent"></embed></object>
                            <%--     http://youtu.be/eBHmcORu4og?t=39s--%>
                            <%-- <video style="background: #000" id="video" preload="" controls="" poster="/images/clickToPlay.gif" width="604" height="340" >
                                <source src="http://youtu.be/eBHmcORu4og?t=39s&html5=1" />
                            </video>--%>
                        <%--    <iframe type="text/html" width="640" height="385" src="http://www.youtube.com/embed/MKPmrwGuEkQ?eurl=http%3A%2F%2Fapiblog.youtube.com%2F2010%2F07%2Fnew-way-to-embed-youtube-videos.html&feature=player_embedded"
                                frameborder="0" class="youtube-player"></iframe>--%>

                               <%--  <iframe class="youtube-player" type="text/html" width="604" height="340" src="http://www.youtube.com/watch?v=_I7wAF1qjCU&amp;feature=related&amp;webm=1"
                                frameborder="0"></iframe>--%>



                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </sc:EditFrame>
</div>
<link href="/css/FileDropAreaGrid.css" rel="stylesheet" />
<style>
    .contentarea
    {
        font-family: Verdana;
        font-size: 0.6em;
        font-size-adjust: none;
        font-style: normal;
        font-variant: normal;
        font-weight: normal;
        line-height: 1.2em;
        border: none 0px;
    }
</style>
<div class="contentarea">
    <cc2:FileDropAreaGridView ID="FileDrop" runat="server" FieldName="File" AutoGenerateColumns="false"
        CssClass="FileDropAreaList" AlternatingRowStyle-CssClass="FileDropAreaListRow"
        RowStyle-CssClass="FileDropAreaListRow" GridLines="None" HeaderStyle-CssClass="FileDropAreaListHeader"
        PagerStyle-CssClass="FileDropAreaListPager" EditControlCssClass="FileDropAreaListEdit"
        AllowPaging="true" Visible="false" PageSize="15" ShowHeader="false" AllowSorting="true"
        Caption="Attachments" Source="/sitecore/content/Repository/Media Upload/GalleryUpload"
        >
        <Columns>
            <cc2:MediaIconField HeaderText="Icon" ItemStyle-HorizontalAlign="Left" SortExpression="Extension"
                ItemStyle-Width="30px" />
            <cc2:MediaNameField HeaderText="Name" SortExpression="Name" />
            <cc2:MediaSizeField HeaderText="Size" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="false"
                SortExpression="Size" ItemStyle-Width="60px" />
            <cc2:MediaBoundField DataField="Statistics.Updated" SortExpression="Statistics.Updated"
                DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" ItemStyle-HorizontalAlign="Right"
                ItemStyle-Width="85px" />
            <cc2:DownloadMediaField ItemStyle-Width="65px" HeaderStyle-CssClass="NonSortable"
                ItemStyle-HorizontalAlign="Right" />
            <cc2:OpenMediaInfoField ItemStyle-Width="50px" HeaderStyle-CssClass="NonSortable"
                ItemStyle-HorizontalAlign="Right" />
        </Columns>
    </cc2:FileDropAreaGridView>
</div>
