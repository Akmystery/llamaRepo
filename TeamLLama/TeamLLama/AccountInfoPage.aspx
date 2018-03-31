<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="AccountInfoPage.aspx.cs" Inherits="TeamLLama.AccountInfoPage" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
		.auto-style2 {
			width: 152px;
            height: 50px;
            margin-top: 10px;
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
            width: auto;
            height: auto;
        }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container text-center">
	<h1 class="font_style_one mt-5 mb-4">Account Info</h1>
    </div>
    <div class="content-wrap" style="max-width:550px;">
		<table style="width:100%;">
             <tr>
				<td class="auto-style2">Profile Picture:</td>
				<td>
				    <asp:Image ID="profilePic" runat="server" Height="170px" Width="170px" />	
				</td>
				<td>&nbsp;</td>
			</tr>
            <tr>
				<td class="auto-style2">NRIC:</td>
				<td>
					
				    <asp:Label ID="lblNric" runat="server"></asp:Label>
					
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2">Name:</td>
				<td>
					
				    <asp:Label ID="lblName" runat="server"></asp:Label>
					
				</td>
				<td>&nbsp;</td>
			</tr>
						<tr>
				<td class="auto-style2">Email:</td>
				<td>
					
				    <asp:Label ID="lblEmail" runat="server"></asp:Label>
					
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2">Address:</td>
				<td>
					
				    <asp:Label ID="lblAddress" runat="server"></asp:Label>
					
				</td>
				<td>&nbsp;</td>
			</tr>
            <tr>
            <td>&nbsp;</td>
			</tr>
		</table>
        <div class="float-right">
        <asp:Button ID="Button1" runat="server" OnClick="UpDate_Click" Text="Update Account" />
        <asp:Button ID="deleteButton" runat="server" OnClick="Delete_Click" Text="Deactivate Account"/>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <cc1:modalpopupextender ID="passwordPopup" runat="server" PopupControlID="CfmPanel" TargetControlID="HiddenField1" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:modalpopupextender>
        <asp:Panel ID="CfmPanel" runat="server" CssClass="modalPopup1" align="center" Style="display: none">
            <asp:Label ID="lblMsg" runat="server" Text="Please Enter your Password" Visible="true"></asp:Label><br />
            <br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnYes" runat="server" Text="Submit" OnClick="btnYes_Click" />
            <asp:Button ID="btnNo" runat="server" Text="Cancel"/>
            <div class="m-2"></div>
        </asp:Panel>
        <asp:HiddenField ID="HiddenField2" runat="server" />
        <cc1:modalpopupextender ID="confirmPopup" runat="server" PopupControlID="Panel1" TargetControlID="HiddenField2" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:modalpopupextender>
        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup1" align="center" Style="display: none">
            <asp:Label ID="Label1" runat="server" Text="Wrong Password!" Visible="true" ForeColor="Red" CssClass="pl-3 pr-3"></asp:Label>
            <div class="m-2"></div>
            <asp:Button ID="Button3" runat="server" Text="Ok"/>
            <div class="m-2"></div>
        </asp:Panel>
        <asp:HiddenField ID="HiddenField3" runat="server" />
        <cc1:modalpopupextender ID="deletePopup" runat="server" PopupControlID="Panel2" TargetControlID="HiddenField3" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:modalpopupextender>
        <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup1" align="center" Style="display: none">
             <asp:Label ID="Label3" runat="server" Text="Are you sure you want to delete your account?" Visible="true"></asp:Label><br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
            <asp:Button ID="Button2" runat="server" Text="Cancel"/>
            <div class="m-2"></div>
        </asp:Panel>
        </div>
</asp:Content>
