using System.Collections.Generic;
using System.Collections.Specialized;
using Keynotes.Code;
using System;
using Sitecore.Caching;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;
using Sitecore.Data.Validators;

namespace Keynotes.layouts.keynotes
{
    public partial class ComplexImageGallery62 : ControlExtension
    {
        private void Page_Load(object sender, EventArgs e)
        {

            //Detect WebDav Support in PageEditor
            if (Request.Browser.Browser.Contains("IE") && Sitecore.Context.PageMode.IsPageEditor)
            {
                FileDrop.Visible = true;
            }

            //Page Mode Detection
            AutoScroll = Sitecore.Context.PageMode.IsPageEditor ? "false" : "true";

            //Debug Mode
            if (Sitecore.Context.PageMode.IsDebugging)
            {
                //Put in Debug Information here about marketing information.
                
            }

            //Rendering Parameter Templates
            string rawParameters = Attributes["sc_parameters"];
            NameValueCollection parameters = Sitecore.Web.WebUtil.ParseUrlParameters(rawParameters);
            GetMaxItems = parameters["Max Items"] ?? "5";
            GetSlideDelay = parameters["Slide Delay"] ?? "6000";
            GetDetailsSlideDelay = parameters["Detail Slide Duration"] ?? "1000";
            GetTransitionType = parameters["Transition Type"] ?? "swing";

            var getDataSource = Sitecore.Context.Database.GetItem(DataSource);
            MultilistField imageList = getDataSource.Fields["Image List"];
            MultilistField videoList = getDataSource.Fields["Video List"];
          

            //DetailsList.DataSource =
            ImageItems.DataSource = imageList.GetItems();
            VideoItems.DataSource = videoList.GetItems();

            var combinedItems = new List<Item>(imageList.GetItems());
            combinedItems.AddRange(videoList.GetItems());

            DetailsList.DataSource = combinedItems;
            DetailsList.DataBind();
            ImageItems.DataBind();
            VideoItems.DataBind();



        }


        protected string GetTransitionType
        {
            get;
            set;
        }

   

        protected string GetDetailsSlideDelay
        {
            get;
            set;
        }

        protected string GetSlideDelay
        {
            get;
            set;
        }


        public string AutoScroll { get; set; }

        public string GetMaxItems { get; set; }
       
    }
}