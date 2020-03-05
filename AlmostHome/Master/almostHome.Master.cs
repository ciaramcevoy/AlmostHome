using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AlmostHome.Models;

namespace AlmostHome
{
    public partial class almostHome : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strPage = Page.AppRelativeVirtualPath;
            if (strPage.ToLower().Contains("default"))
            {
                panelMainBanner.Visible = true;
            }

            if (Session["Admin"] == null)
            {
                navAdmin.Visible = false;
                navLogin.Visible = true;
            }
            else
            {
                navAdmin.Visible = true;
                navLogin.Visible = false;
                Admin admin = (Admin)Session["Admin"];
                lblUsername.Text = admin.Username;
            }
        }
    }
}