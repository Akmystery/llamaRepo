<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="CreateFacility.aspx.cs" Inherits="TeamLLama.WebForm3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 152px;
            height: 10px;
        }

        .auto-style3 {
            width: 152px;
            height: 9px;
        }

        .auto-style4 {
            height: 9px;
        }

        .auto-style5 {
            height: 10px;
        }
         .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .modalPopup1 {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 1000px;
            height: 600px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container text-center">
        <h1 class="font_style_one mt-5 mb-4">Add New Facility</h1>
    </div>
    <div class="content-wrap" style="max-width: 810px;">
        <table style="width: 100%;">
            <tr>
                <td class="auto-style2">Facility Name</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="280px"></asp:TextBox>
                    <asp:Button ID="bn_search" runat="server" Text="Search" OnClick="bn_search_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblName" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Facility Type</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="listFacility" runat="server">
                        <asp:ListItem>Government Hospital</asp:ListItem>
                        <asp:ListItem>PolyClinic</asp:ListItem>
                        <asp:ListItem>Hospital</asp:ListItem>
                        <asp:ListItem>Clinic</asp:ListItem>
                        <asp:ListItem>Phermancy</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblType" runat="server" ForeColor="Red" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">General Information</td>
                <td>
                    <asp:TextBox ID="txtInfo" runat="server" TextMode="multiline" Columns="37" Rows="5"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblInfo" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Phone Number</td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" Width="280px"></asp:TextBox>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblPhoneNumber" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="auto-style2">Opening Hour</td>
                <td>
                    <asp:TextBox ID="txtOpening" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblOpening" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Closing Hour</td>
                <td>
                    <asp:TextBox ID="txtClosing" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblClosing" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Address</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Width="280px" TextMode="MultiLine"></asp:TextBox>
                    <asp:Label ID="lblSelectedX" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="lblSelectedY" runat="server" Text="" Visible="false"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4">
                    <asp:Label ID="lblAddress" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Region</td>
                <td>
                    <asp:TextBox ID="txtRegion" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblRegion" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Facility Image</td>
                <td>
                    <asp:FileUpload ID="ImageUpload" runat="server" Width="280px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="btnCreate" runat="server" OnClick="Create_Click" Text="Create" />
                    <asp:Button ID="btnBack" runat="server" Text="Back to Home Page" OnClick="btnBack_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <cc1:modalpopupextender id="confirmPopup" runat="server" popupcontrolid="CfmPanel" targetcontrolid="HiddenField1" cancelcontrolid="btnClose" backgroundcssclass="modalBackground"></cc1:modalpopupextender>
    <asp:Panel ID="CfmPanel" runat="server" CssClass="modalPopup1" align="center" Style="display: none">
        <asp:Label ID="lblMsg" runat="server" Text="Results" Visible="true" Font-Size="Large"></asp:Label><br />
        <br />
        <asp:GridView ID="grdFacilities" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" PageSize="5" OnPageIndexChanging="grdFacilities_PageIndexChanging" AllowPaging="True" PagerStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" EmptyDataRowStyle-HorizontalAlign="Center" BorderStyle="Solid" CellPadding="10">
                        <Columns>
                            <asp:TemplateField HeaderText="Building" ItemStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label ID="lblBuilding" runat="server" Text='<%# Eval("Building") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" ItemStyle-Width="400px">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Postal" ItemStyle-Width="80px">
                                <ItemTemplate>
                                    <asp:Label ID="lblPostal" runat="server" Text='<%# Eval("Postal") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="x" visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblX" runat="server" Text='<%# Eval("x") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="y" visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblY" runat="server" Text='<%# Eval("y") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="lb_empty" class="emptyMsg" runat="server" Text="No Record Found" Width="730px"></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
        <asp:Button ID="btnClose" runat="server" Text="Close" />
    </asp:Panel>
</asp:Content>
