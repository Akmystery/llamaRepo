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
                    <asp:Button ID="btnSearchNearby" runat="server" Text="Search" OnClick="btnSearchNearby_Click" CssClass="btn btn-dark d-inline fs" Width="100px"/>
                    </div>
                    <!-- <asp:Button ID="btnSearchFacility" runat="server" Text="Search Facility" OnClick="btnSearchFacility_Click" /> -->            
    </div>
</asp:Content>
