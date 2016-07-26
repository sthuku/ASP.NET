<%@ Page Language="C#" MasterPageFile ="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Form1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width: 100%;">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">

            </td>
            <td> 
                <asp:Label ID="welcomeLabel" runat="server" Text="Welcome" Font-Size="70pt" ForeColor="#99FF99" style="font-size: xx-large; color: #000066"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table>
        <tr>
            <td>Check Whether your request is approved</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
        <table style="width: 100%;">
    <tr>
        <td>
            <br />
            Enter your Rental Id</td>
        <td>
            <br />
            <asp:TextBox ID="rentalIdTextBox"  runat="server" SkinID="textBoxz"></asp:TextBox></td>
        <td>
            <br />
            <asp:RequiredFieldValidator 
                ID="rentalRequiredFieldValidator" 
                runat="server" 
                ErrorMessage="Please enter rental Id"
                display ="Dynamic"
                ForeColor ="Red" ControlToValidate="rentalIdTextBox"></asp:RequiredFieldValidator>
        </td>
    </tr>
        <tr>
            <td>
                <br />
                Enter the phone number you gave us when renting a car
            </td>
            <td>
                <br />
                <asp:TextBox ID="phoneTextBox" runat="server" SkinID="textBoxz"></asp:TextBox>
            </td>
            <td>
                <br />
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
        <td>&nbsp;</td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button 
                ID="submitButton" 
                runat="server" 
                SkinId="buttonz" 
                Text="Submit" 
                OnClick="submitButton_Click" /></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="resultLabel" runat="server" ForeColor="#66FFFF" SkinID="labelz"></asp:Label></td>
    </tr>
</table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1
        {
            width: 110px;
        }
    </style>
</asp:Content>


