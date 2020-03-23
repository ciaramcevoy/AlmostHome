using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AlmostHome;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using AlmostHome.Common;
using AlmostHome.Models;

namespace AlmostHome
{
    public partial class Adopt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindAnimalTypes();
            }
        }


        protected void SearchAnimals(object sender, EventArgs e)
        {
            //create animal filter object

            Animal animalFilter = new Animal();
            animalFilter.AnimalType = Convert.ToInt32(ddlAnimalType.SelectedValue);
            animalFilter.AnimalAge = Convert.ToInt32(ddlAnimalAge.SelectedValue);
            animalFilter.Children = Convert.ToBoolean(ddlChildren.SelectedValue);
            animalFilter.SecureGarden = Convert.ToBoolean(ddlSecureGarden.SelectedValue);
            animalFilter.OtherPets = Convert.ToBoolean(ddlOtherPets.SelectedValue);

            //store the filter object in session
            Session["AnimalFilter"] = animalFilter;
            //redirect to search page
            Response.Redirect("/Pages/Search");


        }

        public void BindAnimalTypes()
        {
            ddlAnimalType.DataSource = AnimalType.GetAnimalType();
            ddlAnimalType.DataValueField = "AnimalTypeID";
            ddlAnimalType.DataTextField = "Type";
            ddlAnimalType.DataBind();
        }
       
    }
}