<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="TeamLLama.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
	<div class="container">
        <h2> HOME PAGE</h2>
        <div class="row">
            <div class="col">
                <asp:Panel CssClass="text-center pb-3" ID="panelSearchFacility" runat="server" DefaultButton="btnSearchFacility">
                    <asp:TextBox ID="tbSearchFacility" runat="server" ></asp:TextBox>
                    <asp:Button ID="btnSearchFacility" runat="server" Text="Search Facility" OnClick="btnSearchFacility_Click" />
                </asp:Panel>
                <asp:Panel CssClass="text-center pb-3" ID="panelSearchNearby" runat="server" DefaultButton="btnSearchNearby">
                    <asp:TextBox ID="tbSearchNearby" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearchNearby" runat="server" Text="Search Nearby" OnClick="btnSearchNearby_Click"/>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
