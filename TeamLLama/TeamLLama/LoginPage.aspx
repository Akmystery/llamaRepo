<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="TeamLLama.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
         background-image:url(images/login_bg.jpg);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container">
        <div class="content-wrap" style="margin-top:80px; box-shadow: 1px 2px 4px rgba(0, 0, 0, .5); background-color:white;">
            <div class="row justify-content-center">
            <img src="images/Login.png" style="width:100px; height:100px;" class="mt-2" />
             </div>
            <h1 class="font_style_one mt-3 text-center">Login to your Account</h1>
            <asp:TextBox ID="txtNRIC" runat="server" CssClass="form-control mt-1" placeholder="NRIC Number" Width="300px"></asp:TextBox>
            <asp:Label ID="lblNRIC" runat="server" ForeColor="Red" CssClass="ml-1 mb-1" ></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" Width="300px"></asp:TextBox>
            <asp:Label ID="lblPassword" runat="server" ForeColor="Red" CssClass="ml-1 mb-1"></asp:Label>
            <asp:Button ID="BtnLogin" runat="server" OnClick="BtnLogin_Click" Text="Login" CssClass="btn btn-primary mb-2" Width="300px" />
            </div>
        </div>
</asp:Content>
