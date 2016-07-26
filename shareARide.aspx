<%@ Page Language="C#" MasterPageFile ="~/MasterPage.master" AutoEventWireup="true" CodeFile="shareARide.aspx.cs" Inherits="shareARide" %>
<%@ Register TagPrefix="cal" TagName="C" Src="~/Calendar.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table>
        <tr>
            <td class="auto-style8">Destination</td>
            <td>
                <asp:TextBox ID="destinationTextBox" runat="server" SkinID="textBoxz"></asp:TextBox></td>
            <td>
                <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" SkinID="buttonz" /></td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="searchRequiredFieldValidator" 
                    runat="server" 
                    ErrorMessage="Please give us the destination"
                    display="Dynamic"
                    ControlToValidate="destinationTextBox"
                    ForeColor="Red">

                </asp:RequiredFieldValidator>
            </td>
        </tr>
        </table
        ></div>
    <div>
    <table>
        <tr>
            <td colspan="3"></td>
        </tr>
    </table>
    <table>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="errorLabel" runat="server" SkinID="labelz"></asp:Label></td>
        </tr>
    </table>
    <asp:GridView ID="resultGridView" runat="server">
            </asp:GridView></div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style4
        {
            width: 318px;
        }
        .auto-style8
        {
            color: #000000;
        }
    </style>
</asp:Content>
