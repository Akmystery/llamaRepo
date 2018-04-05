<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="TeamLLama.CreateAccount"  %>
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
	<h1 class="font_style_one mt-5 mb-4">Create Your Account</h1>
    </div>
    <div class="content-wrap" style="max-width:810px;">
		<table style="width:100%;">
            	<tr>
				<td class="auto-style2">Image</td>
				<td>
                    <img id="imgpreview" height="170" width="170" src="" style="border-width:0px; margin-bottom:10px; visibility: hidden;" />
					<asp:FileUpload ID="ImageUpload" runat="server" Width="280px" onchange="showpreview(this);" />
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
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblName" runat="server" ForeColor="Red"></asp:Label>
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
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblNric" runat="server" ForeColor="Red"  Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2">Password</td>
				<td>
					<asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="280px"></asp:TextBox>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblPassword" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2">Confirm Password</td>
				<td>
					<asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" Width="280px"></asp:TextBox>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblConfirmPassword" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>

						<tr>
				<td class="auto-style2">Email</td>
				<td>
					<asp:TextBox ID="txtEmail" runat="server" Width="280px"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblEmail" runat="server" ForeColor="Red"></asp:Label>
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
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblAddress" runat="server" ForeColor="Red"></asp:Label>
				</td>
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
					<asp:Button ID="Button2" runat="server" OnClick="create_Click" Text="Register" />
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
        </div>
		</asp:Content>
