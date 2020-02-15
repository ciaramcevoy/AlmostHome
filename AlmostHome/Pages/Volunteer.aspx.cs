using AlmostHome.Functions;
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
            //Mornings
                //Afternoons
            //Evenings
        }

        protected void btnSubmitQuiz_Click(object sender, EventArgs e)
        {
            //create object
            VolunteerApplication volunteerApplication = new VolunteerApplication();
            volunteerApplication.VolunteerName = txtName.Text;
            volunteerApplication.ApplicationDate = DateTime.Now;
            volunteerApplication.Availability = -1;
            volunteerApplication.PreferredUnit = -1;
            volunteerApplication.Status = -1;
            volunteerApplication.ContactNumber = -1;
            volunteerApplication.EmailAddress = txtEmail.Text;
            try
            {
                bool valid = FuncVolunteerApplication.Validate(volunteerApplication.EmailAddress);
                if (valid)
                {
                    FuncVolunteerApplication.SaveVolunteerApplication(volunteerApplication);
                }
            }
            catch (Exception ex)
            {

            }
        }

    }
}