<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page.Master" AutoEventWireup="true" CodeBehind="CreateFacility.aspx.cs" Inherits="TeamLLama.WebForm3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 220px;
            height: 10px;
        }

        .auto-style3 {
            width: 152px;
            height: 9px;
        }

        .auto-style4 {
            height: 9px;
        }

        .auto-style5 {
            height: 10px;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup1 {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: auto;
            height: auto;
        }

        .font_style_two {
            font-family: 'Karma', serif;
            font-weight: 500;
            font-size: 20px;
        }

        body {
            background-image: url(images/ad_bg.jpg);
        }

        .GridPager a, .GridPager span {
            display: block;
            height: 30px;
            width: 35px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
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
    <div class="content-wrap  mt-5 mb-4" style="max-width: 800px; box-shadow: 1px 2px 4px rgba(0, 0, 0, .5); background-color: white;">
        <h1 class="font_style_one mt-3 mb-4 text-center">Add New Facility</h1>
        <table style="width: 100%;">
			<tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblImage" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Facility Name</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="280px" CssClass="form-control d-inline"></asp:TextBox>
                    <asp:Button ID="bn_search" runat="server" Text="Search" OnClick="bn_search_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblName" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Facility Type</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="listFacility" runat="server" CssClass="form-control" Width="350px">
                        <asp:ListItem>Government Hospital</asp:ListItem>
                        <asp:ListItem>PolyClinic</asp:ListItem>
                        <asp:ListItem>Hospital</asp:ListItem>
                        <asp:ListItem>Clinic</asp:ListItem>
                        <asp:ListItem>Phermancy</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblType" runat="server" ForeColor="Red" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">General Information</td>
                <td>
                    <asp:TextBox ID="txtInfo" runat="server" TextMode="multiline" Columns="37" Rows="5" CssClass="form-control" Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblInfo" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Phone Number</td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" Width="350px" CssClass="form-control"></asp:TextBox>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblPhoneNumber" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="auto-style2 font_style_two">Opening Hour</td>
                <td>
					<asp:DropDownList ID="txtOpeninghr" runat="server" CssClass="form-control" Width="350px">
						<asp:ListItem>00:00</asp:ListItem>
                        <asp:ListItem>00:30</asp:ListItem>
						<asp:ListItem>01:00</asp:ListItem>
						<asp:ListItem>01:30</asp:ListItem>
                        <asp:ListItem>02:00</asp:ListItem>
						<asp:ListItem>02:30</asp:ListItem>
                        <asp:ListItem>03:00</asp:ListItem>
						<asp:ListItem>03:30</asp:ListItem>
                        <asp:ListItem>04:00</asp:ListItem>
						<asp:ListItem>04:30</asp:ListItem>
                        <asp:ListItem>05:00</asp:ListItem>
						<asp:ListItem>05:30</asp:ListItem>
						<asp:ListItem>06:00</asp:ListItem>
						<asp:ListItem>06:30</asp:ListItem>
						<asp:ListItem>07:00</asp:ListItem>
						<asp:ListItem>07:30</asp:ListItem>
						<asp:ListItem>08:00</asp:ListItem>
						<asp:ListItem>08:30</asp:ListItem>
						<asp:ListItem>09:00</asp:ListItem>
						<asp:ListItem>09:30</asp:ListItem>
						<asp:ListItem>10:00</asp:ListItem>
						<asp:ListItem>10:30</asp:ListItem>
						<asp:ListItem>11:00</asp:ListItem>
						<asp:ListItem>11:30</asp:ListItem>
						<asp:ListItem>12:00</asp:ListItem>
						<asp:ListItem>12:30</asp:ListItem>
						<asp:ListItem>13:00</asp:ListItem>
						<asp:ListItem>13:30</asp:ListItem>
						<asp:ListItem>14:00</asp:ListItem>
						<asp:ListItem>14:30</asp:ListItem>
						<asp:ListItem>15:00</asp:ListItem>
						<asp:ListItem>15:30</asp:ListItem>
						<asp:ListItem>16:00</asp:ListItem>
						<asp:ListItem>16:30</asp:ListItem>
						<asp:ListItem>17:00</asp:ListItem>
						<asp:ListItem>17:30</asp:ListItem>
						<asp:ListItem>18:00</asp:ListItem>
						<asp:ListItem>18:30</asp:ListItem>
						<asp:ListItem>19:00</asp:ListItem>
						<asp:ListItem>19:30</asp:ListItem>
						<asp:ListItem>20:00</asp:ListItem>
						<asp:ListItem>20:30</asp:ListItem>
						<asp:ListItem>21:00</asp:ListItem>
						<asp:ListItem>21:30</asp:ListItem>
						<asp:ListItem>22:00</asp:ListItem>
						<asp:ListItem>22:30</asp:ListItem>
						<asp:ListItem>23:00</asp:ListItem>
						<asp:ListItem>23:30</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblOpening" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Closing Hour</td>
                <td>
                    <asp:DropDownList ID="txtClosinghr" runat="server" CssClass="form-control" Width="350px">
						<asp:ListItem>00:00</asp:ListItem>
                        <asp:ListItem>00:30</asp:ListItem>
						<asp:ListItem>01:00</asp:ListItem>
						<asp:ListItem>01:30</asp:ListItem>
                        <asp:ListItem>02:00</asp:ListItem>
						<asp:ListItem>02:30</asp:ListItem>
                        <asp:ListItem>03:00</asp:ListItem>
						<asp:ListItem>03:30</asp:ListItem>
                        <asp:ListItem>04:00</asp:ListItem>
						<asp:ListItem>04:30</asp:ListItem>
                        <asp:ListItem>05:00</asp:ListItem>
						<asp:ListItem>05:30</asp:ListItem>
						<asp:ListItem>06:00</asp:ListItem>
						<asp:ListItem>06:30</asp:ListItem>
						<asp:ListItem>07:00</asp:ListItem>
						<asp:ListItem>07:30</asp:ListItem>
						<asp:ListItem>08:00</asp:ListItem>
						<asp:ListItem>08:30</asp:ListItem>
						<asp:ListItem>09:00</asp:ListItem>
						<asp:ListItem>09:30</asp:ListItem>
						<asp:ListItem>10:00</asp:ListItem>
						<asp:ListItem>10:30</asp:ListItem>
						<asp:ListItem>11:00</asp:ListItem>
						<asp:ListItem>11:30</asp:ListItem>
						<asp:ListItem>12:00</asp:ListItem>
						<asp:ListItem>12:30</asp:ListItem>
						<asp:ListItem>13:00</asp:ListItem>
						<asp:ListItem>13:30</asp:ListItem>
						<asp:ListItem>14:00</asp:ListItem>
						<asp:ListItem>14:30</asp:ListItem>
						<asp:ListItem>15:00</asp:ListItem>
						<asp:ListItem>15:30</asp:ListItem>
						<asp:ListItem>16:00</asp:ListItem>
						<asp:ListItem>16:30</asp:ListItem>
						<asp:ListItem>17:00</asp:ListItem>
						<asp:ListItem>17:30</asp:ListItem>
						<asp:ListItem>18:00</asp:ListItem>
						<asp:ListItem>18:30</asp:ListItem>
						<asp:ListItem>19:00</asp:ListItem>
						<asp:ListItem>19:30</asp:ListItem>
						<asp:ListItem>20:00</asp:ListItem>
						<asp:ListItem>20:30</asp:ListItem>
						<asp:ListItem>21:00</asp:ListItem>
						<asp:ListItem>21:30</asp:ListItem>
						<asp:ListItem>22:00</asp:ListItem>
						<asp:ListItem>22:30</asp:ListItem>
						<asp:ListItem>23:00</asp:ListItem>
						<asp:ListItem>23:30</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblClosing" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Address</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Width="350px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="lblSelectedX" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="lblSelectedY" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4">
                    <asp:Label ID="lblAddress" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Region</td>
                <td>
                    <asp:TextBox ID="txtRegion" runat="server" Width="350px" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblRegion" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Departments Available</td>
                <td>
                    <asp:CheckBoxList runat="server"  ID="CreateDepartmentList" Width="350px" Height="350px" CssClass="form-control">
						<asp:ListItem Value="Anaesthesiology">&nbsp Anaesthesiology</asp:ListItem>
						<asp:ListItem Value="Cardiology">&nbsp Cardiology</asp:ListItem>
						<asp:ListItem Value="Colorectal">&nbsp Colorectal</asp:ListItem>
						<asp:ListItem Value="Dermatology">&nbsp Dermatology</asp:ListItem>
						<asp:ListItem Value="ER">&nbsp ER</asp:ListItem>
						<asp:ListItem Value="Neuro">&nbsp Neuro</asp:ListItem>
						<asp:ListItem Value="Orthopaedic">&nbsp Orthopaedic</asp:ListItem>
						<asp:ListItem Value="Psychiatry">&nbsp Psychiatry</asp:ListItem>
						<asp:ListItem Value="Urology">&nbsp Urology</asp:ListItem>
						<asp:ListItem Value="X Ray">&nbsp X Ray</asp:ListItem>
					</asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td>
                    <asp:Label ID="lblDepartmentList" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2 font_style_two">Facility Image</td>
                <td>
                    <p class="font_style_two" style="font-size:12px">Maximum Profile Picture size is 720x480 pixels.</p>
                    <img id="imgpreview" height="250" width="300" src="" style="border-width: 0px; margin-bottom: 10px; visibility: hidden;" />
                    <asp:FileUpload ID="ImageUpload" runat="server" Width="280px" onchange="showpreview(this);" />
                </td>
            </tr>
            

            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="btnBack" runat="server" Text="Back to Home Page" OnClick="btnBack_Click" CssClass="btn btn-dark mb-2 mt-3 float-right mr-5" />
                    <asp:Button ID="btnCreate" runat="server" OnClick="Create_Click" Text="Create" CssClass="btn btn-dark mb-2 mt-3 float-right mr-2" />
                </td>
            </tr>
        </table>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <cc1:ModalPopupExtender ID="confirmPopup" runat="server" PopupControlID="CfmPanel" TargetControlID="HiddenField1" CancelControlID="btnClose" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
    <asp:Panel ID="CfmPanel" runat="server" CssClass="modalPopup1" align="center" Style="display: none">
        <asp:Label ID="lblMsg" runat="server" Text="Results" Visible="true" Font-Size="Large"></asp:Label><br />
        <br />
        <asp:GridView ID="grdFacilities" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" PageSize="5" OnPageIndexChanging="grdFacilities_PageIndexChanging"
            AllowPaging="True" PagerStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" EmptyDataRowStyle-HorizontalAlign="Center" BorderStyle="Solid" CellPadding="10" CssClass="mr-3">
            <Columns>
                <asp:TemplateField HeaderText="Building" ItemStyle-Width="250px">
                    <ItemTemplate>
                        <asp:Label ID="lblBuilding" runat="server" Text='<%# Eval("Building") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" ItemStyle-Width="400px">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Postal" ItemStyle-Width="80px">
                    <ItemTemplate>
                        <asp:Label ID="lblPostal" runat="server" Text='<%# Eval("Postal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="x" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblX" runat="server" Text='<%# Eval("x") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="y" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblY" runat="server" Text='<%# Eval("y") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="lb_empty" class="emptyMsg" runat="server" Text="No Record Found" Width="730px"></asp:Label>
            </EmptyDataTemplate>
            <PagerStyle HorizontalAlign="Center" CssClass="GridPager"></PagerStyle>
        </asp:GridView>
        <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="mt-2" />
        <div class="mb-3"></div>
    </asp:Panel>
</asp:Content>
