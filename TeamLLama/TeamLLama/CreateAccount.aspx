<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="TeamLLama.CreateAccount"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.auto-style2 {
			width: 200px;
            height: 10px;
		}
        body{
            background-image:url(images/login_bg.jpg);
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
    <div class="content-wrap mb-5 mt-5" style="max-width:700px; background-color:white;box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);">
        <h1 class="font_style_one mb-3 mt-2 text-center">Create Your Account</h1>
		<table style="width:100%;">
            	<tr>
				<td class="auto-style2 font_style_two" style="padding-top:210px;">Image</td>
				<td>
                    <p class="font_style_two" style="font-size:12px">Maximum Profile Picture size is 500x300 pixels.</p>
                    <img id="imgpreview" height="170" width="170" src="images/Default.jpg" style="border-width:0px; margin-bottom:10px;" class="border" />
					<asp:FileUpload ID="ImageUpload" runat="server" Width="280px" onchange="showpreview(this);" />
				</td>
			</tr>
			<tr>
				<td class="auto-style2 font_style_two">Name</td>
				<td>
					<asp:TextBox ID="txtName" runat="server" Width="280px" CssClass="form-control mt-1"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblName" runat="server" ForeColor="Red" CssClass="mt-1"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2 font_style_two">NRIC</td>
				<td>
					<asp:TextBox ID="txtNric" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblNric" runat="server" ForeColor="Red"  Text="" CssClass="mt-1"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2 font_style_two">Password</td>
				<td>
					<asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
                    </td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblPassword" runat="server" ForeColor="Red" CssClass="mt-1"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2 font_style_two">Confirm Password</td>
				<td>
					<asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
			    </td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblConfirmPassword" runat="server" ForeColor="Red" CssClass="mt-1"></asp:Label>
				</td>
			</tr>

						<tr>
				<td class="auto-style2 font_style_two">Email</td>
				<td>
					<asp:TextBox ID="txtEmail" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblEmail" runat="server" ForeColor="Red" CssClass="mt-1"></asp:Label>
				</td>
			</tr>
						<tr>
				<td class="auto-style2 font_style_two">Address</td>
				<td>
					<asp:TextBox ID="txtAddress" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblAddress" runat="server" ForeColor="Red" CssClass="mt-1"></asp:Label>
				</td>
			</tr>
					
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblImage" runat="server" ForeColor="Red" CssClass="mt-1"></asp:Label>
				</td>
			</tr>

			<tr>
				<td></td>
				<td><asp:Button ID="Button2" runat="server" OnClick="create_Click" Text="Register" CssClass="btn btn-primary mb-1 ml-5" Width="200px" /></td>
			</tr>
		</table>
        </div>
		</asp:Content>
