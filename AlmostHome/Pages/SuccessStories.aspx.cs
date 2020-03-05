using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages
{
    public partial class SuccessStories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindSuccessStories();
            }
        }

        public void BindSuccessStories()
        {
            lstSuccessStories.DataSource = SuccessStory.GetSuccessStories();
            lstSuccessStories.DataBind();

        }
    }
}