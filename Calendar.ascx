<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Calendar.ascx.cs" Inherits="Calendar" %>
<p>
    <br />
    <asp:Label ID="dateLabel" runat="server" Text=""></asp:Label>
&nbsp;<asp:ImageButton ID="calendarImageButton" runat="server" Height="20px" ImageUrl="~/Images/calendarImageButton3.png" Width="20px" OnClick="calendarImageButton_Click" />
</p>
<asp:Calendar ID="dateCalendar" runat="server" OnDayRender="Calendar_DayRender" OnSelectionChanged="Calendar_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
    <OtherMonthDayStyle ForeColor="#999999" />
    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
    <WeekendDayStyle BackColor="#CCCCFF" />
</asp:Calendar>
