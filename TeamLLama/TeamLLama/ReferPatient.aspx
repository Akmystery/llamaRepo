<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="ReferPatient.aspx.cs" Inherits="TeamLLama.ReferPatient" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 500px;
            height: 540px;
        }

        .modalPopup1 {
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:Label ID="Label3" runat="server" Text="Refer Appointment"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lb_id" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="Label6" runat="server" Text="Name: "></asp:Label>
    <asp:Label ID="lb_name" runat="server" Text=""></asp:Label>
    <br />

    <br />
    <asp:Label ID="Label5" runat="server" Text="Hospital: "></asp:Label>
    <asp:DropDownList ID="HospitalDropDownList" runat="server" OnSelectedIndexChanged="HospitalDropDownList_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    <br />
    <asp:Label ID="lb_openingHrs" runat="server" Text="Opening Hours: " Visible="true"></asp:Label>
    <asp:Label ID="lb_actualOpening" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lb_closingHrs" runat="server" Text="Closing Hours: " Visible="true"></asp:Label>
    <asp:Label ID="lb_actualClosing" runat="server" Text="" Visible="false"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Department: "></asp:Label>
    <asp:DropDownList ID="DepartmentDropDownList" runat="server">
        <asp:ListItem Selected="True" Value="-1">(Select a Department)</asp:ListItem>
    </asp:DropDownList>
    <p>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Date: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
        <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" TargetControlID="TextBox1" Format="dd/MM/yyyy" />
        <asp:Label ID="lblActualDate" runat="server" Text="" Visible="false"></asp:Label>
        <br />

    </p>

    <p>
        <asp:Label ID="Label4" runat="server" Text="Time: "></asp:Label>
        <asp:DropDownList ID="HourDropDownList" runat="server">
            <asp:ListItem Value="-1" Selected="True"> -Hr-</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="MinDropDownList" runat="server">
            <asp:ListItem Value="-1" Selected="True"> -Min-</asp:ListItem>
            <asp:ListItem>00</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="AMPMDropDownList" runat="server">
            <asp:ListItem Value="-1" Selected="True"> - AM/PM-</asp:ListItem>
            <asp:ListItem>AM</asp:ListItem>
            <asp:ListItem>PM</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:Label ID="Label7" runat="server" Text="Comments: "></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="CommentTextBox" runat="server" Height="118px" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <asp:Button ID="BookButton" runat="server" OnClick="BookButton_Click" Text="Book" />

    </p>
    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="White" Visible="False">
        Confirm?<br />
        <asp:Button ID="YesButton" runat="server" OnClick="YesButton_Click" Text="Yes" />
        <asp:Button ID="NoButton" runat="server" Text="No" />
    </asp:Panel>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="Panel1" TargetControlID="HiddenField1" CancelControlID="NoButton"></cc1:ModalPopupExtender>


</asp:Content>
