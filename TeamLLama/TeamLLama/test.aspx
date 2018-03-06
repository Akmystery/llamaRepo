<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="TeamLLama.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="appointmentID:"></asp:Label>
            <asp:Label ID="appointmentLabel" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="accountID:"></asp:Label>
            <asp:Label ID="accountLabel" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="facilityID:"></asp:Label>
            <asp:Label ID="facilityLabel" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" Text="departmentID:"></asp:Label>
            <asp:Label ID="departmentLabel" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Time:"></asp:Label>
            <asp:Label ID="timeLabel" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Date:"></asp:Label>
            <asp:Label ID="dateLabel" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Taken:"></asp:Label>
            <asp:Label ID="takenLabel" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
