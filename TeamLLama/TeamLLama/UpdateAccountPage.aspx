<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="UpdateAccountPage.aspx.cs" Inherits="TeamLLama.UpdateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.auto-style2 {
			width: 200px;
            height: 50px;
            margin-top: 10px;
		}

        body{
            background-image:url(images/update_bg.jpg);
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
    <div class="content-wrap mt-5 mb-5" style="max-width:700px; box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);  background-color:white;">
        <p class="font_style_one mt-1 mb-2 text-center">Update Account Info</p>
        <p class="font_style_one mb-4 text-center" style="font-size:20px;">Please fill the fields that you want to update.</p>
		<table style="width:100%;">
            <tr>
				<td class="auto-style2 font_style_two">Profile Picture</td>
				<td>
                    <img id="imgpreview" height="170" width="170" src="" style="border-width:0px; margin-bottom:10px; visibility: hidden;" />
					<asp:FileUpload ID="ImageUpload" runat="server" Width="280px" onchange="showpreview(this);"/>
				</td>
			</tr>
			<tr>
				<td class="auto-style1"></td>
				<td>
					<asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
            <tr>
				<td class="auto-style2 font_style_two">NRIC</td>
				<td>
					
				    <asp:TextBox ID="txtNric" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
					
				</td>
			</tr>
			<tr>
				<td class="auto-style2 font_style_two">Name</td>
				<td>
					
				    <asp:TextBox ID="txtName" runat="server" Width="280px"  CssClass="form-control"></asp:TextBox>
					
				</td>
			</tr>
			<tr>
				<td class="auto-style2 font_style_two">Password</td>
				<td>
					
				    <asp:TextBox ID="txtPassword" runat="server" Width="280px" TextMode="Password"  CssClass="form-control"></asp:TextBox>
				</td>
			</tr>
            <tr>
				<td class="auto-style2 font_style_two">Confirm Password</td>
				<td>
					
				    <asp:TextBox ID="txtConfirmPassword" runat="server" Width="280px" TextMode="Password"  CssClass="form-control"></asp:TextBox>
				</td>
			</tr>
            <tr>
                <td></td>
                <td><asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match!" ForeColor="Red"></asp:CompareValidator></td>
            </tr>
            <tr>
				<td class="auto-style2 font_style_two">Email</td>
				<td>
					
				    <asp:TextBox ID="txtEmail" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
					
				</td>
			</tr>
            <tr>
                <td></td>
                <td> <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                         ControlToValidate="txtEmail" ErrorMessage="Invalid email address format" 
                         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator></td>
            </tr>
			<tr>
				<td class="auto-style2 font_style_two">Address</td>
				<td>
					
				    <asp:TextBox ID="txtAddress" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
					
				</td>
			</tr>
			<tr class="mb-5">
                <td></td>
				<td>
				    <asp:Button ID="updateButton" runat="server" OnClick="UpDate_Click" Text="Update" CssClass="mb-2 mt-3 btn btn-primary" Width="250px" />
				</td>
                            
			</tr>
		</table>
        </div>
</asp:Content>
