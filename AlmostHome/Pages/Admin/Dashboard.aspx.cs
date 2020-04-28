using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if admin is logged in. if not redirect to Admin Login page
            if (Session["Admin"] == null)
            {
                Response.Redirect("/Pages/Login");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<TypeObject> GetAnimalsByType(bool isRehomed)
        {
            return Animal.GetAnimalsByType(isRehomed);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static int[] GetWeeklyVolunteerApplicants()
        {
            return VolunteerApplication.GetWeeklyVolunteerApplicants();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static int[] GetWeeklyApplicants()
        {
            return AnimalApplication.GetWeeklyApplicants();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static int[] GetWeeklyRehomedAnimals()
        {
            return Animal.GetWeeklyRehomedAnimals();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static int GetAnimalCounts(bool rehomed, bool all)
        {
            return Animal.GetAnimalCounts(rehomed, all);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static int GetVolunteerCount()
        {
            return Models.Volunteer.GetVolunteerCount();
        }
    }
    
}