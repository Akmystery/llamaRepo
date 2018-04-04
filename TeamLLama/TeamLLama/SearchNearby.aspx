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
    </script> <%} %>
        <div class="row">
            <div class="col">
                <div class ="text-center pb-3">
                    <asp:GridView ID="grdFacility" ItemType="TeamLLama.Entity.Facility" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblFacilityID" runat="server" Text='<%# Item.facilityID %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <a href="#<%#Item.facilityID%>">
                                        <asp:Label ID="lblFacilityName" runat="server" Text='<%# Item.facilityName %>'></asp:Label>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblFacilityType" runat="server" Text='<%# Item.facilityType %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="GeneralInfo">
                                <ItemTemplate>
                                    <asp:Label ID="lblGeneralInfo" runat="server" Text='<%# Item.generalInfo %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PhoneNumber">
                                <ItemTemplate>
                                    <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Item.phoneNumber %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="OpeningHrs">
                                <ItemTemplate>
                                    <asp:Label ID="lblOpeningHrs" runat="server" Text='<%# Item.openingHrs %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ClosingHrs">
                                <ItemTemplate>
                                    <asp:Label ID="lblClosingHrs" runat="server" Text='<%# Item.closingHrs %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Item.address %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Region">
                                <ItemTemplate>
                                    <asp:Label ID="lblRegion" runat="server" Text='<%# Item.region %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
