<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ComplexImageGallery6.ascx.cs"
    Inherits="Keynotes.layouts.keynotes.ComplexImageGallery" EnableViewState="false" %>
<%@ Register Assembly="Sitecore.FileDropAreaGridView" Namespace="Sitecore.Web.UI.WebControls"
    TagPrefix="cc2" %>
<%@ Register Assembly="Sitecore.Kernel" Namespace="Sitecore.Shell.Applications.ContentEditor"
    TagPrefix="cc1" %>
<%@ Import Namespace="Sitecore.Data.Fields" %>
<%@ Import Namespace="Sitecore.Data.Items" %>

<%@ Register TagPrefix="sc" Namespace="Sitecore.Web.UI.WebControls" Assembly="Sitecore.Kernel" %>
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


   
</script>
<div class="wrapper clearfix">
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
                                <sc:Link ID="ReadMoreLink" runat="server" Field="Read More Link" class="more" Item='<%# ((ReferenceField)((Item)Container.DataItem).Fields["Text"]).TargetItem %>'>
                                    Read More...</sc:Link>
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
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</div>
