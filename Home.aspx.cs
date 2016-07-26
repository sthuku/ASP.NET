using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form1 : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["Cars"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl login = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("signOutTab");
            login.Style.Add("display", "none");
        }
    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Renting WHERE RentalId = @rentingId AND Phone = @phone";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@rentingId", rentalIdTextBox.Text);
            command.Parameters.AddWithValue("@phone", phoneTextBox.Text);
            SqlDataReader reader;

            try
            {
                connection.Open();
                reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    rentalIdTextBox.Text = "";
                    phoneTextBox.Text = "";
                    if (reader["approved"] != System.DBNull.Value)
                    {
                        if (Convert.ToBoolean(reader["approved"]) == true)
                            resultLabel.Text = "Congratsulations, your license has been verified.<br />You can take the vehicle now, happy journey";
                        else if (Convert.ToBoolean(reader["approved"]) == false)
                            resultLabel.Text = "We are Sorry, your license has not been verified.<br />If Something went wrong please <a class =\"aTag\" href = \"Contact.aspx\"><strong><em>Contact Us</em></strong></a>";
                    }
                    else
                        resultLabel.Text = "We are Sorry to tell you that we are busy. We will let you know asap.<br />For more info, please <a class =\"aTag\" href = \"Contact.aspx\"><strong><em>Contact Us</em></strong></a>";
                }
                else
                {
                    resultLabel.Text = "Please Check your Rental Id or Your Phone Number. If you never rented a car, <a class = \"aTag\"href=\"rentACar.aspx\"><strong><em>Rent a Car</em></strong></a> ";
                }
            }
            catch (Exception err)
            {
                resultLabel.Text = err.Message;
            }

            finally 
            {
                connection.Close();
            }
        }
    }
}