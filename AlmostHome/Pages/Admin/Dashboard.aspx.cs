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
    }
    
}