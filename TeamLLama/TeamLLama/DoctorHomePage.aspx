<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="DoctorHomePage.aspx.cs" Inherits="TeamLLama.DoctorHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }

        .auto-style2 {
            width: 89px;
        }

        .auto-style3 {
            height: 26px;
            width: 89px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <!--<div class="container text-center mt-5">
    <img src="images/logo.png" width="100px" height="100px" style="border-radius:50%" />
    <h3 class="font_style_one mt-2">DOCTOR LLAMA</h3>
    </div>
    <div class="content-wrap">-->
    <div class="container">
        <h2>DOCTOR HOME PAGE</h2>
        <div class="row">
            <div class="col">
                <p class="text-center font_style_one" style="font-size: 20px;">Appointment Management</p>
                <div class="text-center pb-3">
                    <asp:Button ID="btnPick" runat="server" Text="Pick Appointment" OnClick="btnPick_Click" />
                </div>
                <div class="text-center pb-3">
                    <asp:Button ID="btnView" runat="server" Text="View Appointment" OnClick="btnView_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
