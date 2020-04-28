using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages.Admin
{
    public partial class AnimalTypeSetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if admin is logged in. if not redirect to Admin Login page
            if (Session["Admin"] == null)
            {
                Response.Redirect("/Pages/Login");
            }

            LoadTypes();
        }

        protected void SaveAnimalType(object sender, EventArgs e)
        {

            try
            {
                bool valid = AnimalType.ValidateAnimalType(txtAnimalType.Text);
                if (valid)
                {

                    AnimalType.SaveAnimalType(txtAnimalType.Text);
                    ShowSuccessMessage("The Animal Type saved successfully.");
                    LoadTypes();
                    txtAnimalType.Text = "";
                }
                else
                {
                    ShowError("This Animal Type already exists in the database. Please use a unique type.");
                }

            }
            catch (Exception ex)
            {
                ShowError("Something went wrong. Please try again.");
            }
        }

        private void LoadTypes()
        {
            lstType.DataSource = AnimalType.GetAnimalType();
            lstType.DataBind();
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

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int animalTypeID = Convert.ToInt32(button.Attributes["AnimalTypeID"]);
            AnimalType.DeleteAnimalType(animalTypeID);
            LoadTypes();
        }
    }
}