using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using Sitecore.Data.Items;
using Sitecore.Data.Query;
using Sitecore.Web;
using Sitecore.Web.UI.WebControls;

namespace Keynotes.Code
{
    public class ControlExtension : System.Web.UI.UserControl
    {
        private NameValueCollection _properties;
        protected string DataSource { get; set; }

        private Item _item;
        public Item Item
        {
            get
            {
                if (_item == null)
                {
                    if (!string.IsNullOrEmpty(DataSource))
                    {
                        _item = Sitecore.Context.Database.GetItem(DataSource) ?? Sitecore.Context.Item;
                    }
                    else
                    {
                        _item = Sitecore.Context.Item;
                    }
                }
                return _item;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            var sublayout = (Sublayout)Parent;
            if (sublayout != null)
            {
                DataSource = sublayout.DataSource;

                var parameters = Attributes["sc_parameters"];
                if (string.IsNullOrEmpty(parameters))
                {
                    parameters = sublayout.Parameters;
                }
                _properties = WebUtil.ParseUrlParameters(parameters);
            }
        }

        protected string GetProperty(string property)
        {
            return _properties[property];
        }
    }
}