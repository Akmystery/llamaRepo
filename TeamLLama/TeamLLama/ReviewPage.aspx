<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="ReviewPage.aspx.cs" Inherits="TeamLLama.ReviewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .starRating{
            width:20px;
            height:30px;
            cursor:pointer;
            background-repeat:no-repeat;
            display:block;
        }

        .FilledStars{
            background-image:url("images/FilledStar.gif");
        }
        .EmptyStars {
            background-image: url("images/Star.gif");
        }
        .WatingStars{
            background-image: url("images/WaitingStar.gif");
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <ajaxToolkit:Rating ID="Rating1" runat="server"
                StarCssClass="starRating"
                FilledStarCssClass="FilledStars"
                WaitingStarCssClass="WaitingStars"
                EmptyStarCssClass="EmptyStars"
             >
            </ajaxToolkit:Rating>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Rating:"></asp:Label>
    <asp:Label ID="lblRating" runat="server" Text="Label"></asp:Label>
</asp:Content>
