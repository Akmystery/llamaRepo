<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="TeamLLama.AdminHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.auto-style1 {
			width: 800px;
		}
        body {
         background-image:url(images/ad_bg.jpg);
        }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container">
        
		<h2 class="text-center pt-3 pb-2 font_style_one">ADMIN CONTROL PANNEL</h2>
            <div class="row">
                <div class="col">
                    <h4 class="text-center font_style_one">Account Management</h4>
                    <div class="text-center pb-3">
                    <asp:Button ID="Button1" runat="server" Text="Create Account" OnClick="CreateDocAcc_Click" CssClass="btn btn-dark"/>
                    </div>
					<div class="text-center pb-3">
                    <asp:Button ID="Button4" runat="server" Text="Delete Account" OnClick="DeleteDocAcc_Click" CssClass="btn btn-dark"/>
                    </div>
                </div>
                <div class="col">
                    <h4 class="text-center font_style_one">Facility Management</h4>
                    <div class="text-center pb-3">
                    <asp:Button ID="Button2" runat="server" Text="Create Facility" OnClick="CreateFacility_Click" CssClass="btn btn-dark"/>
                    </div>
                    <div class="text-center pb-3">
                    <asp:Button ID="Button3" runat="server" Text="Open Facility List" OnClick="OpenFacility_Click" CssClass="btn btn-dark"/>
                    </div>
                </div>
            </div>
             </div>
</asp:Content>