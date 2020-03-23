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
    public partial class AnimalForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            // check if admin is logged in. if not redeirect to Admin Login page
            if (Session["Admin"] == null)
            {
                Response.Redirect("/Pages/Login");
            }
            if (!Page.IsPostBack)
            {
                BindAnimalTypes();
                string animalId = Request.QueryString["id"];
                if (animalId != null || animalId != "")
                {
                    SetValues(animalId);
                }
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
                animal.AnimalID = Convert.ToInt32(hdnAnimalID.Value);

                Animal.SaveAnimal(animal);

                if (fileName != "")
                {
                    //Save the File to the Directory (Folder).
                    imageUpload.SaveAs(folderPath + fileName);
                }
                Response.Redirect("/Pages/Admin/AnimalSetup");

            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        public void ShowError(string errorMessage)
        {
            lblError.Text = errorMessage;
            panelError.Visible = true;
        }

        public void SetValues(string animalId)
        {
            Animal animal = Animal.GetAnimalByAnimalID(animalId);
            if (animal != null)
            {
                txtAnimalName.Text = animal.AnimalName;
                txtAnimalAge.Text = animal.AnimalAge.ToString();
                ddlAnimalType.SelectedValue = animal.AnimalType.ToString();
                ddlChildren.SelectedValue = animal.Children.ToString();
                ddlOtherPets.SelectedValue = animal.OtherPets.ToString();
                ddlSecureGarden.SelectedValue = animal.SecureGarden.ToString();
                hdnAnimalID.Value = animal.AnimalID.ToString();
                if (animal.ImageUrl != "")
                {
                    animalImage.ImageUrl = "/images/ImageAnimals/" + animal.ImageUrl;
                }
                else
                {
                    animalImage.ImageUrl = "/images/ImageAnimals/default.png";
                }
            }
        }

        protected void DeleteAnimal(object sender, EventArgs e)
        {
            try
            {
                int animalId = Convert.ToInt32(hdnAnimalID.Value);
                Animal.DeleteAnimal(animalId);
                Response.Redirect("/Pages/Admin/AnimalSetup");

            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }

        }
    }
}