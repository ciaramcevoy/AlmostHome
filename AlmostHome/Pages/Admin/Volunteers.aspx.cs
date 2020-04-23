using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AlmostHome.Models;
using System.Data;
using System.Transactions;

namespace AlmostHome.Pages.Admin
{
    public partial class Volunteers : System.Web.UI.Page
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
                BindVolunteerApplicationData();
            }
        }

        private void BindVolunteerApplicationData()
        {
            lstGrid.DataSource = VolunteerApplication.GetVolunteerApplication(true);
            lstGrid.DataBind();
            lstGridPast.DataSource = VolunteerApplication.GetVolunteerApplication(false);
            lstGridPast.DataBind();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //https://www.c-sharpcorner.com/UploadFile/1326ef/transactionscope-in-C-Sharp/
            using (TransactionScope transactionScope = new TransactionScope())
            {

                try
                {
                    Models.Admin admin = (Models.Admin)Session["Admin"];
                    DropDownList dropDownList = sender as DropDownList;
                    int selectedValue = Convert.ToInt32(dropDownList.SelectedItem.Value);
                    int volunteerApplicationID = Convert.ToInt32(dropDownList.Attributes["volunteerApplicationID"]);
                    VolunteerApplication.UpdateVolunteerApplicationStatus(volunteerApplicationID, selectedValue, admin.AdminID);
                    VolunteerApplication.SendEmailToApplicant(volunteerApplicationID, selectedValue);
                    transactionScope.Complete();
                    transactionScope.Dispose();

                    BindVolunteerApplicationData();
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

                Label lblPreferredUnit = (Label)e.Item.FindControl("lblPreferredUnit");
                int preferredUnit = Convert.ToInt32(lblPreferredUnit.Attributes["PreferredUnit"]);
                lblPreferredUnit.Text = Setting.UnitList().Find(x => x.ID == preferredUnit).Value;

                Label lblAvailability = (Label)e.Item.FindControl("lblAvailability");
                int availability = Convert.ToInt32(lblPreferredUnit.Attributes["PreferredUnit"]);
                lblAvailability.Text = Setting.AvailabilityList().Find(x => x.ID == availability).Value;
            }
        }

        protected void lstGridPast_OnItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblPreferredUnit = (Label)e.Item.FindControl("lblPreferredUnit");
                int preferredUnit = Convert.ToInt32(lblPreferredUnit.Attributes["PreferredUnit"]);
                lblPreferredUnit.Text = Setting.UnitList().Find(x => x.ID == preferredUnit).Value;

                Label lblAvailability = (Label)e.Item.FindControl("lblAvailability");
                int availability = Convert.ToInt32(lblPreferredUnit.Attributes["PreferredUnit"]);
                lblAvailability.Text = Setting.AvailabilityList().Find(x => x.ID == availability).Value;
            }
        }

    }
}
