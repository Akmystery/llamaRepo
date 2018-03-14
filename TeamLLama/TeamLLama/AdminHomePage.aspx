<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="TeamLLama.AdminHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.auto-style1 {
			width: 800px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container">
        
		<h2 class="text-center pt-3 pb-2 font_style_one">ADMIN HOME PAGE</h2>
            <div class="row">
                <div class="col">
                    <p class="text-center font_style_one" style="font-size:20px;">Account Management</p>
                    <div class="text-center pb-3">
                    <asp:Button ID="Button1" runat="server" Text="Create Account" OnClick="CreateDocAcc_Click"/>
                    </div>
					<div class="text-center pb-3">
                    <asp:Button ID="Button4" runat="server" Text="Delete Account" OnClick="DeleteDocAcc_Click"/>
                    </div>
                </div>
                <div class="col">
                    <p class="text-center font_style_one" style="font-size:20px;">Facility Management</p>
                    <div class="text-center pb-3">
                    <asp:Button ID="Button2" runat="server" Text="Create Facility" OnClick="CreateFacility_Click"/>
                    </div>
                    <div class="text-center pb-3">
                    <asp:Button ID="Button3" runat="server" Text="Open Facility List" OnClick="OpenFacility_Click"/>
                    </div>
                </div>

            </div>
    </div>
</asp:Content>