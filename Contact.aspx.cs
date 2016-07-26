using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl login = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("signOutTab");
            login.Style.Add("display", "none");
        }
    }
    protected void contactButton_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Cars"].ConnectionString;

            string insertSQL;
            insertSQL = "INSERT INTO Contact (";
            insertSQL += "Name, Phone, DayOfContact, TimeOfContact, Contacted) ";
            insertSQL += "VALUES (";
            insertSQL += "@name, @phone, @date, @time, 'false')";

            if (timeRadioButtonList.SelectedItem != null && contactCalendar.GetDate() != DateTime.Parse("1/1/0001 12:00:00 AM"))
            {

                SqlConnection connection = new SqlConnection(connectionString);
                SqlCommand command = new SqlCommand(insertSQL, connection);

                DateTime contactDate = DateTime.Parse(contactCalendar.GetDate().ToShortDateString());


                command.Parameters.AddWithValue("@name", nameTextBox.Text);
                command.Parameters.AddWithValue("@phone", phoneTextBox.Text);
                command.Parameters.AddWithValue("@date", contactDate);
                command.Parameters.AddWithValue("@time", timeRadioButtonList.SelectedItem.Text);
                int added = 0;
                try
                {

                    connection.Open();
                    added = command.ExecuteNonQuery();


                }
                catch (Exception err)
                {
                    resultLabel.Text = "Error inserting record. ";
                    resultLabel.Text += err.Message;
                }
                finally
                {
                    connection.Close();
                }

                if (added > 0)
                {
                    resultLabel.Text = "Thank you! We will gladly contact you";
                }
            }
            else
                resultLabel.Text = "Please fill in all fields";
        }
        
    }
}