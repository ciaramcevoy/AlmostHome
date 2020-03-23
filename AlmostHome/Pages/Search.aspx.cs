using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome
{
    public partial class Search : System.Web.UI.Page
    {
        private int PageSize = 8;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindAnimalTypes();
            }

            //check for AnimalFilter session 
            if (Session["AnimalFilter"] != null)
            {
                //cast session into Animal object
                Animal animalFilter = (Animal) Session["AnimalFilter"];

                //set filter values using settion object
                ddlAnimalType.SelectedValue = animalFilter.AnimalType.ToString();
                ddlAnimalAge.SelectedValue = animalFilter.AnimalAge.ToString();
                ddlChildren.SelectedValue = animalFilter.Children.ToString();
                ddlSecureGarden.SelectedValue = animalFilter.SecureGarden.ToString();
                ddlOtherPets.SelectedValue = animalFilter.OtherPets.ToString();

                //call search method
                SearchAnimalData(animalFilter, 1);
                //assign animalfilter session with null
                Session["AnimalFilter"] = null;
            }

        }

        protected void SearchAnimals(object sender, EventArgs e)
        {
            Animal animalFilter = new Animal();
            animalFilter.AnimalType = Convert.ToInt32(ddlAnimalType.SelectedValue);
            animalFilter.AnimalAge = Convert.ToInt32(ddlAnimalAge.SelectedValue);
            animalFilter.Children = Convert.ToBoolean(ddlChildren.SelectedValue);
            animalFilter.SecureGarden = Convert.ToBoolean(ddlSecureGarden.SelectedValue);
            animalFilter.OtherPets = Convert.ToBoolean(ddlOtherPets.SelectedValue);
            SearchAnimalData(animalFilter, 1);
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
      
        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            Animal animalFilter = new Animal();
            animalFilter.AnimalType = Convert.ToInt32(ddlAnimalType.SelectedValue);
            animalFilter.AnimalAge = Convert.ToInt32(ddlAnimalAge.SelectedValue);
            animalFilter.Children = Convert.ToBoolean(ddlChildren.SelectedValue);
            animalFilter.SecureGarden = Convert.ToBoolean(ddlSecureGarden.SelectedValue);
            animalFilter.OtherPets = Convert.ToBoolean(ddlOtherPets.SelectedValue);
            SearchAnimalData(animalFilter, pageIndex);
        }

        public void SearchAnimalData(Animal animalFilter, int pageIndex)
        {
            try
            {
                int rowCount = 0;
                DataTable dt = Animal.GetSearchResult(animalFilter, pageIndex, PageSize, out rowCount);

                if (dt.Rows.Count > 0)
                {
                    panelWarn.Visible = false;
                    panelError.Visible = false;
                    lstSearchResult.DataSource = dt;
                    lstSearchResult.DataBind();
                    PopulatePager(rowCount, pageIndex);
                }
                else
                {
                    lstSearchResult.DataSource = null;
                    lstSearchResult.DataBind();
                    ShowWarning();
                }
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        private void PopulatePager(int recordCount, int currentPage)
        {
            List<ListItem> pages = new List<ListItem>();

            int startIndex, endIndex;
            int pagerSpan = 8;

            //Calculate the Start and End Index of pages to be displayed.
            double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            startIndex = currentPage > 1 && currentPage + pagerSpan - 1 < pagerSpan ? currentPage : 1;
            endIndex = pageCount > pagerSpan ? pagerSpan : pageCount;
            if (currentPage > pagerSpan % 2)
            {
                if (currentPage == 2)
                {
                    endIndex = 5;
                }
                else
                {
                    endIndex = currentPage + 2;
                }
            }
            else
            {
                endIndex = (pagerSpan - currentPage) + 1;
            }

            if (endIndex - (pagerSpan - 1) > startIndex)
            {
                startIndex = endIndex - (pagerSpan - 1);
            }

            if (endIndex > pageCount)
            {
                endIndex = pageCount;
                startIndex = ((endIndex - pagerSpan) + 1) > 0 ? (endIndex - pagerSpan) + 1 : 1;
            }

            //Add the First Page Button.
            if (currentPage > 1)
            {
                pages.Add(new ListItem("First", "1"));
            }

            //Add the Previous Button.
            if (currentPage > 1)
            {
                pages.Add(new ListItem("<<", (currentPage - 1).ToString()));
            }

            for (int i = startIndex; i <= endIndex; i++)
            {
                pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
            }

            //Add the Next Button.
            if (currentPage < pageCount)
            {
                pages.Add(new ListItem(">>", (currentPage + 1).ToString()));
            }

            //Add the Last Button.
            if (currentPage != pageCount)
            {
                pages.Add(new ListItem("Last", pageCount.ToString()));
            }
            rptPager.DataSource = pages;
            rptPager.DataBind();
        }
        
    }
}