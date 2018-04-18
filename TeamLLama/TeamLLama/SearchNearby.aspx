<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="SearchNearby.aspx.cs" Inherits="TeamLLama.SearchNearby" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css"
        integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ=="
        crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"
        integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw=="
        crossorigin=""></script>
    <style>
        #map { height: 600px; }

        .leaflet-marker-icon .number {
            position: relative;
            top: -42px;
            font-size: 12px;
            width: 25px;
            text-align: center;
            font-weight: bold;
        }

        .nearbyResults {
            display: flex;
            margin: 0 auto;
            height:auto;
        }
        .facilitySquare {
            display: block;
            flex: 2;
            padding: 1em;
            text-decoration: inherit;
            color: inherit;
            margin-right:10px;
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
            <asp:TextBox ID="tbSearch" runat="server" placeholder="Search new location" CSSClass="form-control ml-3 border-dark" Width="650px"></asp:TextBox>
            <asp:Button ID="btnSearchNearby" runat="server" Text="Search Nearby" OnClick="btnSearchNearby_Click" CssClass="btn btn-dark d-inline fs mr-3"/>
        </div>
        <h2 class="font_style_one mt-3 mb-3" style="font-size:30px">Hospitals near your location</h2>
        <%if (this.location != null)
            { %>
            <div id="map"></div>
            <script>
                L.NumberedDivIcon = L.Icon.Default.extend({
                    createIcon: function() {
                        var div = document.createElement('div');
                        var img = this._createImg(this._getIconUrl('icon'));
                        var numdiv = document.createElement('div');
                        numdiv.setAttribute("class", "number");
                        numdiv.innerHTML = this.options['number'] || '';
                        div.appendChild(img);
                        div.appendChild(numdiv);
                        this._setIconStyles(div, 'icon');
                        this._setIconStyles(img, 'icon');
                        img.className = img.style.marginTop = img.style.marginLeft = '';
                        return div;
                    },
                });

                var map = L.map('map');
                map.fitBounds([[<%=this.upperbound.Item1%>, <%=this.upperbound.Item2%>], [<%=this.lowerbound.Item1%>, <%=this.lowerbound.Item2%>]]);

                L.tileLayer('https://maps-{s}.onemap.sg/v3/Default/{z}/{x}/{y}.png', {
                    detectRetina: true,
                    maxZoom: 18,
                    minZoom: 11
                }).addTo(map);

                function addMarker(t, x, y) {
                    L.marker([x, y], {icon: new L.NumberedDivIcon({number: t})}).addTo(map);
                }
                L.marker([<%=this.location.Item1%>, <%=this.location.Item2%>]).addTo(map);
                <% foreach (var l in this.location_list.Select((l, i) => new { Point = l, Index = i }))
                { %>
                addMarker('<%= (char)('A' + l.Index)%>', <%= l.Point.Item1 %>, <%= l.Point.Item2 %>);
                <% } %>
            </script>
            <h2 class="font_style_one mt-3 mb-1" style="font-size:20px; font-weight:bold;">Lists of Hospitals near your location by distance</h2>
            <asp:ListView ID="listResults" 
                ItemType="TeamLLama.Entity.Facility" 
                runat="server">
                <LayoutTemplate>
                    <div class="nearbyResults mt-2 mb-4" runat="server">
                        <a class="facilitySquare card" id="itemPlaceholder" runat="server"></a>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <a class="facilitySquare card" href="<%=Request.ApplicationPath == "/"?"": Request.ApplicationPath %>/FacilityPage.aspx?name=<%# Item.facilityName %>">
                        <img class="facilityImage" src="upload/facility/<%# Item.image %>" style="width:180px; height:150px;"/>
                        <div class="facilityTitle"><%# Item.facilityName %></div>
                        <div class="facilityRating">Rating: <%# TeamLLama.Controller.ReviewControlSystem.GetRatingString(Item.facilityID) %></div>
                    </a>
                </ItemTemplate>
            </asp:ListView>
        <% } else { %>
            <div>
                No results found.
            </div>
        <% } %>
    </div>
</asp:Content>
