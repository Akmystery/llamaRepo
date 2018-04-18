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
        <br />
        <div class="row">
            <asp:TextBox ID="tbSearch" runat="server" placeholder="Search new facility" CSSClass="form-control ml-3 border-dark" Width="650px"></asp:TextBox>
            <asp:Button ID="btnSearchFacility" runat="server" Text="Search Facility" OnClick="btnSearchFacility_Click" CssClass="btn btn-dark d-inline fs" />
        </div>
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
                    <a class="facilitySquare card" href="<%=Request.ApplicationPath == "/"?"": Request.ApplicationPath %>/FacilityPage.aspx?name=<%# Item.facilityName %>">
                        <img class="facilityImage card-img" src="upload/facility/<%# Item.image %>" style="width:180px; height:150px;"/>
                        <div class="facilityTitle"><%# Item.facilityName %></div>
                        <div class="facilityRating">Rating: <%# TeamLLama.Controller.ReviewControlSystem.GetRatingString(Item.facilityID) %></div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        <%}
        else{ %>
            <div>No results found.</div>
            <%} %>
    </div>
</asp:Content>