<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="TeamLLama.AdminHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.auto-style1 {
			width: 800px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container text-center mt-5">
    <img src="images/logo.png" width="100px" height="100px" style="border-radius:50%" />
    <h3 class="font_style_one mt-2">DOCTOR LLAMA</h3>
    </div>
    <div class="content-wrap">
        
		<h2>ADMIN HOME PAGE</h2>
			<table style="width:100%;">
			<tr>
				<td class="auto-style1">
					<asp:Button ID="CreateAcc" runat="server" Text="Create Account" OnClick="CreateDocAcc_Click"/>
				</td>
				<td>
					<asp:Button ID="CreateFacility" runat="server" Text="Create Facility" OnClick="CreateFAcility_Click"/>
				</td>
			</tr>
			<tr>
				<td class="auto-style1">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			</table>
		




    </div>
</asp:Content>