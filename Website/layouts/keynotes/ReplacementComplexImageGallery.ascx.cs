using System.Collections.Generic;
using System.Collections.Specialized;
using Keynotes.Code;
using System;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;

namespace Keynotes.layouts.keynotes
{
    public partial class ReplacementComplexImageGallery : ControlExtension
    {
        private void Page_Load(object sender, EventArgs e)
        {

            //Detect WebDav Support in PageEditor
            if (Request.Browser.Browser.Contains("IE"))
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
            GetMaxItems = parameters["Max Items"];
            GetSlideDelay = parameters["Slide Delay"];
            GetDetailsSlideDelay = parameters["Detail Slide Duration"];
            GetTransitionType = parameters["Transition Type"];

            var GetDataSource = Sitecore.Context.Database.GetItem(DataSource);
            MultilistField imageList = GetDataSource.Fields["Image List"];
            MultilistField videoList = GetDataSource.Fields["Video List"];

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

        protected void FileDrop_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            String s = "";
        }
    }
}