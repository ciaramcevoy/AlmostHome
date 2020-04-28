using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages.Admin
{
    public partial class ReviewSuccessStories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if admin is logged in. if not redirect to Admin Login page
            if (Session["Admin"] == null)
            {
                Response.Redirect("/Pages/Login");
            }
            BindSuccessStories();
        }


        public void BindSuccessStories()
        {
            lstSuccessStories.DataSource = SuccessStory.GetSuccessStories(false);
            lstSuccessStories.DataBind();

        }

        [WebMethod]
        public static void UpdateSuccessStoryStatus(string storyID, string status)
        {
            SuccessStory.UpdateSuccessStoryStatus(Convert.ToInt32(storyID), Convert.ToBoolean(status));
        }
    }
}