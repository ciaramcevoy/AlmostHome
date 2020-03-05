using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages.Admin
{
    public partial class AdminRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if admin is logged in. if not redeirect to Admin Login page
            if (Session["Admin"] == null)
            {
                Response.Redirect("/Pages/Login");
            }
        }

        protected void Register(object sender, EventArgs e)
        {
            try
            {
                //validate
                bool valid = Models.Admin.ValidateUsername(txtUsername.Text);
                if (valid)
                {

                    Models.Admin.SaveAdmin(txtUsername.Text, txtPassword.Text);
                    ShowSuccessMessage("The Admin registered successfully.");
                }
                else
                {
                    ShowError("The Username already exist in the database. Please try again with a different Username");
                }

            }
            catch (Exception ex)
            {
                // displays error messsage
                ShowError(ex.Message);
            }
        }

        public void ShowError(string errorMessage)
        {
            panelSuccess.Visible = false;
            lblError.Text = errorMessage;
            panelError.Visible = true;
        }

        public void ShowSuccessMessage(string message)
        {
            panelError.Visible = false;
            lblSuccess.Text = message;
            panelSuccess.Visible = true;
        }
    }
}