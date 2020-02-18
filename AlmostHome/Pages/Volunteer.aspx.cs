using AlmostHome.Functions;
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
            if (!IsPostBack)
            {
                
            }
            panelPopup.Visible = false;
            panelMsgPopup.Visible = false;

        }

        protected void btnSubmitQuiz_Click(object sender, EventArgs e)
        {
            
            try
            {
                //validate application by email address
                bool valid = FuncVolunteerApplication.Validate(txtEmail.Text);
                if (!valid)
                {
                    QuizFailed();
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
                        QuizFailed();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void QuizFailed()
        {
            txtContactNumber.Visible = false;
            ddlPreferredUnit.Visible = false;
            ddlAvailability.Visible = false;
            lblPopupHeader.Text = "Warning!";
            lblPopupBody.Text = "Your are not eligible to apply.";
            lblPopupBody.Visible = true;
            btnSubmitApplication.Visible = false;
            panelPopup.Visible = true;
            panelBody.Visible = false;
            btnOk.Visible = true;
            ClearAll();

        }

        public int CalculateScore()
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

        public void QuizPassed()
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
            ddlPreferredUnit.Items.Insert(0, new ListItem("- Select Preferred Unit -", "0"));

            ddlAvailability.DataSource = Setting.AvailabilityList();
            ddlAvailability.DataTextField = "Value";
            ddlAvailability.DataValueField = "ID";
            ddlAvailability.DataBind();
            ddlAvailability.Items.Insert(0, new ListItem("- Select Availability -", "0"));

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
                volunteerApplication.Status = 0;
                volunteerApplication.ContactNumber = Convert.ToInt32(txtContactNumber.Text);
                volunteerApplication.EmailAddress = txtEmail.Text;
                FuncVolunteerApplication.SaveVolunteerApplication(volunteerApplication);
               
                //send email
                string message = "Thank you for applying. We will be in touch with you shortly.";
                SendEmail(volunteerApplication.EmailAddress, "Volunteer Application", PopulateBody(volunteerApplication.VolunteerName.Split(' ')[0], message));

                lblMsgBody.Text = "Application Submitted!";
                panelMsgPopup.Visible = true;
                ClearAll();

            }
            catch (Exception ex)
            {

            }
            finally
            {
                panelBody.Visible = false;
                panelPopup.Visible = false;
            }
            
        }

        public void ClearAll()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            ddlAvailability.SelectedValue = "0";
            ddlPreferredUnit.SelectedValue = "0";
            txtContactNumber.Text = "";
            RadioQ1.SelectedIndex = -1;
            RadioQ2.SelectedIndex = -1;
            RadioQ3.SelectedIndex = -1;
            RadioQ4.SelectedIndex = -1;
            RadioQ5.SelectedIndex = -1;

        }

        private string PopulateBody(string receiverName, string description)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("/Pages/Email/EmailTemplate.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{UserName}", receiverName);
            body = body.Replace("{Description}", description);
            return body;
        }

        private void SendEmail(string recepientEmail, string subject, string body)
        {
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(recepientEmail));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
            }
        }

        //public void SendEmail()
        //{
        //    // creating from to addresses
        //    MailAddress to = new MailAddress("autocarebookings@gmail.com");
        //    MailAddress from = new MailAddress("almosthomestatusapplication@gmail.com");

        //    MailMessage message = new MailMessage(from, to);
        //    message.Subject = "AutoCare Contact";

        //    // creating email body
        //    string BodyMsg = "We have received a contact from AutoCare website.\n\n";
        //    BodyMsg += "Name: " + ContactName.Text + "\n";
        //    BodyMsg += "Email: " + Email.Text + "\n\n";
        //    BodyMsg += "Subject: " + Subject.Text + "\n";
        //    BodyMsg += "Message: " + Message.Text + "\n\n";
        //    BodyMsg += "Thank you!";
        //    //Thank you for applying. We will be in touch with you shortly.
        //    message.Body = BodyMsg;

        //    // set Email server and creditials
        //    SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
        //    {
        //        Credentials = new NetworkCredential("almosthomestatusapplication@gmail.com", "Almosthome1"),
        //        EnableSsl = true
        //    };

        //    try
        //    {
        //        // sending email message
        //        client.Send(message);
        //    }
        //    catch (SmtpException ex)
        //    {
        //    }
        //}
    }
}