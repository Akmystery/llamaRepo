<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="UpdateFacilityPage.aspx.cs" Inherits="TeamLLama.UpdateFacilityPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.auto-style1 {
			height: 26px;
		}
		.auto-style2 {
			width: 152px;
            height: 40px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container text-center">
	<p class="font_style_one mt-3 mb-2">Update Facility Info</p>
    <p class="font_style_one mb-4" style="font-size:20px;">Please fill the fields that you want to update.</p>
    </div>
    <div class="content-wrap" style="max-width:650px;">
		<table style="width:100%;">
            <tr>
				<td class="auto-style2">Name</td>
				<td>
					
				    <asp:TextBox ID="txtName" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
			 <tr>
				<td class="auto-style2">Type</td>
				<td>
					
				    <asp:TextBox ID="txtType" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2">General Information</td>
				<td>
					
				    <asp:TextBox ID="txtGeneralInfo" runat="server" Width="280px" TextMode="multiline" Rows="5" Columns="37"></asp:TextBox>
					
				<td>&nbsp;</td>
			</tr>
            <tr>
				<td class="auto-style2">Phone Number</td>
				<td>
					
				    <asp:TextBox ID="txtPhoneNumber" runat="server" Width="280px"></asp:TextBox>
					
				<td>&nbsp;</td>
			</tr>
						<tr>
				<td class="auto-style2">OpeningHrs</td>
				<td>
					
				    <asp:TextBox ID="txtOpeningHrs" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2">ClosingHrs</td>
				<td>
					
				    <asp:TextBox ID="txtClosingHrs" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
            	<tr>
				<td class="auto-style2">Address</td>
				<td>
					
				    <asp:TextBox ID="txtAddress" runat="server" Width="280px" TextMode="multiline" Rows="2" Columns="37"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
            	<tr>
				<td class="auto-style2">Region</td>
				<td>
					
				    <asp:TextBox ID="txtRegion" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
			</tr>
            <tr>
				<td class="auto-style2">Image</td>
				<td>
					<asp:FileUpload ID="ImageUpload" runat="server" Width="280px" />
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style1"></td>
				<td>
					<asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
						<tr class="mb-5">
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
