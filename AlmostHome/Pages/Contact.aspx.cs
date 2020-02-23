using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendContactUsEmail(object sender, EventArgs e)
        {
            try
            {
                //send email
                string emailBody = Email.PopulateContactUsMailBody(txtContactName.Text, txtEmail.Text, txtContactNumber.Text, txtMessage.Text);
                Email.SendEmail("almosthomestatusapplication@gmail.com", txtSubject.Text, emailBody);
                ShowSuccessMessage("Your message has been successfully sent.");

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

    }
}