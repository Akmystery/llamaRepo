<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="UpdateAccountPage.aspx.cs" Inherits="TeamLLama.UpdateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
			width: 152px;
            height: 10px;
		}
		.auto-style2 {
			width: 152px;
            height: 50px;
            margin-top: 10px;
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
    <div class="container text-center">
	<p class="font_style_one mt-5 mb-2">Update Account Info</p>
    <p class="font_style_one mb-4" style="font-size:20px;">Please fill the fields that you want to update.</p>
    </div>
    <div class="content-wrap" style="max-width:900px;">
		<table style="width:100%;">
            <tr>
				<td class="auto-style2">Profile Picture</td>
				<td>
                    <img id="imgpreview" height="170" width="170" src="" style="border-width:0px; margin-bottom:10px; visibility: hidden;" />
					<asp:FileUpload ID="ImageUpload" runat="server" Width="280px" onchange="showpreview(this);"/>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style1"></td>
				<td>
					<asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
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
					
				    <asp:TextBox ID="txtPassword" runat="server" Width="280px" TextMode="Password"></asp:TextBox>
					
				<td>&nbsp;</td>
			</tr>
            <tr>
				<td class="auto-style2">Confirm Password</td>
				<td>
					
				    <asp:TextBox ID="txtConfirmPassword" runat="server" Width="280px" TextMode="Password"></asp:TextBox>
					
				<td><asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match!" ForeColor="Red"></asp:CompareValidator></td>
			</tr>

						<tr>
				<td class="auto-style2">Email</td>
				<td>
					
				    <asp:TextBox ID="txtEmail" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td> <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                         ControlToValidate="txtEmail" ErrorMessage="Invalid email address format" 
                         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator></td>
			</tr>
			<tr>
				<td class="auto-style2">Address</td>
				<td>
					
				    <asp:TextBox ID="txtAddress" runat="server" Width="280px"></asp:TextBox>
					
				</td>
				<td>&nbsp;</td>
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
