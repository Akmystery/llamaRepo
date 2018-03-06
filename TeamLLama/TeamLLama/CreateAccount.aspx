<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="TeamLLama.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<style type="text/css">
		.auto-style1 {
			height: 23px;
		}
		.auto-style2 {
			height: 23px;
			width: 115px;
		}
		.auto-style3 {
			width: 115px;
		}
	</style>
</head>
<body>
    <form id="form2" runat="server">
		<table style="width:100%;">
			<tr>
				<td class="auto-style2">Please Insert:</td>
				<td class="auto-style1"></td>
				<td class="auto-style1"></td>
			</tr>
			<tr>
				<td class="auto-style3">Name</td>
				<td>
					<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<asp:Label ID="lblName" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style3">NRIC</td>
				<td>
					<asp:TextBox ID="txtNric" runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<asp:Label ID="lblNric" runat="server" ForeColor="Red"  Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style3">Password</td>
				<td>
					<asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<asp:Label ID="lblPassword" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style3">Confirm Password</td>
				<td>
					<asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server"></asp:TextBox>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<asp:Label ID="lblConfirmPassword" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>

						<tr>
				<td class="auto-style3">Email</td>
				<td>
					<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<asp:Label ID="lblEmail" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
						<tr>
				<td class="auto-style3">Address</td>
				<td>
					<asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<asp:Label ID="lblAddress" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
						<tr>
				<td class="auto-style3">Image</td>
				<td>
					<asp:TextBox ID="txtImage" runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>

						<tr>
				<td class="auto-style3">&nbsp;</td>
				<td>
					<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
</html>
