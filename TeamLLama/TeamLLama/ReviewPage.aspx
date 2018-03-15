<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="ReviewPage.aspx.cs" Inherits="TeamLLama.ReviewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .starRating{
            width:20px;
            height:17px;
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
    <asp:Label ID="Label1" runat="server" Text="Rating:"></asp:Label>
    <asp:Label ID="lblRating" runat="server" Text="Label"></asp:Label>
     <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Label ID="Label2" runat="server" Text="Your Rating:"></asp:Label>
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
    <asp:TextBox ID="txtComment" TextMode="multiline" Columns="50" Rows="2"  runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblComment" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
    <br />
    <asp:Label ID="lblsth" runat="server" Text="Comments:"></asp:Label>
    <asp:Repeater ID="Comments" runat="server">
        <ItemTemplate>
            <hr />
            <asp:Label ID="Label3" runat="server" Text="Rating:"></asp:Label>
            <ajaxToolkit:Rating ID="Rating2" runat="server"
                StarCssClass="starRating"
                FilledStarCssClass="FilledStars"
                WaitingStarCssClass="WaitingStars"
                EmptyStarCssClass="EmptyStars"
                ReadOnly="true"
                CurrentRating='<%# Eval("rating") %>'
             >
            </ajaxToolkit:Rating>
             <br />
            <asp:Label ID="lblComment" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
        </ItemTemplate>
    </asp:Repeater>
    <br />
   
    
</asp:Content>
