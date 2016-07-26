using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shareARide : System.Web.UI.Page
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
    protected void searchButton_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(connectionString);
        string query = "SELECT Renting.FullName as Name, Renting.Phone, Cars.Passengers - Renting.NumberOfPeople as 'Available Space', Renting.StartDate as 'Start Date', Renting.ReturnDate as 'Return Date' FROM Renting INNER JOIN Cars ON Renting.VehicleId = Cars.Id WHERE Renting.Destination = @destination AND Renting.IsShared = 'true'";
        SqlCommand command = new SqlCommand(query, connection);
        command.Parameters.AddWithValue("@destination", destinationTextBox.Text);
        SqlDataAdapter adapt = new SqlDataAdapter();
        DataSet dataSet = new DataSet();
        try
        {
            connection.Open();
            command.ExecuteNonQuery();
            adapt.SelectCommand = command;
            adapt.Fill(dataSet);

       
            resultGridView.CellPadding = 10;
            resultGridView.CellSpacing = 10;
            resultGridView.DataSource = dataSet;
            resultGridView.DataBind();
            if (resultGridView.Rows.Count == 0)
            {
                resultGridView.Visible = false;
                errorLabel.Text = "Sorry, we don't have anyone want to share the car to this destination";
            }
            else
            {
                errorLabel.Text = "";
                resultGridView.Visible = true;
            }
        }
        catch (Exception err)
        {
    
            errorLabel.Text = err.Message;
        }

        finally 
        {
            connection.Close();
        }
    }
}