<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="ReviewTempaspx.aspx.cs" Inherits="TeamLLama.ReviewTempaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.auto-style1 {
			height: 26px;
		}
		.auto-style2 {
			width: 152px;
            height: 10px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container text-center">
	<h1 class="font_style_one mt-5 mb-4">Create Doctor Account</h1>
    </div>
    <div class="content-wrap" style="max-width:810px;">
		<table style="width:100%;">
			<tr>
				<td class="auto-style2">Comment :</td>
				<td>
					<asp:TextBox ID="txtComment" TextMode="multiline" Columns="50" Rows="5"  runat="server"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblComment" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
		
			<tr>
				<td class="auto-style2">&nbsp;</td>
				<td>
					<asp:Button ID="Button3" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
				</td>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>

		</table>
        </div>
		</asp:Content>
