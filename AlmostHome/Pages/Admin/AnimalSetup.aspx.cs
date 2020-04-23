using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.IO;
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
                Response.Redirect("/Pages/Login");
            }
            if (!Page.IsPostBack)
            {
                LoadActiveAnimals();
                LoadRehomedAnimals();
            }
        }



        private void LoadActiveAnimals()
        {
            lstAnimal.DataSource = Animal.GetAnimal(false);
            lstAnimal.DataBind();
        }

        private void LoadRehomedAnimals()
        {
            lstRehomed.DataSource = Animal.GetAnimal(true);
            lstRehomed.DataBind();
        }

        protected void btnMoveToActive_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int animalId = Convert.ToInt32(button.Attributes["AnimalID"]);
            Animal.MoveToAvailable(animalId);
            LoadActiveAnimals();
            LoadRehomedAnimals();
        }
    }
}