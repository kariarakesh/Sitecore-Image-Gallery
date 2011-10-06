using System.Collections.Specialized;
using System.Globalization;
using System.Linq;
using System.Text;
using Sitecore.Analytics.Data.DataAccess;
using Sitecore.Analytics.Data.DataAccess.DataSets;
using Sitecore.Analytics.Data.Items;

namespace Keynotes.layouts.keynotes
{
    using System;
    using Sitecore.Analytics;

    public partial class ScoreBuilder : System.Web.UI.UserControl
    {
        private void Page_Load(object sender, EventArgs e)
        {
            // Put user code to initialize the page here
            ScoreList.DataSource =
                Sitecore.Context.Database.GetItem("/sitecore/content/Repository/Profile Gathering Pages").Children;
            ScoreList.DataBind();

            TrackerDataContext tc = Sitecore.Analytics.Tracker.DataContext;
            StringBuilder sb = new StringBuilder();

            if (Tracker.CurrentVisit == null)
                return;
            if (Tracker.CurrentVisit.Keywords != null
                && !String.IsNullOrEmpty(Tracker.CurrentVisit.Keywords.Text))
            {
                sb.Append("Search keywords for current visit: " +
                    Tracker.CurrentVisit.Keywords.Text + ".<br/>");

            }
            const int checkVisits = 10;
            Sitecore.Analytics.Data.DataAccess.VisitorLoadOptions vOptions =
                            new Sitecore.Analytics.Data.DataAccess.VisitorLoadOptions
                        {
                            Start = Tracker.CurrentVisit.VisitorVisitIndex - 1,
                            Count = Tracker.CurrentVisit.VisitorVisitIndex - checkVisits,
                            VisitLoadOptions = VisitLoadOptions.Visits
                        };
            foreach (VisitorDataSet.VisitsRow visit in
                            Tracker.Visitor.GetVisits(vOptions).Where(
            visit => visit.VisitId !=
                               Tracker.CurrentVisit.VisitId).OrderByDescending(
                            visit => visit.VisitorVisitIndex))
            {
                if (visit.Keywords != null &&
                  !String.IsNullOrEmpty(visit.Keywords.Text))
                {
                    sb.Append("Last search keywords from " +
                        visit.StartDateTime + " visit: " +
                        visit.Keywords.Text + "<br/>");
                    return;
                }
            }
            sb.Append("No search keywords for current or last " +
                            checkVisits + " visits.<br/>");


            DMS.Text = sb.ToString();
            var profilesRows = tc.Profiles;
            ProfileScores.DataSource = GetProfileKeys("Keynotes");
            ProfileScores.DataBind();
        }


        //private NameValueCollection GetPoints()
        //{

        //    var result = new NameValueCollection();

        //    if (Tracker.CurrentVisit. != null)
        //    {
        //        var selected = from profile in Tracker.Visitor.DataSet.Profiles
        //                       where profile.ProfileName.Equals(profileName, StringComparison.OrdinalIgnoreCase)
        //                       select profile;

        //        var groupedproffiles = selected.GroupBy(x => x.ProfileName);

        //        foreach (var groupedproffile in groupedproffiles)
        //        {
        //            var profileItem = new ProfileItem(Sitecore.Context.Database.GetItem("/sitecore/system/Marketing Center/Profiles/" + groupedproffile.Key));
        //            foreach (var key in profileItem.Keys)
        //            {
        //                var globalValue = groupedproffile.Sum(x => x.Values[key.KeyName]);
        //                var currentValue = Tracker.CurrentVisit.Profiles.Where(x => x.ProfileName.Equals(groupedproffile.Key)).FirstOrDefault().Values[key.KeyName];

        //                string gloabalSessionValue = true ? string.Format("({0})", globalValue) : string.Empty;
        //                result.Add(key.KeyName, string.Format(CultureInfo.CurrentCulture, "{0} {1}", currentValue, gloabalSessionValue));
        //            }
        //        }
        //    }

        //    return result;
        //}

        private NameValueCollection GetProfileKeys(string profileName)
        {
            var result = new NameValueCollection();

            if (Tracker.CurrentVisit.Profiles != null)
            {
                var selected = from profile in Tracker.Visitor.DataSet.Profiles
                               where profile.ProfileName.Equals(profileName, StringComparison.OrdinalIgnoreCase)
                               select profile;

                var groupedproffiles = selected.GroupBy(x => x.ProfileName);

                foreach (var groupedproffile in groupedproffiles)
                {
                    var profileItem = new ProfileItem(Sitecore.Context.Database.GetItem("/sitecore/system/Marketing Center/Profiles/" + groupedproffile.Key));
                    foreach (var key in profileItem.Keys)
                    {
                        var globalValue = groupedproffile.Sum(x => x.Values[key.KeyName]);
                        var currentValue = Tracker.CurrentVisit.Profiles.Where(x => x.ProfileName.Equals(groupedproffile.Key)).FirstOrDefault().Values[key.KeyName];

                        string gloabalSessionValue = true ? string.Format("({0})", globalValue) : string.Empty;
                        result.Add(key.KeyName, string.Format(CultureInfo.CurrentCulture, "{0} {1}", currentValue, gloabalSessionValue));
                    }
                }
            }

            return result;
        }
    }
}