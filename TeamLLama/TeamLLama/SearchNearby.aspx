<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="SearchNearby.aspx.cs" Inherits="TeamLLama.SearchNearby" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css"
        integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ=="
        crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"
        integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw=="
        crossorigin=""></script>
    <style>
        #map { height: 800px; }

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
        }
        .facilitySquare {
            display: block;
            flex: 1;
            padding: 1em;
            border: 1px solid grey;
            text-decoration: inherit;
            color: inherit;
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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container">
        <h2>SEARCH RESULTS</h2>
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

                var center = L.bounds([1.56073, 104.11475], [1.16, 103.502]).getCenter();
                var map = L.map('map').setView([center.x, center.y], 12);
                map.setMaxBounds([[1.56073, 104.1147], [1.16, 103.502]]);

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

            <asp:ListView ID="listResults" 
                ItemType="TeamLLama.Entity.Facility" 
                runat="server">
                <LayoutTemplate>
                    <div class="nearbyResults" runat="server">
                        <a class="facilitySquare" id="itemPlaceholder" runat="server"></a>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <a class="facilitySquare" href="<%=Request.ApplicationPath == "/"?"": Request.ApplicationPath %>/FacilityPage.aspx?id=<%# Item.facilityID %>">
                        <img class="facilityImage" src="https://m.phnompenhpost.com/sites/default/files/styles/full-screen/public/field/image/8-mount-alvernia-hospital.jpg" />
                        <div class="facilityTitle"><%# Item.facilityName %></div>
                        <div class="facilityRating"><%# GetRatingString(Item.facilityID) %></div>
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
