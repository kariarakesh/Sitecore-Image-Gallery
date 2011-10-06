using System;
using Sitecore.Configuration;
using Sitecore.Data;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;
using Sitecore.Data.Managers;
using Sitecore.Events;

namespace Keynotes.Events
{
    public class KeynoteEvents
    {
        protected void OnItemAdded(object sender, EventArgs args)
        {
            if (args != null)
            {
                var item = Event.ExtractParameter(args, 0) as Item;
                if (item != null)
                {
                    if (item.TemplateName == "Jpeg")
                    {
                        var uploaded = Factory.GetDatabase("master").GetItem(
                            "/sitecore/content/Repository/Gallery Items/Images/Uploaded");
                        var createdItem = ItemManager.CreateItem(item.Name, uploaded, new ID("{61B027D7-6FB9-468B-8443-89A99274A077}"));
                        createdItem.Editing.BeginEdit();
                        ((ImageField) createdItem.Fields["Image"]).MediaID = item.ID;
                        createdItem.Editing.EndEdit();
                        //Run operation
                    }
                }
            }


        }

    }
}