<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="FacilityList.aspx.cs" Inherits="TeamLLama.FacilityList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:Label ID="lblUpcoming" runat="server" Text="Lists of Facility"></asp:Label>
            <asp:GridView ID="grdFacility" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblFacilityID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFacilityName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type">
                        <ItemTemplate>
                            <asp:Label ID="lblFacilityType" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="GeneralInfo">
                        <ItemTemplate>
                            <asp:Label ID="lblGeneralInfo" runat="server" Text='<%# Eval("GeneralInfo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PhoneNumber">
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OpeningHrs">
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("OpeningHrs") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ClosingHrs">
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("ClosingHrs") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Region">
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("Region") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
</asp:Content>
