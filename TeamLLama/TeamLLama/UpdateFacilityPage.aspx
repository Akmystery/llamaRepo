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
		<table style="width: 100%;">
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
                    <asp:Label ID="lblType" runat="server" ForeColor="Red" Text=""></asp:Label>
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
                    <asp:TextBox ID="txtPhoneNumber" runat="server" Width="280px"></asp:TextBox>
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
                    <asp:TextBox ID="txtOpeninghr" runat="server" Width="56px"></asp:TextBox> hr
					<asp:TextBox ID="txtOpeningmin" runat="server" Width="56px"></asp:TextBox> min
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
                    <asp:TextBox ID="txtClosinghr" runat="server" Width="56px"></asp:TextBox>
					<asp:TextBox ID="txtClosingmin" runat="server" Width="56px"></asp:TextBox> min
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
                    <asp:TextBox ID="txtAddress" runat="server" Width="280px" TextMode="MultiLine"></asp:TextBox>
                    <asp:Label ID="lblSelectedX" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="lblSelectedY" runat="server" Text="" Visible="false"></asp:Label>
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
                <td class="auto-style2">Add new departments</td>
                <td>

					<asp:CheckBoxList runat="server" ID="UpdateDepartmentList" Width="350px" Height="350px" CssClass="form-control">
						<asp:ListItem Value="Anaesthesiology">&nbsp Anaesthesiology</asp:ListItem>
						<asp:ListItem Value="Cardiology">&nbsp Cardiology</asp:ListItem>
						<asp:ListItem Value="Colorectal">&nbsp Colorectal</asp:ListItem>
						<asp:ListItem Value="Dermatology">&nbsp Dermatology</asp:ListItem>
						<asp:ListItem Value="ER">&nbsp ER</asp:ListItem>
						<asp:ListItem Value="Neuro">&nbsp Neuro</asp:ListItem>
						<asp:ListItem Value="Orthopaedic">&nbsp Orthopaedic</asp:ListItem>
						<asp:ListItem Value="Psychiatry">&nbsp Psychiatry</asp:ListItem>
						<asp:ListItem Value="Urology">&nbsp Urology</asp:ListItem>
						<asp:ListItem Value="X Ray">&nbsp X Ray</asp:ListItem>
					</asp:CheckBoxList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblDepartmentList" runat="server" ForeColor="Red"></asp:Label>
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
