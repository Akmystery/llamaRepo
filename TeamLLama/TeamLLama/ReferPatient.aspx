<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="ReferPatient.aspx.cs" Inherits="TeamLLama.ReferPatient" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <table class="tableStyle">
        <tr>
            <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="Refer Appointment" Font-Size="Larger"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lb_id" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="Name: "></asp:Label>
            </td>
            <td>
                <asp:Label ID="lb_name" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Hospital: "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="HospitalDropDownList" runat="server" OnSelectedIndexChanged="HospitalDropDownList_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Label ID="lb_openingHrs" runat="server" Text="Opening Hours: " Visible="true"></asp:Label>
                <asp:Label ID="lb_actualOpening" runat="server" Text="" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Label ID="lb_closingHrs" runat="server" Text="Closing Hours: " Visible="true"></asp:Label>
                <asp:Label ID="lb_actualClosing" runat="server" Text="" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Department: "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DepartmentDropDownList" runat="server">
                    <asp:ListItem Selected="True" Value="-1">(Select a Department)</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Date: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="DateTextBox" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="DateTextBox_CalendarExtender" runat="server" TargetControlID="DateTextBox" Format="dd/MM/yyyy" />
                <asp:Label ID="lblActualDate" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Time: "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="HourDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HourDropDownList_SelectedIndexChanged">
                    <asp:ListItem Value="-1" Selected="True"> -Hr-</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="MinDropDownList" runat="server">
                    <asp:ListItem Value="-1" Selected="True"> -Min-</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="AMPMDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="AMPMDropDownList_SelectedIndexChanged">
                    <asp:ListItem Value="-1" Selected="True"> - AM/PM-</asp:ListItem>
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Comments: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="CommentTextBox" runat="server" Height="118px" Width="300px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="BookButton" runat="server" OnClick="BookButton_Click" Text="Book" />
            </td>
        </tr>
    </table>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <cc1:ModalPopupExtender ID="confirmPopup" runat="server" PopupControlID="CfmPanel" TargetControlID="HiddenField1" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
    <asp:Panel ID="CfmPanel" runat="server" CssClass="modalPopup1" align="center" Style="display: none">
        <asp:Label ID="lbl_id" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblMsg" runat="server" Text="Confirm Refer?" Visible="true" Font-Size="Large"></asp:Label><br />
        <br />
        <asp:Button ID="btnYes" runat="server" Text="Yes" OnClick="YesButton_Click" />
        <asp:Button ID="btnNo" runat="server" Text="No" />
    </asp:Panel>

</asp:Content>
