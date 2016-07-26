<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="approvedButton" runat="server" Text="Show Approved Rents" OnClick="approvedButton_Click" Width="182px" SkinID="buttonz" />
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="nonApprovedButton" runat="server" Text="Show New Requests" OnClick="nonApprovedButton_Click" Width="182px" SkinID="buttonz" />
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
<tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="contactButton" runat="server" Text="Show Contact Requests" OnClick="contactButton_Click" Width="183px" SkinID="buttonz" />
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
</table><table>
        <tr>
            <td>
                <asp:GridView ID="nonApprovedGridView" runat="server">
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="approvedGridView" runat="server">
                </asp:GridView>
            </td>
        </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="rentalIdLabel" runat="server" Text="Enter the Rental Id to view the license and approve it"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="rentalIdTextBox" runat="server" SkinID="textBoxz"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="imageButton" runat="server" Text="Go" OnClick="imageButton_Click" SkinID="buttonz" />
                </td>
            </tr>
            </table>
    <table>

            <tr>
                <td colspan="3">
                    
                </td>
            </tr>
        </table>
    <table>
        <tr>
            <td>

            </td>
            <td>
                <asp:Image ID="customerImage" runat="server" Height="300px" Width="300px" />
            </td>
            <td>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="approveButton" text="Approve" runat="server" OnClick="approveButton_Click" SkinID="buttonz"></asp:Button>
            </td>
          <td>

          </td>
            <td>
                <asp:Button ID="rejectbutton" text="Reject" runat="server" OnClick="rejectbutton_Click" SkinID="buttonz"></asp:Button>
            </td>
        </tr>
    </table>
        <table>
        <tr>
            <td>
                <asp:GridView ID="contactGridView" runat="server">
                   
                </asp:GridView>
            </td>
        </tr>
        </table>
        <table>
            <tr>
                <td colspan="3">
                    <br />
                    <asp:Label ID="updateContactLabel" runat="server" Text="Upadate The Contact List"></asp:Label>
                    <br />
                </td>
            </tr>
            </table><table>
            <tr>
                <td>
                    <asp:Label ID="contactIdLabel" runat="server" Text="Contact ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="updateContactTextBox" runat="server" SkinID="textBoxz"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="updateContactButton" text="Update" runat="server" OnClick="updateContactButton_Click" SkinID="buttonz"></asp:Button>
                </td>
            </tr>
        </table>
    <table>
        <tr>
            <td colspan="3">
                <asp:Label ID="errorLabel" runat="server" SkinID="labelz"></asp:Label></td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style5
    {
        width: 196px;
    }
    .auto-style6
    {
        width: 4px;
    }
    </style>
</asp:Content>


