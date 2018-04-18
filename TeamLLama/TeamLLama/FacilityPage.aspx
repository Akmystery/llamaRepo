<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="FacilityPage.aspx.cs" Inherits="TeamLLama.FacilityPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
            padding: 5px 16px;
            float: left;
            width: 370px;
            border: 0.5px solid;
            border-color:#ccc;
            display: block;
            background-color:white;
            outline: 0;
        }

        .starRating{
            width:20px;
            height:17px;
            cursor:pointer;
            background-repeat:no-repeat;
            display:block;
        }

        .FilledStars{
            background-image:url("images/FilledStar.gif");
        }
        .EmptyStars {
            background-image: url("images/Star.gif");
        }
        .WatingStars{
            background-image: url("images/WaitingStar.gif");
        }

        body{
            background-image:url(images/bo_bg.jpg);
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
        <h2 class="mt-3 mb-3 font_style_one" style="font-size:32px;"><asp:Literal ID="lblName" runat="server"></asp:Literal></h2>
        <div class="tabbed">
            <div class="tabbar">
                <a class="tabbutton" onclick="opentab('tab-information')">Information</a>
                <a class="tabbutton" onclick="opentab('tab-map')">Directions</a>
                <a class="tabbutton" onclick="opentab('tab-ratings')">Ratings</a>
            </div>

            <div id="tab-information" class="tab">
                <div class="row mt-3">
                <div class="col"><img id="imgFacility" style="width:500px; height:400px;" src="upload/facility/<%=(String)Session["F_image"]%>"/></div>
                <div class="col">
                    <b style="font-size:24px; text-decoration:underline">General Information</b><br /> <asp:Literal ID="lblInformation" runat="server" /><br /><br />
                    <b>Contact Number:</b> <asp:Literal ID="lblContact" runat="server"/><br /><br />
                    <b>Address:</b> <asp:Literal ID="lblAddress" runat="server"/><br /><br />
                    <b>Operating Hours:</b> <asp:Literal ID="lblOperatingHours" runat="server"/><br /><br />
                    <b>Rating: </b><asp:Literal ID="lblRatingNumber" runat="server"/><br />
                    <br />
                    <asp:Button ID="btnBookAppointment" runat="server" Text="Book Appointment" OnClick="btnBookAppointment_Click" CssClass="btn btn-primary"/>
                </div>
                </div>
            </div>

            <div id="tab-map" class="tab mt-4 mb-5" style="display:none;">
                <iframe
                    style="width:100%; height:80vh; border:0;"
                    frameborder="0"
                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDdMdOD2kYXSIbHKV_EzFh15E5Hxo0UsQA&q=<%= Uri.EscapeDataString(lblName.Text) %>" allowfullscreen>
                </iframe>
            </div>

            <div id="tab-ratings" class="tab mt-2 mb-5" style="display:none;">
                    <asp:Label ID="Label1" runat="server" Text="Rating:"></asp:Label>
                    <asp:Label ID="lblRating" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <% if(Session["Account"] != null){ %>
                    Your Rating:
                    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <ajaxToolkit:Rating ID="Rating1" runat="server"
                                StarCssClass="starRating"
                                FilledStarCssClass="FilledStars"
                                WaitingStarCssClass="WaitingStars"
                                EmptyStarCssClass="EmptyStars"
                             >
                            </ajaxToolkit:Rating>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <asp:TextBox ID="txtComment" TextMode="multiline" Columns="50" Rows="2"  runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblComment" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="btn btn-primary" />
                    <br />
                    <%}%>
                    Comments:
                    <asp:Repeater ID="Comments" runat="server">
                        <ItemTemplate>
                            <hr />
                            <p class="d-inline-block mr-2">Rating:</p>
                            <ajaxToolkit:Rating ID="Rating2" runat="server" CssClass="d-inline-block mt-4"
                                StarCssClass="starRating"
                                FilledStarCssClass="FilledStars"
                                WaitingStarCssClass="WaitingStars"
                                EmptyStarCssClass="EmptyStars"
                                ReadOnly="true"
                                CurrentRating='<%# Eval("rating") %>'
                             >
                            </ajaxToolkit:Rating>
                             <br />
                            <asp:Label ID="lblComment" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:Repeater>
                    </div>
        </div>
    </div>
</asp:Content>
