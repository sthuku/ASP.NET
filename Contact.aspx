<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<%@ Register TagPrefix="cal" TagName="C" Src="~/Calendar.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>Your Name</td>
            <td>
                <asp:TextBox ID="nameTextBox" runat="server" SkinID="textBoxz"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="nameRequiredFieldValidator" 
                    runat="server" 
                    ErrorMessage="Please give us your name"
                    display="Dynamic"
                    ControlToValidate="nameTextBox"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                Your Phone Number
            </td>
            <td>
                <asp:TextBox 
                    ID="phoneTextBox" 
                    runat="server" 
                    BorderColor="#009933" 
                    BorderStyle="Groove" 
                    BorderWidth="1px" 
                    CssClass="textBox" 
                    Height="20px"></asp:TextBox>
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
            <td>
                When do you want us contact you?
            </td>
            <td>
                <cal:C ID="contactCalendar" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>At what time do you want us to contact you?<br />
                <br />
                <br />
            </td>
            <td>
                <asp:RadioButtonList ID="timeRadioButtonList" runat="server">
                    <asp:ListItem Text ="Morning" Value ="1"></asp:ListItem>
                    <asp:ListItem Text ="Afternoon" Value ="2"></asp:ListItem>
                    <asp:ListItem Text ="Evening" Value ="3"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>

            </td>
        </tr>
        </table>
    <table>
        <tr>
            <td>
                <asp:Button ID="contactButton" runat="server" Text="Contact Me" OnClick="contactButton_Click1" SkinID="buttonz" Width="86px" /></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="resultLabel" runat="server" SkinID="labelz"></asp:Label>
        </tr>
    </table>
</asp:Content>
