using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["Cars"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (!User.IsInRole("Administrator"))
            {
                Server.Transfer("~/Home.aspx");
            }

        }

        if (!IsPostBack)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl login = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("loginTab");
            login.Style.Add("display", "none");

            approvedGridView.Visible = false;
            nonApprovedGridView.Visible = false;
            contactGridView.Visible = false;

            rentalIdLabel.Visible = false;
            rentalIdTextBox.Visible = false;
            imageButton.Visible = false;

            customerImage.Visible = false;
            approveButton.Visible = false;
            rejectbutton.Visible = false;

            updateContactLabel.Visible = false;
            contactIdLabel.Visible = false;
            updateContactTextBox.Visible = false;
            updateContactButton.Visible = false;
        }
        
    }

    private void fillCustomersData(string query, GridView gridView) 
    {
        SqlConnection connection = new SqlConnection(connectionString);
        
        SqlCommand command = new SqlCommand(query, connection);
        
        SqlDataAdapter adapt = new SqlDataAdapter();
        DataSet dataSet = new DataSet();
        try
        {
            connection.Open();
            command.ExecuteNonQuery();
            adapt.SelectCommand = command;
            adapt.Fill(dataSet);


            gridView.CellPadding = 10;
            gridView.CellSpacing = 10;
            gridView.DataSource = dataSet;
            gridView.DataBind();
            if (gridView.Rows.Count == 0)
            {
                gridView.Visible = false;
                errorLabel.Text = "We don't have any records";
            }
            else
            {
                errorLabel.Text = "";
                gridView.Visible = true;
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
    protected void approvedButton_Click(object sender, EventArgs e)
    {
        nonApprovedGridView.Visible = false;
        contactGridView.Visible = false;

        rentalIdLabel.Visible = false;
        rentalIdTextBox.Visible = false;
       
        imageButton.Visible = false;

        customerImage.Visible = false;
        approveButton.Visible = false;
        rejectbutton.Visible = false;

        contactIdLabel.Visible = false;
        updateContactLabel.Visible = false;
        updateContactTextBox.Visible = false;
        updateContactButton.Visible = false;

        string query = "SELECT Renting.RentalId as 'Rental Id', Renting.VehicleId as 'Vehicle Id', Renting.FullName as Name, Renting.Image as 'License', Renting.Phone, Renting.StartDate as 'Start Date', Renting.ReturnDate as 'Return Date' FROM Renting INNER JOIN Cars ON Renting.VehicleId = Cars.Id WHERE Renting.Approved = 'true'";
        fillCustomersData(query, approvedGridView);
    }
    protected void nonApprovedButton_Click(object sender, EventArgs e)
    {
        approvedGridView.Visible = false;
        contactGridView.Visible = false;

        customerImage.Visible = false;
        approveButton.Visible = false;
        rejectbutton.Visible = false;

        updateContactLabel.Visible = false;
        updateContactTextBox.Visible = false;
        updateContactButton.Visible = false;
        contactIdLabel.Visible = false;

        string query = "SELECT Renting.RentalId as 'Rental Id', Renting.VehicleId as 'Vehicle Id', Renting.FullName as Name, Renting.Image as 'License', Renting.Phone, Renting.StartDate as 'Start Date', Renting.ReturnDate as 'Return Date' FROM Renting INNER JOIN Cars ON Renting.VehicleId = Cars.Id WHERE Renting.Approved IS NULL";
        fillCustomersData(query, nonApprovedGridView);
        if (errorLabel.Text != "We don't have any records")
        {
            rentalIdLabel.Visible = true;
            rentalIdTextBox.Visible = true;
            imageButton.Visible = true;
        }
    }
   
    protected void contactButton_Click(object sender, EventArgs e)
    {
        nonApprovedGridView.Visible = false;
        approvedGridView.Visible = false;
        rentalIdLabel.Visible = false;
        rentalIdTextBox.Visible = false;
        customerImage.Visible = false;
        approveButton.Visible = false;
        rejectbutton.Visible = false;
        imageButton.Visible = false;

        

        string query = "SELECT RequestId as 'Request Id', Name, Phone, DayOfContact as 'Requested Date to Contact', TimeOfContact as 'Time' ";
        query += "FROM Contact WHERE Contacted = 'false'";
        fillCustomersData(query, contactGridView);

        if (errorLabel.Text != "We don't have any records")
        {
            contactIdLabel.Visible = true;
            updateContactLabel.Visible = true;
            updateContactTextBox.Visible = true;
            updateContactButton.Visible = true;
        }
    }

    protected void imageButton_Click(object sender, EventArgs e)
    {
        if (rentalIdTextBox.Text != null)
        {
            customerImage.Visible = true;
            approveButton.Visible = true;
            rejectbutton.Visible = true;
            customerImage.ImageUrl = "~/imageHandler.ashx?imgid=" + rentalIdTextBox.Text;
        }
        else
            errorLabel.Text = "Enter Rental Id to access photo copy of license";

    }
    protected void approveButton_Click(object sender, EventArgs e)
    {
        string query = "UPDATE Renting SET Approved = 'true' WHERE RentalId = '" + rentalIdTextBox.Text + "'";
        updateApproved(query);
    }
    protected void rejectbutton_Click(object sender, EventArgs e)
    {
        string query = "UPDATE Renting SET Approved = 'false' WHERE RentalId = '" + rentalIdTextBox.Text + "'";
        updateApproved(query);
    }

    private void updateApproved(string query) 
    {
        SqlConnection connection = new SqlConnection(connectionString);
        
        SqlCommand command = new SqlCommand(query, connection);

        int updated = 0;
        try
        {
            connection.Open();
            updated = command.ExecuteNonQuery();

        }
        catch (Exception err)
        {
            errorLabel.Text = "Error updating the Table. ";
            errorLabel.Text += err.Message;
        }
        finally
        {
            connection.Close();
        }

        if (updated > 0)
        {
            errorLabel.Text = "Successfully Updated!";
        }
    }
    protected void updateContactButton_Click(object sender, EventArgs e)
    {
        string query = "UPDATE Contact SET Contacted = 'true' WHERE RequestId = '" + updateContactTextBox.Text + "'";
        updateApproved(query);
    }
}