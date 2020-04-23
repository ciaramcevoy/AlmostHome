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
                application.Status = 1;
                application.ApplicantID = apllicantId;

                //save application
                AnimalApplication.SaveAnimalApplication(application);
                //get animal
                Animal animal = Animal.GetAnimalByAnimalID(application.AnimalID.ToString());

                //send email to admin
                string adminMessage = "New adoption request submitted for " + animal.AnimalName + " by " + applicant.ApplicantName + "(Contact No. " + applicant.ContactNumber + ")";
                string adminEmailBody = Email.PopulateBody("Team", adminMessage);
                Email.SendEmail("almosthomestatusapplication@gmail.com", "New Adoption Request Received - Applicant ID " + application.ApplicantID, adminEmailBody);
                
                

                //send email to applicant
                string applicantMessage = "Your adoption request submitted for " + animal.AnimalName + " successfully.";
                string applicantEmailBody = Email.PopulateBody(applicant.ApplicantName.Split(' ')[0], applicantMessage);
                Email.SendEmail(applicant.EmailAddress, "Adoption Application Submitted", applicantEmailBody);

                ShowSuccessMessage("Adoption application submitted successfully.");
                //call javascript function - redirect function
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "Redirect('/Pages/Adopt');", true);
            }
            catch (Exception ex)
            {
                ShowError("Something went wrong. Please try again.");
            }
            
        }

        public void ShowError(string errorMessage)
        {
            lblError.Text = errorMessage;
            panelError.Visible = true;
            panelSuccess.Visible = false;
        }

        public void ShowSuccessMessage(string message)
        {
            panelError.Visible = false;
            lblSuccess.Text = message;
            panelSuccess.Visible = true;
        }
    }
}