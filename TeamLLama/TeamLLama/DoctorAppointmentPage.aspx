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
            width: 350px;
            height: 280px;
        }
        .popUpButton{
            
            height: 50px;
            width: 55px;
            font-weight: bold;
            font-size: larger;
            text-align: center;
            text-decoration: none;
        }

        body {
            background-image: url(images/ap_bg.jpg);
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
    </style>
</asp:Content>
<asp:Content ID="c_content" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <table class="tableStyle">
            <tr>
                <td>
                    <h3 class="mt-3">
                        <asp:Label ID="lblUpcoming" runat="server" Text="Upcoming Appointments" Font-Size="Larger"></asp:Label></h3>
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
                                    <asp:Button ID="btnRefer" runat="server" Text="Refer" OnClick="btnRefer_Click" CssClass="btn btn-success" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="lb_empty" class="emptyMsg" runat="server" Text="No Record Found" Width="580px"></asp:Label>
                        </EmptyDataTemplate>
                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager"></PagerStyle>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <h3>
                        <asp:Label ID="lblHistory" runat="server" Text="Past Appointments" Font-Size="Larger"></asp:Label></h3>
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
                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager"></PagerStyle>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <cc1:ModalPopupExtender ID="confirmPopup" runat="server" PopupControlID="CfmPanel" TargetControlID="HiddenField1" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
        <asp:Panel ID="CfmPanel" runat="server" CssClass="modalPopup1" align="center" Style="display: none">
            <br/>
            <h3><asp:Label ID="lblMsg" runat="server" Text="Confirm Refer Patient?" Visible="true" ></asp:Label></h3><br />
            <br />
            <asp:Label ID="lbl_id" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lbl_nric1" runat="server" Text="NRIC: " Visible="true" Font-Size="Larger"></asp:Label>
            <asp:Label ID="lbl_nric" runat="server" Text="" Visible="true" Font-Size="Larger"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnYes" runat="server" Text="Yes" OnClick="btnYes_Click" CssClass="popUpButton"/>
            <asp:Button ID="btnNo" runat="server" Text="No" CssClass="popUpButton"/>
            <div class="mb-2"></div>
        </asp:Panel>
    </div>
</asp:Content>
