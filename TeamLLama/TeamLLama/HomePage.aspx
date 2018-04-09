<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="TeamLLama.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .fs{
            font-size:18px;
        }
        body {
         background-image:url(images/home_bg2.jpg);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
	<div class="container">
                    <p class="font_style_one mb-0" style="font-size: 52px; margin-top:80px;">Doctor LLama</p>
                    <p class="font_style_one" style="font-size: 24px">"One Click away from your HealthCare"</p>
                    <div class="row">
                    <asp:TextBox ID="tbSearch" runat="server" placeholder="Enter your location" CSSClass="form-control ml-3 border-dark" Width="650px"></asp:TextBox>
                    </div>
                    <div class="row ml-1 mt-4 mb-5">
                        <asp:Button ID="btnSearchNearby" runat="server" Text="Search Nearby" OnClick="btnSearchNearby_Click" CssClass="btn btn-dark d-inline fs mr-3"/>
                        <asp:Button ID="btnSearchFacility" runat="server" Text="Search Facility" OnClick="btnSearchFacility_Click" CssClass="btn btn-dark d-inline fs" />
                    </div>
                    <div class="mt-5">
                        <p class="font_style_one" style="font-size: 16px">"Additonal Health Info"</p>
                        <a href="PharmamyList.aspx" class="btn btn-outline-secondary btn-sm">Pharmancies</a>
                    </div>
    </div>
</asp:Content>
