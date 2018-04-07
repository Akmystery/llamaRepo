<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="AdminCreateAccPage.aspx.cs" Inherits="TeamLLama.AdminCreateAccPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.auto-style2 {
			width: 200px;
            height: 10px;
		}
        .font_style_two {
            font-family: 'Karma', serif;
            font-weight: 500;
            font-size: 20px;
        }
        body{
            background-image:url(images/ad_bg.jpg);
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
    <div class="content-wrap mt-5 mb-4 " style="max-width:700px;  box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);  background-color:white;">
        <h1 class="font_style_one mt-3 text-center">Create Doctor Account</h1>
		<table style="width:100%;">
			<tr>
				<td class="auto-style2 font_style_two">Image</td>
				<td>
                    <img id="imgpreview" height="170" width="170" src="" style="border-width:0px; margin-bottom:10px; visibility: hidden;" />
					<asp:FileUpload ID="ImageUpload" runat="server" Width="280px" onchange="showpreview(this);"/>
				</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="auto-style2 font_style_two">Name</td>
				<td>
					<asp:TextBox ID="txtName" runat="server" Width="280px" CssClass="form-control"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblName" runat="server" ForeColor="Red"></asp:Label>
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
					<asp:Label ID="lblNric" runat="server" ForeColor="Red"  Text=""></asp:Label>
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
					<asp:Label ID="lblPassword" runat="server" ForeColor="Red"></asp:Label>
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
					<asp:Label ID="lblConfirmPassword" runat="server" ForeColor="Red"></asp:Label>
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
					<asp:Label ID="lblEmail" runat="server" ForeColor="Red"></asp:Label>
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
					<asp:Label ID="lblAddress" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>
						
			
			<tr>
				<td class="auto-style2 font_style_two">Department</td>
				<td>
					<asp:DropDownList ID="DepartmentDropDownList" DataTextField = "department_name" DataValueField = "department_id" runat="server" CssClass="form-control" Width="280px">

					</asp:DropDownList>
				</td>
			</tr>
			<tr>
				<td class="auto-style2"></td>
				<td>
					<asp:Label ID="lblDepartment" runat="server" ForeColor="Red"></asp:Label>
				</td>
			</tr>

			
			<tr>
				<td class="auto-style2">&nbsp;</td>
				<td>
					<asp:Button ID="Button3" runat="server" Text="Create" OnClick="CreatrDocAcc_Click" CssClass="btn btn-dark float-right mr-3" Width="100px" />
				</td>
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
