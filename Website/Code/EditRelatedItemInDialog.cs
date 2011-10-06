using Sitecore;
using Sitecore.Data.Items;
using Sitecore.Diagnostics;
using Sitecore.Shell.Applications.WebEdit.Commands;
using Sitecore.Shell.Framework.Commands;
using Sitecore.Text;
using Sitecore.Web.Configuration;
using Sitecore.Web.UI.Sheer;

namespace Keynotes.Code
{
    public class EditRelatedItemInDialog : WebEditCommand
    {
        // Methods
        public override void Execute(CommandContext context)
        {
            Assert.ArgumentNotNull(context, "context");
            UrlString str = new UrlString("/sitecore/shell/Applications/Content Manager/default.aspx");
            str["fo"] = context.Parameters["id"];
            str["mo"] = "preview";
            string features = GetFeatures();
            SheerResponse.Eval(string.Concat(new object[] { "window.open('", str, "', 'SitecoreWebEditEditor', '", features, "')" }));
        }

        private static string GetFeatures()
        {
            string str = "location=0,menubar=0,status=0,toolbar=0,resizable=1";
            DeviceItem device = Context.Device;
            if (device != null)
            {
                SitecoreClientDeviceCapabilities capabilities = device.Capabilities as SitecoreClientDeviceCapabilities;
                if (capabilities == null)
                {
                    return str;
                }
                if (capabilities.RequiresScrollbarsOnWindowOpen)
                {
                    str = str + ",scrollbars=1,dependent=1";
                }
            }
            return str;
        }
    }

}