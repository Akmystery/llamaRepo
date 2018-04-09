<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="PharmamyList.aspx.cs" Inherits="TeamLLama.pharmacy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tableStyle {
            margin-left: auto;
            margin-right: auto;
        }

        .FormatRadioButtonList label {
            margin-right: 15px;
        }

        .GridPager a, .GridPager span {
            display: block;
            height: 30px;
            width: 35px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
        }

        body{
            background-image:url(images/ap_bg.jpg);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <table class="tableStyle mb-5">
        <tr>
            <td colspan="2">
                <h3 class="mt-3">
                    <asp:Label ID="lbPharmacy" runat="server" Text="Pharmacies" Font-Size="Larger" CssClass="font_style_one"></asp:Label></h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="rbnCategory" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbnCategory_SelectedIndexChanged" CssClass="FormatRadioButtonList">
                    <asp:ListItem>Guardian</asp:ListItem>
                    <asp:ListItem>Watson</asp:ListItem>
                    <asp:ListItem>NTUC Healthcare</asp:ListItem>
                    <asp:ListItem>Unity</asp:ListItem>
                    <asp:ListItem>National Healthcare</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:Button ID="bnSelect" runat="server" Text="Select" OnClick="bnSelect_Click" CssClass="btn btn-primary mr-3" Width="100px" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:GridView ID="grdPharmacy" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" PageSize="10"
                    AllowPaging="True" PagerStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" EmptyDataRowStyle-HorizontalAlign="Center" BorderStyle="Solid" CellPadding="10" CssClass="mr-3" OnPageIndexChanging="grdPharmacy_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="Pharmacy Name" ItemStyle-Width="250px">
                            <ItemTemplate>
                                <asp:Label ID="lblPharmacyName" runat="server" Text='<%# Eval("pharmacy_name") %>'></asp:Label>
                            </ItemTemplate>

                            <ItemStyle Width="250px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pharmacy Address" ItemStyle-Width="450px">
                            <ItemTemplate>
                                <asp:Label ID="lblPharmacyAddress" runat="server" Text='<%# Eval("pharmacy_address") %>'></asp:Label>
                            </ItemTemplate>

                            <ItemStyle Width="450px"></ItemStyle>
                        </asp:TemplateField>

                    </Columns>

                    <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                    <EmptyDataTemplate>
                        <asp:Label ID="lb_empty" class="emptyMsg" runat="server" Text="No Record Found" Width="650px"></asp:Label>
                    </EmptyDataTemplate>

                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager"></PagerStyle>

                    <RowStyle HorizontalAlign="Center"></RowStyle>
                </asp:GridView>
            </td>
        </tr>

    </table>
</asp:Content>
