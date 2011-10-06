using Keynotes.Code;

namespace Keynotes.layouts.keynotes
{
    using System;

    public partial class ImageGallery : ControlExtension
    {
        private void Page_Load(object sender, EventArgs e)
        {
            // Put user code to initialize the page here
            //Sitecore.Data.Fields.FileDropAreaField fd = Sitecore.Context.Item.Fields["Droparea"];
            //Repeater1.DataSource = fd.GetMediaItems();
            //Repeater1.DataBind();
            
   
            //6.0
            //Binding for Inline Editing - Done
            //Detect Page Mode - Done | Tip : For all controls try to at least detect Debug Mode to output developer debug information
            //FieldRenderer - Done | Tip: FieldRenderer can take parametets whereas sc:Image ignores Width and Height
            //Cache - Done | Tip : Leave cache to the end and considering that we will have different variants of the datasource for the image gallery, cache with VaryByData
            //Add Languages | Maybe Auto Translate?
            //Alias - Marketing

            //6.1
            //Bind Edit Frame Done | Tip : Make sure you don't stay in the "core" database when testing the Edit Frame or you will receive an error, also always close and reopen the page editor for the item that contains the edit frame.
            //Change to Datasource for Personalisation - No need to do this anymore | Tip : The more rules you hav, the more time it will take to load the page and run all the rules.
            //Fire off a goal or page event NOT DONE | Tip: This can either be done programmatically or via the ?sc_trk=<goal name> in the URL or request
            //Hook up client side hook to firing off analytics - DONE
            //Insert Option Rules - DONE | Tip: Very powerful, and see if you can use rules before options
            //Content Editor Warning Rules - DONE | Tip : Don't make these too complex as they will fire on every item selection


            //6.2
            //Place the images that are uploaded through Workflow and Attach to RSS Feed
            //Drop a File Drop Area onto the Page Editor to make it easy to upload images | Done
            //Start editing the entire control through Sitecore Rocks
            //HTML 5 gaining popularity more and more.

            //6.3
            //Change the CSS for the ImageGallery and publish to the delivery instance
            //Hook into multiple events | Show Event in item:added
            //Publish to different authoring servers.
            //Placeholder Settings - DONE | Mention that these get better in 6.4

            //6.4
            //Introduce new Page Editor - DONE
            //Set Datasource Popup - DONE | This will be shown first
            //Set Properties Popup - DONE
            //Set Thumbnail - DONE
            //Show new way of dropping components on the screen (Components | Click on Placeholder | Advanced Details) - DONE
            //Set design restrictions (Change) | Tip : If you add a replacement component that is not in the Placeholder Settings list, then the option will not show.
            //Use Item Cloning | No more duplication, just references items that can be tracked by the master
            //Change Code above to use .net 4.0 features i.e. Parallel, EnableViewState = false | DONE
            //Add a web edit command to change datasource fields. - DONE
            //Rendering Parameter Templates - Talk about how Setting Items are taken care of in 7.0 - DONE |  Customize Page is deprecated and the parameter templates is now what you should use.
            //Inline Placeholder Settings - DONE
            //Layout Deltas - DONE | Just add something to the standard values to see that the item itself gets updated as well. | Also go into the page editor and show that it is restrciting you deleting it as it is in the standard values.
            //Layout Presets
            
            //6.5 
            //Use inline personalisation
            //Use MV Test on text or image or video
            //Setup an Engagement Plan
            //Add Geographical Lookups for targeting content

            //7.0 Talk about new features in 7.0
            //My Publish will be trasactional and I will be able to cancel (Show Module)
            //Mention that my folder named "Repository" will actually be able to utilise a new feature combination of

            //Embedded Items (Technically, embedded items are normal content items, which are linked with “embedded” relation to their container item.) and a Silo (A Silo is a location in a content tree which executes a query in the data store returns results as child items in the content tree.)
            //This whole entire thing could have been built in a Unit of Work to as to not release the part of the content tree without everything being ready
            //I can now use Embedded Items for the Gallery Settings

            //7.5 Show Social Integration
            //Get Social Feedback on Content and Components
            //Add #Tags to content to be tracked externally
            //Show the Pivot Viewer with Twitter and Facebook.

            //Export as a component that everyone can download and use

        }


        private string _autoScroll;
        public string AutoScroll { get; set; }
    }
}