<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="TeamLLama.CreateAccount"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.auto-style1 {
			height: 26px;
		}
		.auto-style2 {
			width: 152px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
	<h1>Welcome to Signup page</h1>
		<table style="width:100%;">
			<tr>
				<td class="auto-style2">Please Insert:</td>
				<td class="auto-style1"></td>
				<td class="auto-style1"></td>
			</tr>
			<tr>
				<td class="auto-style2">Name</td>
				<td>
					<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblName" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2">NRIC</td>
				<td>
					<asp:TextBox ID="txtNric" runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblNric" runat="server" ForeColor="Red"  Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2">Password</td>
				<td>
					<asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblPassword" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2">Confirm Password</td>
				<td>
					<asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server"></asp:TextBox>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblConfirmPassword" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>

						<tr>
				<td class="auto-style2">Email</td>
				<td>
					<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblEmail" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
						<tr>
				<td class="auto-style2">Address</td>
				<td>
					<asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblAddress" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
						<tr>
				<td class="auto-style2">Image</td>
				<td>
					<asp:FileUpload ID="ImageUpload" runat="server" />
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>

						<tr>
				<td class="auto-style2">&nbsp;</td>
				<td>
					<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Create" />
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		</asp:Content>
