<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="FacilityPage.aspx.cs" Inherits="TeamLLama.FacilityPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tabbed {
            border: 1px solid #ccc !important;
        }
        .tabbar {
            width: 100%;
            overflow: hidden;
        }
        .tabbar .tabbutton {
            border: none;
            vertical-align: middle;
            overflow: hidden;
            text-decoration: none;
            color: inherit;
            background-color: inherit;
            text-align: center;
            cursor: pointer;
            padding: 8px 16px;
            float: left;
            width: auto;
            border: none;
            display: block;
            outline: 0;
        }
    </style>
    <script type="text/javascript">
        function opentab(id) {
            var tabs = document.querySelectorAll(".tab");
            for (var tab of tabs) {
                tab.style.display = "none";
            }

            document.querySelector("#" + id).style.display = "block";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container">
        <h2><asp:Literal ID="lblName" runat="server" Text="MISSINGNO."></asp:Literal></h2>
        <div class="tabbed">
            <div class="tabbar">
                <a class="tabbutton" onclick="opentab('tab-information')">Information</a>
                <a class="tabbutton" onclick="opentab('tab-map')">Directions</a>
                <a class="tabbutton" onclick="opentab('tab-ratings')">Ratings</a>
            </div>
            <div id="tab-information" class="tab">
                Hello!
            </div>
            <div id="tab-map" class="tab" style="display:none;">World!</div>
            <div id="tab-ratings" class="tab" style="display:none;">CGH sucks!</div>
        </div>
    </div>
</asp:Content>
