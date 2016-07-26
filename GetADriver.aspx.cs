using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GetADriver : System.Web.UI.Page
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
                    if (DateTime.Parse(reader["StartDate"].ToString()) >= DateTime.Now)
                    {
                        reader.Close();
                        string insertQuery = "INSERT INTO Driver(RentalId) VALUES(@rentingId)";
                        SqlCommand insertCommand = new SqlCommand(insertQuery, connection);
                        insertCommand.Parameters.AddWithValue("@rentingId", rentalIdTextBox.Text);

                        int inserted = 0;
                        inserted = insertCommand.ExecuteNonQuery();

                        if (inserted > 0)
                        {
                            resultLabel.Text = "We will call you to give the driver's phone number.<br />Drivers usually take hourly based paymets.<br />Driver will get his payment directly from you and we assure you we will assign you a good driver.";
                        }
                    }
                    else
                    {
                        resultLabel.Text = "You can't get driver if you started the journey already.";
                    }
                }
                else
                {
                    resultLabel.Text = "Please Check your Rental Id or Your Phone Number. If you never rented a car, <a class = \"aTag\"href=\"rentACar.aspx\">Rent a Car</a> ";
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