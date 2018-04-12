<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="BookAppointmentPage.aspx.cs" Inherits="TeamLLama.BookAppointmentPage" %>

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
            width: 300px;
            height: 200px;
        }
        .popUpButton{
            
            height: 50px;
            width: 55px;
            font-weight: bold;
            font-size: larger;
            text-align: center;
            text-decoration: none;
        }
        body{
            background-image:url(images/bo_bg.jpg);
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <table class="tableStyle">
        <tr>
            <td colspan="2">
                <h3 class="mt-4"><asp:Label ID="Label3" runat="server" Text="Book Appointment" Font-Size="Larger"></asp:Label></h3>
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
                <asp:DropDownList ID="HospitalDropDownList" runat="server" OnSelectedIndexChanged="HospitalDropDownList_SelectedIndexChanged" CssClass="form-control ml-2" AutoPostBack="True" Width="350px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblHospital" runat="server" ForeColor="Red" Visible="False">Hospital cannot be empty</asp:Label>
                <!-- <asp:Label ID="lb_openingHrs" runat="server" Text="Opening Hours: " Visible="False"></asp:Label> -->
                <!-- <asp:Label ID="lb_actualOpening" runat="server" Text="" Visible="false"></asp:Label> -->
            </td>
        </tr>
        <!-- <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lb_closingHrs" runat="server" Text="Closing Hours: " Visible="False"></asp:Label> 
                <asp:Label ID="lb_actualClosing" runat="server" Text="" Visible="false"></asp:Label>
            </td> 
        </tr>-->
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Department: "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DepartmentDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DepartmentDropDownList_SelectedIndexChanged" CssClass="form-control ml-2" Width="200px">
                    <asp:ListItem Selected="True" Value="-1">(Select a Department)</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblDepartment" runat="server" ForeColor="Red" Visible="False">Department cannot be empty</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Date: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="DateTextBox" runat="server" AutoPostBack="True" OnTextChanged="DateTextBox_TextChanged" CssClass="form-control ml-2" Width="200px"></asp:TextBox>
                <cc1:CalendarExtender ID="DateTextBox_CalendarExtender" runat="server" TargetControlID="DateTextBox" Format="dd/MM/yyyy" />
                <asp:Label ID="lblActualDate" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblDate" runat="server" ForeColor="Red" Visible="False">Date cannot be empty</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Time: "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="HourDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="HourDropDownList_SelectedIndexChanged" Width="80px" CssClass="form-control d-inline ml-2">
                    <asp:ListItem Value="-1" Selected="True"> -Hr-</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="MinDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="MinDropDownList_SelectedIndexChanged" Width="90px" CssClass="form-control d-inline">
                    <asp:ListItem Value="-1" Selected="True"> -Min-</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="AMPMDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="AMPMDropDownList_SelectedIndexChanged" Width="120px" CssClass="form-control d-inline" >
                    <asp:ListItem Value="-1" Selected="True"> - AM/PM-</asp:ListItem>
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblTime" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="BookButton" runat="server" OnClick="BookButton_Click" Text="Book" CssClass="btn btn-primary float-right" Width="80px"/>
            </td>
        </tr>
    </table>


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <cc1:ModalPopupExtender ID="confirmPopup" runat="server" PopupControlID="CfmPanel" TargetControlID="HiddenField1" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
    <asp:Panel ID="CfmPanel" runat="server" CssClass="modalPopup1" align="center" Style="display: none">
        <br />
        <asp:Label ID="lbl_id" runat="server" Text="" Visible="false"></asp:Label>
        <h3><asp:Label ID="lblMsg" runat="server" Text="Confirm Booking?" Visible="true"></asp:Label></h3><br />
        <br />
        <asp:Button ID="btnYes" runat="server" Text="Yes" OnClick="YesButton_Click" CssClass="popUpButton"/>
        <asp:Button ID="btnNo" runat="server" Text="No" CssClass="popUpButton"/>
        <div class="mb-2"></div>
    </asp:Panel>

</asp:Content>
