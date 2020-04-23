using AlmostHome.Common;
using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome
{
    public partial class Volunteer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panelMsgPopup.Visible = false;
        }

        protected void btnSubmitQuiz_Click(object sender, EventArgs e)
        {
            
            try
            {
                //validate application by email address
                bool valid = VolunteerApplication.Validate(txtEmail.Text);
                if (!valid)
                {
                    QuizFailed("You have been applied recently. Please try again in 6 months time form the previously applied date.");
                }
                else
                {
                    //calculate score
                    int score = CalculateScore();
                    if (score == 5)
                    {
                        QuizPassed();
                    }
                    else
                    {
                        VolunteerApplication.UpdateFailedAttempt(txtEmail.Text);
                        QuizFailed("Sorry you do not meet our volunteering requirements. Please try again in 6 months time.");

                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Unknown Error! Please try again later.");
            }
        }

        private void QuizFailed(string message)
        {
            txtContactNumber.Visible = false;
            ddlPreferredUnit.Visible = false;
            ddlAvailability.Visible = false;
            lblPopupHeader.Text = "Warning!";
            lblPopupBody.Text = message;

            lblPopupBody.Visible = true;
            btnSubmitApplication.Visible = false;
            panelPopup.Visible = true;
            panelBody.Visible = false;
            btnOk.Visible = true;
            ClearAll();

        }

        private int CalculateScore()
        {
            int score = 0;
            if (RadioQ1.SelectedValue.ToString() == "1")
            {
                score += 1;
            }

            if (RadioQ2.SelectedValue.ToString() == "1")
            {
                score += 1;
            }

            if (RadioQ3.SelectedValue.ToString() == "1")
            {
                score += 1;
            }

            if (RadioQ4.SelectedValue.ToString() == "1" || RadioQ4.SelectedValue.ToString() == "3")
            {
                score += 1;
            }

            if (RadioQ5.SelectedValue.ToString() == "1")
            {
                score += 1;
            }

            return score;
        }

        private void QuizPassed()
        {
            lblPopupHeader.Text = "Begin Application";
            txtContactNumber.Visible = true;
            ddlPreferredUnit.Visible = true;
            ddlAvailability.Visible = true;
            btnSubmitApplication.Visible = true;
            btnOk.Visible = false;

            ddlPreferredUnit.DataSource = Setting.UnitList();
            ddlPreferredUnit.DataTextField = "Value";
            ddlPreferredUnit.DataValueField = "ID";
            ddlPreferredUnit.DataBind();
            ddlPreferredUnit.Items.Insert(0, new ListItem("- Select Preferred Unit -", ""));

            ddlAvailability.DataSource = Setting.AvailabilityList();
            ddlAvailability.DataTextField = "Value";
            ddlAvailability.DataValueField = "ID";
            ddlAvailability.DataBind();
            ddlAvailability.Items.Insert(0, new ListItem("- Select Availability -", ""));

            lblPopupBody.Visible = false;
            panelBody.Visible = true;
            panelPopup.Visible = true;

        }

        protected void btnSubmitApplication_Click(object sender, EventArgs e)
        {
            try
            {
                //create object
                VolunteerApplication volunteerApplication = new VolunteerApplication();
                volunteerApplication.VolunteerName = txtName.Text;
                volunteerApplication.ApplicationDate = DateTime.Now;
                volunteerApplication.Availability = Convert.ToInt32(ddlAvailability.SelectedValue);
                volunteerApplication.PreferredUnit = Convert.ToInt32(ddlPreferredUnit.SelectedValue);
                volunteerApplication.Status = 1;
                volunteerApplication.ContactNumber = txtContactNumber.Text;
                volunteerApplication.EmailAddress = txtEmail.Text;
                VolunteerApplication.SaveVolunteerApplication(volunteerApplication);
               
                //send email
                string message = "Thank you for applying. We will be in touch with you shortly.";
                string emailBody = Email.PopulateBody(volunteerApplication.VolunteerName.Split(' ')[0], message);
                Email.SendEmail(volunteerApplication.EmailAddress, "Volunteer Application", emailBody);

                ShowMessage("Application Submitted!");
                ClearAll();

            }
            catch (Exception ex)
            {
                ShowMessage("Application Submission Failed!");
            }
            finally
            {
                panelBody.Visible = false;
                panelPopup.Visible = false;
            }
            
        }

        private void ClearAll()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            ddlAvailability.SelectedValue = "";
            ddlPreferredUnit.SelectedValue = "";
            txtContactNumber.Text = "";
            RadioQ1.SelectedIndex = -1;
            RadioQ2.SelectedIndex = -1;
            RadioQ3.SelectedIndex = -1;
            RadioQ4.SelectedIndex = -1;
            RadioQ5.SelectedIndex = -1;
        }

        private void ShowMessage(string messageText)
        {
            lblMsgBody.Text = messageText;
            panelMsgPopup.Visible = true;
        }
    }
}