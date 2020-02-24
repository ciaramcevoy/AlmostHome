using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages.Admin
{
    public partial class AnimalSetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if admin is logged in. if not redeirect to Admin Login page
            if (Session["Admin"] == null)
            {
                Response.Redirect("Login");
            }
            if (!Page.IsPostBack)
            {
                BindAnimalTypes();
                LoadAnimals();
            }
        }

        public void BindAnimalTypes()
        {
            ddlAnimalType.DataSource = AnimalType.GetAnimalType();
            ddlAnimalType.DataValueField = "AnimalTypeID";
            ddlAnimalType.DataTextField = "Type";
            ddlAnimalType.DataBind();
        }

        protected void SaveAnimal(object sender, EventArgs e)
        {
            try
            {
                string folderPath = Server.MapPath("/images/ImageAnimals/");
                string fileName = Path.GetFileName(imageUpload.FileName);

                Animal animal = new Animal();
                animal.AnimalType = Convert.ToInt32(ddlAnimalType.SelectedValue);
                animal.AnimalAge = Convert.ToInt32(txtAnimalAge.Text);
                animal.AnimalName = txtAnimalName.Text;
                animal.Children = Convert.ToBoolean(ddlChildren.SelectedValue);
                animal.SecureGarden = Convert.ToBoolean(ddlSecureGarden.SelectedValue);
                animal.OtherPets = Convert.ToBoolean(ddlOtherPets.SelectedValue);
                animal.ImageUrl = fileName;

                Animal.SaveAnimal(animal);

                //Save the File to the Directory (Folder).
                imageUpload.SaveAs(folderPath + fileName);
                ShowSuccessMessage("The Animal saved successfully.");
                Clear();
                LoadAnimals();


            }
            catch (Exception ex)
            {
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

        public void Clear()
        {
            ddlAnimalType.SelectedValue = "1";
            ddlChildren.SelectedValue = "1";
            ddlSecureGarden.SelectedValue = "1";
            ddlOtherPets.SelectedValue = "1";
            txtAnimalAge.Text = "";
            txtAnimalName.Text = "";
            imageUpload = new FileUpload();
        }

        private void LoadAnimals()
        {
            lstAnimal.DataSource = Animal.GetAnimal();
            lstAnimal.DataBind();
        }
    }
}