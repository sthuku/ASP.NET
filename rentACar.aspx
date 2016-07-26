<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rentACar.aspx.cs" Inherits="rentACar" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="cal" TagName="C" Src="~/Calendar.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:MultiView ID="rentACarMultiView" runat="server">
            <asp:View ID="carsView" runat="server">

                <table style="width: 100%;">
                    <tr>
                        <td colspan="2" ><h2 style="width: 655px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style28">Please tell us about your trip</span></h2></td>
                    </tr>
                    </table>
                <table>
                    <tr>
                        <td class="auto-style27">What is your Destination?</td>
                        <td colspan="2" class="auto-style23"><asp:TextBox ID="destinationTextBox" runat="server" MaxLength="50" SkinID="textBoxz"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="destinationRequiredFieldValidator0" runat="server" ControlToValidate="destinationTextBox" ErrorMessage="Please tell us your destination" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                       
                        </tr>
                    </table>
                <table>
                    <tr>
                        <td class="auto-style27">
                            <br />
                            When will you start your trip?</td>
                        <td class="auto-style9"><cal:C ID="startCalendar" runat="server"></cal:C></td>
                    </tr>
                    </table><table>
                    <tr>
                        <td class="auto-style27">
                            <br />
                            What is the expected return date?
                            </td>
                        <td class="auto-style9">
                            <cal:C ID="returnDate" runat="server"></cal:C>
                        </td>
                        </tr>
                    </table><table>
                    <tr>
                        <td class="auto-style26">
                            Which type of Vehicle you are looking for?</td>
                        <td class="auto-style9">
                            <asp:DropDownList 
                                ID="vehicleTypeDropDownList" 
                                runat="server" 
                                OnSelectedIndexChanged="vehicleTypeDropDownList_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">Car</asp:ListItem>
                                <asp:ListItem Value="2">Truck</asp:ListItem>
                                <asp:ListItem Value="3">SUV</asp:ListItem>
                                <asp:ListItem Value="4">Minivan</asp:ListItem>
                                <asp:ListItem Value="5">Van</asp:ListItem>
                                <asp:ListItem Value="6">Cargo Van</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                            </tr></table><table>
                    <tr>
                        <td class="auto-style26">
                            Which model you are looking for?&nbsp;
                        </td>
                        <td class="auto-style9">
                             <br />
                             <asp:DropDownList ID="vehicleModeDropDownList" runat="server" OnLoad="Page_Load">
                </asp:DropDownList>
                             <br />
                             <br />
                        </td>
                    </tr>
                    </table><table>
                    <tr>
                        <td class="auto-style16" colspan ="3">
                            <asp:CheckBox ID="shareCheckBox" runat="server" AutoPostBack="True" OnCheckedChanged="shareCheckBox_CheckedChanged" />&nbsp;Would you like to Share Ride?</td>
                    </tr>
                        </table><table>
                    <tr>
                        <td class="auto-style26">
                            How many members you are travelling with?
                        </td>
                        <td>
                            <asp:TextBox ID="membersTextBox" runat="server" SkinID="textBoxz"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator 
                                ID="membersTextBoxRequiredFieldValidator" 
                                runat="server" 
                                ErrorMessage="Please tell us how many members" 
                                ControlToValidate="membersTextBox"
                                ForeColor="Red"
                                display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="membersRangeValidator" 
                                runat="server" 
                                ErrorMessage="Members cannot exeed 4" 
                                Display="Dynamic" 
                                ControlToValidate="membersTextBox"
                                ForeColor="Red" 
                                MaximumValue="4" 
                                MinimumValue="1"
                                Type="Integer"></asp:RangeValidator>

                        </td>
                    </tr>
                            </table><table>
                    <tr>
                        <td colspan ="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="step2Button" runat="server" Text="Next" OnClick="step2Button_Click" SkinID="buttonz" />
                        </td>
                    </tr>
                                </table><table>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="errorLabel" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:View>

            <asp:View ID="SummaryView" runat="server">
                <table style="width: 100%;">
                <tr>
                    <td class="auto-style6">Vehicle</td>
                    <td>
                        <asp:Label ID="vehicleLabel" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style6">Trip to</td>
                    <td><asp:Label ID="destinationLabel" runat="server" Text=""></asp:Label></td>
                </tr>
                </table><table>
                <tr>
                    <td class="auto-style6">Start Date</td><td> <asp:Label ID="startDateLabel" runat="server" Text=""></asp:Label></td> 
                </tr>
                    <tr>
                        <td class="auto-style6">Return Date</td><td> <asp:Label ID="returnDateLabel" runat="server" Text=""></asp:Label></td>
                    </tr>
                    </table>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="shareLabel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td class="auto-style5">
                            Total Amount
                        </td>
                        <td>
                            <asp:Label ID="totalPriceLabel" runat="server" SkinID="labelz"></asp:Label>
                        </td>
                    </tr>
                    </table><table>
                    <tr>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Button ID="step3Button" runat="server" Text="Confirm" OnClick="step3Button_Click" SkinID="buttonz"/>
                        </td>
                    </tr>
                </table>
            </asp:View>

            <asp:View ID="personalDetailsTypeView" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td>Full Name</td>
                        <td><asp:TextBox ID="fullNameTextBox" runat="server" MaxLength="50" SkinID="textBoxz"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator 
                                ID="fullNameRequiredFieldValidator" 
                                runat="server" 
                                ErrorMessage="Please enter your name" 
                                ControlToValidate="fullNameTextBox"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Phone Number
                            </td>
                        <td>
                            <asp:TextBox ID="phoneTextBox" runat="server" MaxLength="25" SkinID="textBoxz"></asp:TextBox></td>
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
                        <td>Email</td>
                        <td><asp:TextBox ID="emailTextBox" runat="server" MaxLength="50" SkinID="textBoxz"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator 
                                ID="emailRequiredFieldValidator" 
                                runat="server" 
                                ErrorMessage="We need your email address" 
                                ControlToValidate="emailTextBox"
                                Display ="Dynamic"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            
                            <asp:RegularExpressionValidator 
                            ID="RegularExpressionValidator1" 
                            runat="server"
                            ControlToValidate ="emailTextBox" 
                            ErrorMessage="Enter Valid email address 'someone@example.com'"
                             ForeColor="Red"
                            Display ="Dynamic" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">

                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Card Number
                        </td>
                        <td>
                            <asp:TextBox ID="cardTextBox" runat="server" SkinID="textBoxz"></asp:TextBox>
                        </td>
                        <td><asp:RequiredFieldValidator 
                                ID="cardRequiredFieldValidator" 
                                runat="server" 
                                ErrorMessage="We need your Card number" 
                                ControlToValidate="cardTextBox"
                                Display ="Dynamic"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator 
                            ID="cardRegularExpressionValidator" 
                            runat="server"
                                ErrorMessage="Invalid! The Card number format should be 1234 1234 1234 1234"
                         InitialMessage ="The Card Number format should be 1234 1234 1234 1234 or 1234-1234-1234-1234 or 1234123412341234" 
                         ControlToValidate="cardTextBox" 
                         ValidationExpression="^(\d{4}[- ]){3}\d{4}|\d{16}$"
                                ForeColor="Red"
                            Display ="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            Upload a photo copy of your driver's license
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan ="3">
                            <asp:FileUpload ID="Uploader" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator 
                                ID="uploadRequiredFieldValidator" 
                                runat="server" 
                                ErrorMessage="We need a copy of your driver's license" 
                                ControlToValidate="Uploader"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="checkOutButton" runat="server" Text="Checkout" OnClick="checkOutButton_Click" SkinID="buttonz"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="errorLabel2" runat="server" SkinID="labelz"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:View>
            
            
        </asp:MultiView>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style2
        {
            width: 714px;
            height: 76px;
        }
        .auto-style3
        {
            width: 322px;
        }
        .auto-style5
        {
            width: 255px;
        }
        .auto-style6
        {
            width: 253px;
        }
    .auto-style9
    {
        width: 179px;
    }
    .auto-style16
    {
        width: 323px;
        height: 76px;
    }
    .auto-style23
    {
        width: 400px;
    }
    .auto-style26
    {
        width: 305px;
    }
    .auto-style27
    {
        width: 304px;
    }
        .auto-style28
        {
            color: #000066;
        }
    </style>
</asp:Content>
