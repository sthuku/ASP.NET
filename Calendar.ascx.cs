using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Calendar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dateCalendar.Visible = false;
        }
        
    }
    protected void calendarImageButton_Click(object sender, ImageClickEventArgs e)
    {
        if (dateCalendar.Visible == true)
            dateCalendar.Visible = false;
        else
            dateCalendar.Visible = true;
    }
    protected void Calendar_SelectionChanged(object sender, EventArgs e)
    {
        dateLabel.Text = dateCalendar.SelectedDate.ToShortDateString();
        dateCalendar.Visible = false;
    }
    protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date <= DateTime.Now)
        {
            e.Day.IsSelectable = false;
        }
    }

    public DateTime GetDate() 
    {
        return dateCalendar.SelectedDate;
    }
}