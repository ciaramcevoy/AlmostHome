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

            try
            {
                panelSearchResult.Visible = true;
                int animalType = Convert.ToInt32(ddlAnimalType.SelectedValue); 
                int animalAge = Convert.ToInt32(ddlAnimalAge.SelectedValue);
                bool children = Convert.ToBoolean(ddlChildren.SelectedValue);
                bool secureGarden= Convert.ToBoolean(ddlSecureGarden.SelectedValue);
                bool otherPets = Convert.ToBoolean(ddlOtherPets.SelectedValue);

                DataTable dt = Animal.GetSearchResult(animalType, animalAge, children, secureGarden, otherPets);

                if (dt.Rows.Count > 0)
                {
                    panelWarn.Visible = false;
                    panelError.Visible = false;
                    lstSearchResult.DataSource = dt;
                    lstSearchResult.DataBind();
                }
                else
                {
                    lstSearchResult.DataSource = null;
                    lstSearchResult.DataBind();
                    ShowWarning();
                }
            }
            catch(Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        public void BindAnimalTypes()
        {
            ddlAnimalType.DataSource = AnimalType.GetAnimalType();
            ddlAnimalType.DataValueField = "AnimalTypeID";
            ddlAnimalType.DataTextField = "Type";
            ddlAnimalType.DataBind();
        }

        public void ShowError(string errorMessage)
        {
            panelWarn.Visible = false;
            lblError.Text = errorMessage;
            panelError.Visible = true;
        }

        public void ShowWarning()
        {
            panelError.Visible = false;
            lblWarn.Text = "No Records Found!";
            panelWarn.Visible = true;
        }
    }
}