using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rentACar : System.Web.UI.Page
{
    private string uploadDirectory;
    string connectionString = WebConfigurationManager.ConnectionStrings["Cars"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        //uploadDirectory = Path.Combine(Request.PhysicalApplicationPath,"Uploads");
        if (!IsPostBack)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl login = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("signOutTab");
            login.Style.Add("display", "none");

            MaintainScrollPositionOnPostBack = true;
            rentACarMultiView.ActiveViewIndex = 0;
            vehicleModeDropDownList.Enabled = false;
            membersTextBox.Enabled = false;
            membersTextBoxRequiredFieldValidator.Enabled = false;
            membersRangeValidator.Enabled = false;

            ViewState["Price"] = "";
            ViewState["Passengers"] = "";
            ViewState["Bags"] = "";
            ViewState["Mileage"] = "";
            ViewState["Availability"] = "";
        }
    }
    protected void step2Button_Click(object sender, EventArgs e)
    {
        if (vehicleTypeDropDownList.SelectedValue != "0" &&
            vehicleModeDropDownList.SelectedValue != "" &&
            vehicleModeDropDownList.SelectedValue != ""&&
            startCalendar.GetDate() != null&&
            returnDate.GetDate() != null)
        {
            values();

            
            rentACarMultiView.ActiveViewIndex = 1;

            vehicleLabel.Text = vehicleModeDropDownList.SelectedItem.ToString();
            destinationLabel.Text = destinationTextBox.Text;
            startDateLabel.Text = startCalendar.GetDate().ToShortDateString();
            returnDateLabel.Text = returnDate.GetDate().ToShortDateString();

            

            if (shareCheckBox.Checked)
            {
                if (ViewState["Passengers"].ToString() != "")
                {
                    string totalPassengers = ViewState["Passengers"].ToString();
                    int remainingPassengers = int.Parse(totalPassengers) - int.Parse(membersTextBox.Text);
                    if (remainingPassengers > 1)
                        shareLabel.Text = "You want to share the ride and you have " + membersTextBox.Text + " people travelling with you. So you will have space for " + remainingPassengers + " people";
                    else
                        shareLabel.Text = "You want to share the ride and you have " + membersTextBox.Text + " people travelling with you. So you will have space for " + remainingPassengers + " person";
                }
            }
            


            if (ViewState["Price"].ToString() != "")
            {
                TimeSpan days = returnDate.GetDate() - startCalendar.GetDate();
                int totalDays = (int)days.TotalDays;
                double price;
                if (totalDays < 2)
                    price = double.Parse(ViewState["Price"].ToString());
                else
                    price = double.Parse(ViewState["Price"].ToString()) * totalDays;
                totalPriceLabel.Text = price.ToString("C");
            }   
        } 
        else
            errorLabel.Text = "Please Give us all the details to continue";
        
    }
    protected void step3Button_Click(object sender, EventArgs e)
    {
        rentACarMultiView.ActiveViewIndex = 2;
    }
    protected void vehicleTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (vehicleTypeDropDownList.SelectedValue != "0")
        {
            vehicleModeDropDownList.Enabled = true;

            if (vehicleTypeDropDownList.SelectedValue == "1")
                fillCarsData("Car", vehicleModeDropDownList);
            else if (vehicleTypeDropDownList.SelectedValue == "2")
                fillCarsData("Truck", vehicleModeDropDownList);
            else if (vehicleTypeDropDownList.SelectedValue == "3")
                fillCarsData("SUV", vehicleModeDropDownList);
            else if (vehicleTypeDropDownList.SelectedValue == "4")
                fillCarsData("Minivan", vehicleModeDropDownList);
            else if (vehicleTypeDropDownList.SelectedValue == "5")
                fillCarsData("Van", vehicleModeDropDownList);
            else if (vehicleTypeDropDownList.SelectedValue == "6")
                fillCarsData("Cargo Van", vehicleModeDropDownList);

        }
        else 
        {
            vehicleModeDropDownList.Items.Clear();
            vehicleModeDropDownList.Enabled = false;
        }
    }

    private void fillCarsData(string type, DropDownList vehicleModels) 
    {
        vehicleModels.Items.Clear();
        vehicleModels.Items.Add(new ListItem("Select", "0"));
        SqlConnection connection = new SqlConnection(connectionString);
        string query = "SELECT * FROM Cars WHERE TYPE = '" + type + "'";
        SqlCommand command = new SqlCommand(query, connection);

        SqlDataReader reader;

        try
        {
            connection.Open();
            reader = command.ExecuteReader();
                while (reader.Read())
                {
                    ListItem listItem = new ListItem();
                    listItem.Text = reader["Make"] + " " + reader["Model"];
                    listItem.Value = reader["Id"].ToString();
                    vehicleModels.Items.Add(listItem);
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

    protected void shareCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        if (shareCheckBox.Checked && vehicleModeDropDownList.SelectedValue != "")
        {
            if (vehicleModeDropDownList.SelectedValue != "0")
            {
                membersTextBox.Enabled = true;
                membersTextBoxRequiredFieldValidator.Enabled = true;
                membersRangeValidator.Enabled = true;
                
                values();
                if (ViewState["Passengers"].ToString() != "")
                {
                    membersRangeValidator.MaximumValue = (int.Parse(ViewState["Passengers"].ToString()) - 1).ToString();
                    membersRangeValidator.ErrorMessage = "Members cannot exeed " + membersRangeValidator.MaximumValue;
                }
                
            }
        }
        else
        {
            membersTextBox.Enabled = false;
            membersTextBoxRequiredFieldValidator.Enabled = false;
            membersRangeValidator.Enabled = false;
        }
            
    }

    private void values() 
    {
        SqlConnection connection = new SqlConnection(connectionString);
        string query = "SELECT * FROM Cars WHERE Id = @value";
        SqlCommand command = new SqlCommand(query, connection);
        command.Parameters.AddWithValue("@value", vehicleModeDropDownList.SelectedValue);

        SqlDataReader reader;

        try
        {
            connection.Open();
            reader = command.ExecuteReader();
            reader.Read();
            ViewState["Price"] = reader["Price"];
            ViewState["Passengers"] = reader["Passengers"];
            ViewState["Bags"] = reader["Bags"];
            ViewState["Mileage"] = reader["Mileage"];
            ViewState["Availability"] = reader["Availability"];
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
  
    protected void checkOutButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            if (Uploader.HasFile)
            {
                string extension = Path.GetExtension(Uploader.PostedFile.FileName);
                switch (extension.ToLower())
                {
                    case ".bmp":
                    case ".gif":
                    case ".jpg":
                    case ".png":
                    case ".jpeg":
                        break;
                    default:
                        errorLabel2.Text = "This file type is not allowed.";
                        return;
                }

                int imageLength = Uploader.PostedFile.ContentLength;
                byte[] imageByte = new byte[imageLength];
                HttpPostedFile image = Uploader.PostedFile;
                image.InputStream.Read(imageByte, 0, imageLength);

                string insertSQL;
                insertSQL = "INSERT INTO Renting (";
                insertSQL += "FullName, Phone, Email, Image, Card, StartDate,";
                insertSQL += "ReturnDate, IsShared, NumberOfPeople, VehicleId, Payment, Destination) ";
                insertSQL += "VALUES (";
                insertSQL += "@fullName, @phone, @email, @image, @card, @startDate,";
                insertSQL += "@returnDate, @isShared, @numberOfPeople, @vehicleId, @payment, @destination)";

                SqlConnection connection = new SqlConnection(connectionString);
                SqlCommand command = new SqlCommand(insertSQL, connection);

                DateTime startDate = DateTime.Parse(startDateLabel.Text);
                DateTime returnDate = DateTime.Parse(returnDateLabel.Text);
                // Add the parameters.
                command.Parameters.AddWithValue("@fullName", fullNameTextBox.Text);
                command.Parameters.AddWithValue("@phone", phoneTextBox.Text);
                command.Parameters.AddWithValue("@email", emailTextBox.Text);
                command.Parameters.AddWithValue("@card", cardTextBox.Text);
                command.Parameters.AddWithValue("@startDate", startDate);
                command.Parameters.AddWithValue("@returnDate", returnDate);
                command.Parameters.AddWithValue("@isShared", shareCheckBox.Checked);
                command.Parameters.AddWithValue("@numberOfPeople", membersTextBox.Text);
                command.Parameters.AddWithValue("@vehicleId", int.Parse(vehicleModeDropDownList.SelectedValue));
                command.Parameters.AddWithValue("@Payment", decimal.Parse(totalPriceLabel.Text.Substring(1)));
                command.Parameters.AddWithValue("@image", imageByte);
                command.Parameters.AddWithValue("@destination", destinationTextBox.Text);
                int added = 0;
                try
                {
                    connection.Open();
                    added = command.ExecuteNonQuery();
                    errorLabel2.Text = added.ToString() + " record inserted.";
                }
                catch (Exception err)
                {
                    errorLabel2.Text = "Error inserting record. ";
                    errorLabel2.Text += err.Message;
                }
                finally
                {
                    connection.Close();
                }

                // If the insert succeeded, refresh the author list.
                if (added > 0)
                {
                    string query = "SELECT * FROM Renting WHERE VehicleId = @vehicleId";
                    //string updateSQL;
                    //updateSQL = "UPDATE Cars SET ";
                    //updateSQL += "Availability = @returnDate WHERE Id = @vehicleId";

                    SqlCommand selectCommand = new SqlCommand(query, connection);
                    //SqlCommand updateCommand = new SqlCommand(updateSQL, connection);
                    selectCommand.Parameters.AddWithValue("@vehicleId", int.Parse(vehicleModeDropDownList.SelectedValue));

                    SqlDataReader reader;

                    //int updated = 0;
                    try
                    {
                        connection.Open();
                       // updated = updateCommand.ExecuteNonQuery();
                        reader = selectCommand.ExecuteReader();
                        reader.Read();
                        errorLabel2.Text = "Successfull! Your Rental Id is " + reader["RentalId"].ToString();

                        fullNameTextBox.Text = "";
                        phoneTextBox.Text = "";
                        emailTextBox.Text = "";
                        cardTextBox.Text = "";
                        //if (updated > 0)
                        //{
                            //errorLabel2.Text += "Updated";
                        //}
                    }
                    catch (Exception err)
                    {
                        errorLabel2.Text = err.Message;
                    }

                    finally
                    {
                        connection.Close();
                    } 
                }
            }
            


           
            
        }

        
    }
}