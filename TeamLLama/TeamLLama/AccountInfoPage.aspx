<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="AccountInfoPage.aspx.cs" Inherits="TeamLLama.AccountInfoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.auto-style2 {
			width: 152px;
            height: 50px;
            margin-top: 10px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container text-center">
	<h1 class="font_style_one mt-5 mb-4">Account Info</h1>
    </div>
    <div class="content-wrap" style="max-width:810px;">
		<table style="width:100%;">
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
				<td class="auto-style2">Password:</td>
				<td>
					
				    <asp:Label ID="lblPassword" runat="server"></asp:Label>
					
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
        <asp:Button ID="deleteButton" runat="server" OnClick="Delete_Click" Text="Delete Account" />
        </div>
        </div>
</asp:Content>
