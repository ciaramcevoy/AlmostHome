using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages.Admin
{
    public partial class AnimalSetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if admin is logged in. if not redeirect to Admin Login page
            if (Session["Admin"] == null)
            {
                Response.Redirect("Login");
            }
        }
    }
}