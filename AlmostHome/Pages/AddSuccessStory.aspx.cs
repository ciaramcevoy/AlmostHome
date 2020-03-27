using AlmostHome.Common;
using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages
{
    public partial class AddSuccessStory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitStory(object sender, EventArgs e)
        {
            try
            {

                string folderPath = Server.MapPath("/images/SuccessStory/");
                string fileName = Path.GetFileName(imageUploader.FileName);
                if (fileName != "")
                {
                    //Save the File to the Directory (Folder).
                    imageUploader.SaveAs(folderPath + fileName);
                }

                //create object
                SuccessStory successStory = new SuccessStory();
                successStory.Name = txtName.Text;
                successStory.StroryDescription = txtStoryDescription.Text;
                successStory.Image = fileName;

                //save success stories
                SuccessStory.SaveSuccessStory(successStory);

                //send email to admin
                string adminMessage = "New success story submitted by " + successStory;
                string adminEmailBody = Email.PopulateBody("Admin", adminMessage);
                Email.SendEmail("almosthomestatusapplication@gmail.com", "New Success Story", adminEmailBody);

                //clear form
                txtName.Text = "";
                txtStoryDescription.Text = "";
                successStory.Image = "";

                //show success message
                ShowSuccessMessage("Your story has been successfully uploaded and sent to admin.");

            }
            catch (Exception ex)
            {
                ShowError("Something went wrong. Please try again.");
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