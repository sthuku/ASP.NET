<%@ WebHandler Language="C#" Class="imageHandler" %>

using System;
using System.Web;
using System.Data.SqlClient; 
public class imageHandler : IHttpHandler {

    string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Cars"].ConnectionString;
    public void ProcessRequest(HttpContext context)
    {
        /*
        Int32 rentalId;
        if (context.Request.QueryString["id"] != null)
            rentalId = Convert.ToInt32(context.Request.QueryString["id"]);
        else
            throw new ArgumentException("No parameter specified");

        context.Response.ContentType = "image/jpg";
        System.IO.Stream strm = ShowImage(rentalId);
        byte[] buffer = new byte[4096];
        int byteSeq = strm.Read(buffer, 0, 4096);

        while (byteSeq > 0)
        {
            context.Response.OutputStream.Write(buffer, 0, byteSeq);
            byteSeq = strm.Read(buffer, 0, 4096);
        }
    }

    public System.IO.Stream ShowImage(int rentalId)
    {
        SqlConnection connection = new SqlConnection(connectionString);
        string sql = "SELECT Image FROM Renting WHERE RentalId = @ID";
        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", rentalId);
        connection.Open();
        object img = cmd.ExecuteScalar();
        try
        {
            return new System.IO.MemoryStream((byte[])img);
        }
        catch
        {
            return null;
        }
        finally
        {
            connection.Close();
        }*/

        SqlConnection connection = new SqlConnection(connectionString);
        string query = "SELECT Image FROM Renting WHERE RentalId ="+context.Request.QueryString["imgid"];
        SqlCommand command = new SqlCommand(query, connection);
        SqlDataReader reader;

        try
        {
            connection.Open();
            reader = command.ExecuteReader();

            while (reader.Read())
            {
                context.Response.ContentType = "image/jpg";
                context.Response.BinaryWrite((byte[])reader["Image"]);
            }

            reader.Close();
        }
        catch (Exception err)
        {

            throw;
        }

        finally 
        {
            connection.Close();
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}