
<%@ Page Language="C#" MasterPageFile ="MasterPage.master" AutoEventWireup="true" CodeFile="GetADriver.aspx.cs" Inherits="GetADriver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
    <tr>
        <td class="auto-style5">Enter your Rental Id</td>
        <td>
            <asp:TextBox ID="rentalIdTextBox" runat="server" SkinID="textBoxz"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator 
                ID="rentalRequiredFieldValidator" 
                runat="server" 
                ErrorMessage="Please enter rental Id"
                display ="Dynamic"
                ForeColor ="Red" ControlToValidate="rentalIdTextBox"></asp:RequiredFieldValidator>
        </td>
    </tr>
        <tr>
            <td class="auto-style5">
                Enter the phone number you gave us when renting a car
            </td>
            <td>
                <asp:TextBox ID="phoneTextBox" runat="server" SkinID="textBoxz"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator 
                                ID="phoneRequiredFieldValidator" 
                                runat="server" 
                                ErrorMessage="We need your phone number" 
                                ControlToValidate="phoneTextBox"
                                ForeColor="Red"
                                Display ="Dynamic">
                            </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator 
                            ID="phoneRegularExpressionValidator" 
                            runat="server"
                            ControlToValidate ="phoneTextBox" 
                            ErrorMessage="US Phone number format (816) 816-1234"
                             ForeColor="Red"
                            Display ="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
    <tr>
        <td class="auto-style5">&nbsp;</td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" SkinID="buttonz" /></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <br />
            <asp:Label ID="resultLabel" runat="server" SkinID="labelz"></asp:Label></td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .auto-style5
    {
        width: 278px;
    }
</style>
</asp:Content>
