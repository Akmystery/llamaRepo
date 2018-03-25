<%@ Page Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="PlanTransportation.aspx.cs" Inherits="TeamLLama.PlanTransportation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
	<div class="container">
<iframe
    style="width:100%; height:80vh; border:0;"
  frameborder="0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDdMdOD2kYXSIbHKV_EzFh15E5Hxo0UsQA&q=<%= Request.QueryString["p"] %>" allowfullscreen>
</iframe>
    </div>
</asp:Content>
