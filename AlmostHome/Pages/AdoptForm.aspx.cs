using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AlmostHome.Common;
using AlmostHome.Models;

namespace AlmostHome.Pages
{
    public partial class AdoptForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string animalId = Request.QueryString["id"];
            Animal animal = Animal.GetAnimalByAnimalID(animalId);
            lblAnimalName.Text = animal.AnimalName;
            lblAnimalAge.Text = animal.AnimalAge.ToString();
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

        protected void SubmitApplication(object sender, EventArgs e)
        {
            try
            {
                //create applicant obejct
                Applicant applicant = new Applicant();
                applicant.ApplicantName = txtApplicantName.Text;
                applicant.ContactNumber = txtContactNumber.Text;
                applicant.EmailAddress = txtEmailAddress.Text;

                //save applicant
                int apllicantId = Applicant.SaveApplicant(applicant);

                //create application object
                AnimalApplication application = new AnimalApplication();
                application.AnimalID = Convert.ToInt32(hdnAnimalID.Value);
                application.Status = 0;
                application.ApplicantID = apllicantId;

                //save application
                AnimalApplication.SaveAnimalApplication(application);

                //send email to admin
                string adminMessage = "New adoption request submitted for Animal ID : " + application.AnimalID + " by " + applicant.ApplicantName + "(Contact No. " + applicant.ContactNumber + ")";
                string adminEmailBody = Email.PopulateBody("Team", adminMessage);
                Email.SendEmail("almosthomestatusapplication@gmail.com", "New Adoption Request Received - Applicant ID " + application.ApplicantID, adminEmailBody);

                //send email to applicant
                string applicantMessage = "Your adoption request submitted for Animal ID : " + application.AnimalID + " successfully.";
                string applicantEmailBody = Email.PopulateBody(applicant.ApplicantName.Split(' ')[0], applicantMessage);
                Email.SendEmail(applicant.EmailAddress, "Adoption Application Submitted", applicantEmailBody);

                Response.Redirect("/Pages/Adopt");
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


    }
}