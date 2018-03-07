<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="TeamLLama.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.auto-style1 {
			height: 26px;
		}
		.auto-style2 {
			width: 89px;
		}
		.auto-style3 {
			height: 26px;
			width: 89px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
	<h1>Login Page</h1>
	<table style="width:100%;">
		<tr>
			<td class="auto-style2">&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style3">NRIC:</td>
			<td class="auto-style1">
				<asp:TextBox ID="txtNRIC" runat="server"></asp:TextBox>
			</td>
			<td class="auto-style1"></td>
		</tr>
		<tr>
			<td></td>
			<td class="auto-style1">
				<asp:Label ID="lblNRIC" runat="server" ForeColor="Red"></asp:Label>
			</td>
			<td class="auto-style1"></td>
		</tr>
		<tr>
			<td class="auto-style2">Password:</td>
			<td>
				<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
			</td>
			<td>&nbsp;</td>
		</tr>
				<tr>
			<td></td>
			<td class="auto-style1">
				<asp:Label ID="lblPassword" runat="server" ForeColor="Red"></asp:Label>
			</td>
			<td class="auto-style1"></td>
		</tr>
		<tr>
			<td class="auto-style2">&nbsp;</td>
			<td>
				<asp:Button ID="BtnLogin" runat="server" OnClick="BtnLogin_Click" Text="Login" />
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</asp:Content>
