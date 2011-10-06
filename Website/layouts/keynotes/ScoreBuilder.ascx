<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ScoreBuilder.ascx.cs"
    Inherits="Keynotes.layouts.keynotes.ScoreBuilder" %>
<%@ Import Namespace="Sitecore.Analytics.Data.DataAccess.DataSets" %>
<%@ Import Namespace="Sitecore.Data.Items" %>
<%@ Import Namespace="Sitecore.Links" %>
<%@ Register TagPrefix="sc" Namespace="Sitecore.Web.UI.WebControls" Assembly="Sitecore.Kernel" %>

    <a href='<%= LinkManager.GetItemUrl(Sitecore.Context.Database.GetItem("{110D559F-DEA5-42EA-9C1C-8A5DF7E70EF9}")) %>'>Home</a>

<asp:Repeater ID="ScoreList" runat="server">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li><a href="<%# LinkManager.GetItemUrl(((Item)Container.DataItem)) %>">
            <%# ((Item)Container.DataItem).Name %></a></li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>




<asp:Repeater ID="ProfileScores" runat="server">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li><%# Container.DataItem %> - <%#  ((NameValueCollection)ProfileScores.DataSource)[(string)Container.DataItem]%></li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>

<asp:Literal ID="DMS" runat="server"></asp:Literal>