using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages.Admin
{
    public partial class Applicants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if admin is logged in. if not redeirect to Admin Login page
            if (Session["Admin"] == null)
            {
                Response.Redirect("/Pages/Login");
            }

            if (!IsPostBack)
            {
                BindAnimalApplicationData();
            }
        }

        public void BindAnimalApplicationData()
        {
            lstGrid.DataSource = AnimalApplication.GetGetApplication(false);
            lstGrid.DataBind();
            lstGridPast.DataSource = AnimalApplication.GetGetApplication(true);
            lstGridPast.DataBind();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //https://www.c-sharpcorner.com/UploadFile/1326ef/transactionscope-in-C-Sharp/
            using (TransactionScope transactionScope = new TransactionScope())
            {
                try
                {
                    Models.Admin admin = (Models.Admin) Session["Admin"];
                    DropDownList dropDownList = sender as DropDownList;
                    int selectedValue = Convert.ToInt32(dropDownList.SelectedItem.Value);
                    int applicationID = Convert.ToInt32(dropDownList.Attributes["applicationID"]);
                    int animalID = Convert.ToInt32(dropDownList.Attributes["animalID"]);
                    AnimalApplication.UpdateAnimalApplicationStatus(applicationID, selectedValue, animalID, admin.AdminID);
                    AnimalApplication.SendEmailToApplicant(applicationID, selectedValue);

                    transactionScope.Complete();
                    transactionScope.Dispose();

                    BindAnimalApplicationData();
                }
                catch (Exception ex)
                {
                    transactionScope.Dispose();
                }
            }
        }

        protected void lstGrid_OnItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                DropDownList ddlStatus = (e.Item.FindControl("ddlStatus") as DropDownList);
                string status = (e.Item.FindControl("lblStatus") as Label).Text;
                ddlStatus.Items.FindByValue(status).Selected = true;
            }
        }

    }
}