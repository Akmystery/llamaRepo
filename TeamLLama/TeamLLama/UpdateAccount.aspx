<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="UpdateAccount.aspx.cs" Inherits="TeamLLama.UpdateAccount" %>
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
	<h1 class="font_style_one mt-5 mb-4">Update Account Info</h1>
    </div>
    <div class="content-wrap" style="max-width:810px;">
		<table style="width:100%;">
            <tr>
				<td class="auto-style2">NRIC</td>
				<td>
					
				    <asp:TextBox ID="txtNric" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2">Name</td>
				<td>
					
				    <asp:TextBox ID="txtName" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2">Password</td>
				<td>
					
				    <asp:TextBox ID="txtPassword" runat="server" Width="280px"></asp:TextBox>
					
				<td>&nbsp;</td>
			</tr>
            <tr>
				<td class="auto-style2">Confirm Password</td>
				<td>
					
				    <asp:TextBox ID="txtConfirmPassword" runat="server" Width="280px"></asp:TextBox>
					
				<td>&nbsp;</td>
			</tr>
						<tr>
				<td class="auto-style2">Email</td>
				<td>
					
				    <asp:TextBox ID="txtEmail" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2">Address</td>
				<td>
					
				    <asp:TextBox ID="txtAddress" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
						<tr>
				<td>
				    <asp:Button ID="updateButton" runat="server" OnClick="UpDate_Click" Text="Update" />
				</td>
                            <td></td>
                 <td>
				     &nbsp;</td>
			</tr>
		</table>
        </div>
</asp:Content>
