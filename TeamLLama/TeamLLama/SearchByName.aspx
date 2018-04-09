<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="SearchByName.aspx.cs" Inherits="TeamLLama.SearchByName" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .searchResults {
            display: flex;
            flex-wrap: wrap;
            margin: 0 auto;
        }
        .facilitySquare {
            display: block;
            flex-basis: 20%;
            box-sizing: border-box;
            padding: 1em;
            border: 1px solid grey;
            text-decoration: inherit;
            color: inherit;
            margin-right:15px;
            margin-bottom:10px;
            box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
        }
        .facilityImage {
            width: 100%;
        }
        .facilityTitle {
            font-weight: bold;
            text-align: center;
        }
        .facilityRating {
            text-align: center;
        }
        body{
            background-image:url(images/ap_bg.jpg);
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
	<div class="container">
        <h2 class="mt-3 mb-3">SEARCH RESULTS</h2>
        <%if (!noResults)
            { %>
            <asp:ListView ID="listResults" 
                ItemType="TeamLLama.Entity.Facility" 
                runat="server">
                <LayoutTemplate>
                    <div class="searchResults" runat="server">
                        <a class="facilitySquare card" id="itemPlaceholder" runat="server"></a>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <a class="facilitySquare card" href="<%=Request.ApplicationPath == "/"?"": Request.ApplicationPath %>/FacilityPage.aspx?id=<%# Item.facilityID %>">
                        <img class="facilityImage card-img" src="https://m.phnompenhpost.com/sites/default/files/styles/full-screen/public/field/image/8-mount-alvernia-hospital.jpg" />
                        <div class="facilityTitle"><%# Item.facilityName %></div>
                        <div class="facilityRating">Rating: <%# rcs.GetRatingString(Item.facilityID) %></div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        <%}
        else{ %>
            <div>No results found.</div>
            <%} %>
    </div>
</asp:Content>