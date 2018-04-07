<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="SearchByName.aspx.cs" Inherits="TeamLLama.SearchByName" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
	<div class="container">
        <h2>SEARCH RESULTS</h2>
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
                                    <a href="<%=Request.ApplicationPath == "/" ? "": Request.ApplicationPath%>/FacilityPage.aspx?id=<%#Item.facilityID%>">
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