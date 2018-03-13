<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="CreateFacility.aspx.cs" Inherits="TeamLLama.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.auto-style2 {
			width: 152px;
            height: 10px;
		}
	    .auto-style3 {
            width: 152px;
            height: 9px;
        }
        .auto-style4 {
            height: 9px;
        }
        .auto-style5 {
            height: 10px;
        }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
     <div class="container text-center">
	<h1 class="font_style_one mt-5 mb-4">Add New Facility</h1>
    </div>
    <div class="content-wrap" style="max-width:810px;">
		<table style="width:100%;">
			<tr>
				<td class="auto-style2">Facility Name</td>
				<td>
					<asp:TextBox ID="txtName" runat="server" Width="280px"></asp:TextBox>
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
				<td class="auto-style2">Facility Type</td>
				<td class="auto-style5">
					<asp:DropDownList ID="listFacility" runat="server">
                        <asp:ListItem>Government Hospital</asp:ListItem>
                        <asp:ListItem>PolyClinic</asp:ListItem>
                        <asp:ListItem>Hospital</asp:ListItem>
                        <asp:ListItem>Clinic</asp:ListItem>
                        <asp:ListItem>Phermancy</asp:ListItem>
                    </asp:DropDownList>
				</td>
				<td class="auto-style5"></td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblType" runat="server" ForeColor="Red"  Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2">General Information</td>
				<td>
					<asp:TextBox ID="txtInfo" runat="server" TextMode="multiline" Columns="37" Rows="5"></asp:TextBox>
                    </td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblInfo" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2">Phone Number</td>
				<td>
					<asp:TextBox ID="txtPhoneNumber"  runat="server" Width="280px"></asp:TextBox>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblPhoneNumber" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>

						<tr>
				<td class="auto-style2">Opening Hour</td>
				<td>
					<asp:TextBox ID="txtOpening" runat="server" Width="280px"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblOpening" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
						<tr>
				<td class="auto-style2">Closing Hour</td>
				<td>
					<asp:TextBox ID="txtClosing" runat="server" Width="280px"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblClosing" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
            		<tr>
				<td class="auto-style2">Address</td>
				<td>
					<asp:TextBox ID="txtAddress" runat="server" Width="280px"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style3"></td>
				<td class="auto-style4">
					<asp:Label ID="lblAddress" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
            		<tr>
				<td class="auto-style2">Region</td>
				<td>
					<asp:TextBox ID="txtRegion" runat="server" Width="280px"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblRegion" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
						<tr>
				<td class="auto-style2">Facility Image</td>
				<td>
					<asp:FileUpload ID="ImageUpload" runat="server" Width="280px" />
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
					<asp:Button ID="btnCreate" runat="server" OnClick="Create_Click" Text="Create" />
				</td>
				<td>&nbsp;</td>
			</tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
		</table>
        </div>
</asp:Content>
