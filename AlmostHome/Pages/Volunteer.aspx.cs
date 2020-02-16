﻿using AlmostHome.Functions;
using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome
{
    public partial class Volunteer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                
            //}
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
                ClearAll();
                lblMsgBody.Text = "Application Sent Successfully";
                panelMsgPopup.Visible = true;

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
    }
}