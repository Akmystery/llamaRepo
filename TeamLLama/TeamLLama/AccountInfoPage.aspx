<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="AccountInfoPage.aspx.cs" Inherits="TeamLLama.AccountInfoPage" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
		.auto-style2 {
			width: 152px;
            height: 50px;
            margin-top: 10px;
		}

        body{
            background-image:url(images/login_bg.jpg);
        }
        .font_style_two {
            font-family: 'Karma', serif;
            font-weight: 500;
            font-size: 20px;
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
    <div class="content-wrap mt-5" style="max-width:650px; box-shadow: 1px 2px 4px rgba(0, 0, 0, .5); background-color:white;">
        <h1 class="font_style_one mt-2 mb-4 text-center">Account Information</h1>
		<table style="width:100%;">
             <tr>
				<td>
				    	<asp:Image ID="profilePic" runat="server" Height="170px" Width="170px"  CssClass="justify-content-center border mr-4"/>
				</td>
                 <td class="auto-style2 font_style_two">Name:</td>
				<td>
					
				    <asp:Label ID="lblName" runat="server" CssClass="font_style_two"></asp:Label>
					
				</td>
			</tr>
            <tr>
                <td></td>
				<td class="auto-style2 font_style_two">NRIC:</td>
				<td>
					
				    <asp:Label ID="lblNric" runat="server" CssClass="font_style_two"></asp:Label>
					
				</td>
			</tr>
						<tr>
                            <td></td>
				<td class="auto-style2 font_style_two">Email:</td>
				<td>
					
				    <asp:Label ID="lblEmail" runat="server" CssClass="font_style_two"></asp:Label>
					
				</td>
			</tr>
			<tr>
                <td></td>
				<td class="auto-style2 font_style_two">Address:</td>
				<td>
				    <asp:Label ID="lblAddress" runat="server" CssClass="font_style_two"></asp:Label>
				</td>
			</tr>
            <tr>
                <td></td>
                <td><asp:Button ID="Button1" runat="server" OnClick="UpDate_Click" CssClass="btn btn-primary mb-3" Text="Update Account" /></td>
                <td>
                    
                    <asp:Button ID="deleteButton" runat="server" OnClick="Delete_Click" CssClass="btn btn-primary mb-3" Text="Deactivate Account"/>
                </td>
            </tr>
		</table>
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
        <cc1:modalpopupextender ID="wrongPopup" runat="server" PopupControlID="Panel1" TargetControlID="HiddenField2" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:modalpopupextender>
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
