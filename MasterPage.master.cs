using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void logInButton_Click(object sender, EventArgs e)
    {


        if (Membership.ValidateUser(userNameTextBox.Text, passwordTextBox.Text))
        {
            FormsAuthentication.RedirectFromLoginPage(userNameTextBox.Text, false);
            Response.Redirect("~/Admin/Admin.aspx");
        }
        else
        {
            loginErrorLabel.Text = "Invalid username or password";
        }
    }
    protected void signOutButton_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("~/Home.aspx");
    }
}
