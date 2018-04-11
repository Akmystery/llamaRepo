<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="UpdateFacilityPage.aspx.cs" Inherits="TeamLLama.UpdateFacilityPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.auto-style2 {
			width: 300px;
            height: 40px;
		}
        body{
            background-image:url(images/ad_bg.jpg);
        }
        .font_style_two {
            font-family: 'Karma', serif;
            font-weight: 500;
            font-size: 20px;
        }
	</style>
        <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function showpreview(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgpreview').css('visibility', 'visible');
                    $('#imgpreview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="content-wrap mt-4 mb-5" style="max-width:750px; box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);background-color:white;">
        	<p class="font_style_one mt-3 mb-2 text-center">Update Facility Info</p>
            <p class="font_style_one mb-4 text-center" style="font-size:20px;">Please fill the fields that you want to update.</p>
		<table style="width: 100%;">
			<tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Facility Name</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Facility Type</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="listFacility" runat="server" CssClass="form-control">
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
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">General Information</td>
                <td>
                    <asp:TextBox ID="txtInfo" runat="server" TextMode="multiline" Columns="37" Rows="5" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Phone Number</td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Opening Hour</td>
                <td>
					<asp:DropDownList ID="UpdateOpeninghr" runat="server" CssClass="form-control" Width="350px">
						<asp:ListItem>00:00</asp:ListItem>
                        <asp:ListItem>00:30</asp:ListItem>
						<asp:ListItem>01:00</asp:ListItem>
						<asp:ListItem>01:30</asp:ListItem>
                        <asp:ListItem>02:00</asp:ListItem>
						<asp:ListItem>02:30</asp:ListItem>
                        <asp:ListItem>03:00</asp:ListItem>
						<asp:ListItem>03:30</asp:ListItem>
                        <asp:ListItem>04:00</asp:ListItem>
						<asp:ListItem>04:30</asp:ListItem>
                        <asp:ListItem>05:00</asp:ListItem>
						<asp:ListItem>05:30</asp:ListItem>
						<asp:ListItem>06:00</asp:ListItem>
						<asp:ListItem>06:30</asp:ListItem>
						<asp:ListItem>07:00</asp:ListItem>
						<asp:ListItem>07:30</asp:ListItem>
						<asp:ListItem>08:00</asp:ListItem>
						<asp:ListItem>08:30</asp:ListItem>
						<asp:ListItem>09:00</asp:ListItem>
						<asp:ListItem>09:30</asp:ListItem>
						<asp:ListItem>10:00</asp:ListItem>
						<asp:ListItem>10:30</asp:ListItem>
						<asp:ListItem>11:00</asp:ListItem>
						<asp:ListItem>11:30</asp:ListItem>
						<asp:ListItem>12:00</asp:ListItem>
						<asp:ListItem>12:30</asp:ListItem>
						<asp:ListItem>13:00</asp:ListItem>
						<asp:ListItem>13:30</asp:ListItem>
						<asp:ListItem>14:00</asp:ListItem>
						<asp:ListItem>14:30</asp:ListItem>
						<asp:ListItem>15:00</asp:ListItem>
						<asp:ListItem>15:30</asp:ListItem>
						<asp:ListItem>16:00</asp:ListItem>
						<asp:ListItem>16:30</asp:ListItem>
						<asp:ListItem>17:00</asp:ListItem>
						<asp:ListItem>17:30</asp:ListItem>
						<asp:ListItem>18:00</asp:ListItem>
						<asp:ListItem>18:30</asp:ListItem>
						<asp:ListItem>19:00</asp:ListItem>
						<asp:ListItem>19:30</asp:ListItem>
						<asp:ListItem>20:00</asp:ListItem>
						<asp:ListItem>20:30</asp:ListItem>
						<asp:ListItem>21:00</asp:ListItem>
						<asp:ListItem>21:30</asp:ListItem>
						<asp:ListItem>22:00</asp:ListItem>
						<asp:ListItem>22:30</asp:ListItem>
						<asp:ListItem>23:00</asp:ListItem>
						<asp:ListItem>23:30</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Closing Hour</td>
                <td>
                    <asp:DropDownList ID="UpdateClosinghr" runat="server" CssClass="form-control" Width="350px">
						<asp:ListItem>00:00</asp:ListItem>
                        <asp:ListItem>00:30</asp:ListItem>
						<asp:ListItem>01:00</asp:ListItem>
						<asp:ListItem>01:30</asp:ListItem>
                        <asp:ListItem>02:00</asp:ListItem>
						<asp:ListItem>02:30</asp:ListItem>
                        <asp:ListItem>03:00</asp:ListItem>
						<asp:ListItem>03:30</asp:ListItem>
                        <asp:ListItem>04:00</asp:ListItem>
						<asp:ListItem>04:30</asp:ListItem>
                        <asp:ListItem>05:00</asp:ListItem>
						<asp:ListItem>05:30</asp:ListItem>
						<asp:ListItem>06:00</asp:ListItem>
						<asp:ListItem>06:30</asp:ListItem>
						<asp:ListItem>07:00</asp:ListItem>
						<asp:ListItem>07:30</asp:ListItem>
						<asp:ListItem>08:00</asp:ListItem>
						<asp:ListItem>08:30</asp:ListItem>
						<asp:ListItem>09:00</asp:ListItem>
						<asp:ListItem>09:30</asp:ListItem>
						<asp:ListItem>10:00</asp:ListItem>
						<asp:ListItem>10:30</asp:ListItem>
						<asp:ListItem>11:00</asp:ListItem>
						<asp:ListItem>11:30</asp:ListItem>
						<asp:ListItem>12:00</asp:ListItem>
						<asp:ListItem>12:30</asp:ListItem>
						<asp:ListItem>13:00</asp:ListItem>
						<asp:ListItem>13:30</asp:ListItem>
						<asp:ListItem>14:00</asp:ListItem>
						<asp:ListItem>14:30</asp:ListItem>
						<asp:ListItem>15:00</asp:ListItem>
						<asp:ListItem>15:30</asp:ListItem>
						<asp:ListItem>16:00</asp:ListItem>
						<asp:ListItem>16:30</asp:ListItem>
						<asp:ListItem>17:00</asp:ListItem>
						<asp:ListItem>17:30</asp:ListItem>
						<asp:ListItem>18:00</asp:ListItem>
						<asp:ListItem>18:30</asp:ListItem>
						<asp:ListItem>19:00</asp:ListItem>
						<asp:ListItem>19:30</asp:ListItem>
						<asp:ListItem>20:00</asp:ListItem>
						<asp:ListItem>20:30</asp:ListItem>
						<asp:ListItem>21:00</asp:ListItem>
						<asp:ListItem>21:30</asp:ListItem>
						<asp:ListItem>22:00</asp:ListItem>
						<asp:ListItem>22:30</asp:ListItem>
						<asp:ListItem>23:00</asp:ListItem>
						<asp:ListItem>23:30</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Address</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Width="280px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lblSelectedX" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="lblSelectedY" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Region</td>
                <td>
                    <asp:TextBox ID="txtRegion" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
			<tr>
                <td class="auto-style2 font_style_two">Add new departments</td>
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
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Facility Image</td>
                <td>
                    <p class="font_style_two" style="font-size:12px">Maximum Profile Picture size is 720x480 pixels.</p>
                    <img id="imgpreview" height="250" width="300" src="" style="border-width:0px; margin-bottom:10px; visibility: hidden;" />
                    <asp:FileUpload ID="ImageUpload" runat="server" Width="280px" onchange="showpreview(this);"/>
                </td>
            </tr>
            
						<tr class="mb-5">
				<td>
				</td>
                            <td><asp:Button ID="updateButton" runat="server" OnClick="UpDate_Click" Text="Update" CssClass="btn btn-dark mb-2 float-right" Width="100px"/></td>
			</tr>
		</table>
        </div>
</asp:Content>
