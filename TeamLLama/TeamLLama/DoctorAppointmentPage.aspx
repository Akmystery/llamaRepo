<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorAppointmentPage.aspx.cs" Inherits="TeamLLama.DoctorAppointmentPage" MasterPageFile="~/Master_Page.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="c_head" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tableStyle {
            margin-left: auto;
            margin-right: auto;
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
            width: 200px;
            height: 140px;
        }
    </style>
</asp:Content>
<asp:Content ID="c_content" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <table class="tableStyle">
            <tr>
                <td>
                    <asp:Label ID="lblUpcoming" runat="server" Text="Upcoming Appointments" Font-Size="Larger"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="grdUpcomingAppointment" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" PageSize="5" OnPageIndexChanging="grdUpcomingAppointment_PageIndexChanging" AllowPaging="True" PagerStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" EmptyDataRowStyle-HorizontalAlign="Center" BorderStyle="Solid" CellPadding="10">
                        <Columns>
                            <asp:TemplateField HeaderText="ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblAppointmentID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NRIC" ItemStyle-Width="120px">
                                <ItemTemplate>
                                    <asp:Label ID="lblNRIC" runat="server" Text='<%# Eval("NRIC") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time" ItemStyle-Width="80px">
                                <ItemTemplate>
                                    <asp:Label ID="lblTime" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comments" ItemStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Button ID="btnRefer" runat="server" Text="Refer" OnClick="btnRefer_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="lb_empty" class="emptyMsg" runat="server" Text="No Record Found" Width="580px"></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblHistory" runat="server" Text="Past Appointments" Font-Size="Larger"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="grdAppointmentHistory" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" PageSize="5" OnPageIndexChanging="grdAppointmentHistory_PageIndexChanging" AllowPaging="True" PagerStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" EmptyDataRowStyle-HorizontalAlign="Center" BorderStyle="Solid" CellPadding="10">
                        <Columns>
                            <asp:TemplateField HeaderText="ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblAppointmentID1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate1" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NRIC" ItemStyle-Width="120px">
                                <ItemTemplate>
                                    <asp:Label ID="lblNRIC1" runat="server" Text='<%# Eval("NRIC") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time" ItemStyle-Width="80px">
                                <ItemTemplate>
                                    <asp:Label ID="lblTime1" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comments" ItemStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label ID="lblComments1" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="lb_empty1" class="emptyMsg" runat="server" Text="No Record Found" Width="580px"></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <cc1:ModalPopupExtender ID="confirmPopup" runat="server" PopupControlID="CfmPanel" TargetControlID="HiddenField1" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
        <asp:Panel ID="CfmPanel" runat="server" CssClass="modalPopup1" align="center" Style="display: none">
            <asp:Label ID="lbl_id" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblMsg" runat="server" Text="Confirm Refer?" Visible="true"></asp:Label><br />
            <br />
            <asp:Button ID="btnYes" runat="server" Text="Yes" OnClick="btnYes_Click" />
            <asp:Button ID="btnNo" runat="server" Text="No" />
        </asp:Panel>
    </div>
</asp:Content>
