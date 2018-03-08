<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorAppointmentPage.aspx.cs" Inherits="TeamLLama.DoctorAppointmentPage" masterpagefile="~/Master_Page.Master"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="c_head" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 10px;
        width: 500px;
        height: 540px;
    }
    .modalPopup1
    {
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 10px;
        width: 300px;
        height: 240px;
    }
</style>
 </asp:Content>
<asp:Content ID="c_content" ContentPlaceHolderID="ContentBody" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <div>
            <asp:Label ID="lblUpcoming" runat="server" Text="Upcoming Appointments"></asp:Label>
            <asp:GridView ID="grdUpcomingAppointment" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" PageSize="2" OnPageIndexChanging="grdUpcomingAppointment_PageIndexChanging" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="ID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblAppointmentID1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="lblDate1" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Facility">
                        <ItemTemplate>
                            <asp:Label ID="lblFacility1" runat="server" Text='<%# Eval("Facility") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department">
                        <ItemTemplate>
                            <asp:Label ID="lblDepartment1" runat="server" Text='<%# Eval("Department") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTime1" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbn_view1" runat="server" OnClick="lbn_view1_Click">View</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblHistory" runat="server" Text="Past Appointments"></asp:Label>
            <asp:GridView ID="grdAppointmentHistory" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" PageSize="2" OnPageIndexChanging="grdAppointmentHistory_PageIndexChanging" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="ID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblAppointmentID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Facility">
                        <ItemTemplate>
                            <asp:Label ID="lblFacility" runat="server" Text='<%# Eval("Facility") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department">
                        <ItemTemplate>
                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("Department") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTime" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbn_view" runat="server" OnClick="lbn_view_Click">View</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="HiddenField1" CancelControlID="btnClose" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style = "display:none">
            
                <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label><br /><br /><br />
                <asp:Label ID="lbl_ViewDate" runat="server" Text="Date: "></asp:Label>
                <asp:Label ID="lbl_DateDetail" runat="server" Text='<%# Eval("Date") %>'></asp:Label><br /><br /><br />
                <asp:Label ID="lbl_Facility" runat="server" Text="Facility: "></asp:Label>
                <asp:Label ID="lbl_FacilityDetail" runat="server" Text='<%# Eval("Facility") %>'></asp:Label><br /><br /><br />
                <asp:Label ID="lbl_Department" runat="server" Text="Department: "></asp:Label>
                <asp:Label ID="lbl_DepartmentDetail" runat="server" Text='<%# Eval("Department") %>'></asp:Label><br /><br /><br />
                <asp:Label ID="lbl_Time" runat="server" Text="Time: "></asp:Label>
                <asp:Label ID="lbl_TimeDetail" runat="server" Text='<%# Eval("Time") %>'></asp:Label><br /><br /><br />
                <br />
            <asp:Button ID="btnRefer" runat="server" Text="Refer" />
            <asp:Button ID="btnClose" runat="server" Text="Close" />
            </asp:Panel>
            <cc1:ModalPopupExtender ID="confirmPopup" runat="server" PopupControlID="CfmPanel" TargetControlID="btnRefer" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
            <asp:Panel ID="CfmPanel" runat="server" CssClass="modalPopup1" align="center" style = "display:none">
                <asp:Label ID="lblMsg" runat="server" Text="Are You Sure You Want To Refer?" Visible="true"></asp:Label><br /><br /><br />
                <br />
            <asp:Button ID="btnYes" runat="server" Text="Yes" OnClick="btnYes_Click"/>
            <asp:Button ID="btnNo" runat="server" Text="No" />
            </asp:Panel>
        </div>
 </asp:Content>
