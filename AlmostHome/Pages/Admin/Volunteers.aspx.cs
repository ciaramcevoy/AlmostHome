using AlmostHome.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AlmostHome.Models;
using System.Data;

namespace AlmostHome.Pages.Admin
{
    public partial class Volunteers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if admin is logged in. if not redeirect to Admin Login page
            if (Session["Admin"] == null)
            {
                Response.Redirect("Login");
            }

            if (!IsPostBack)
            {
                BindVolunteerApplicationData();
            }
        }

        public void BindVolunteerApplicationData()
        {
            gvVolunteerApplication.DataSource = FuncAdmin.GetVolunteerApplication();
            gvVolunteerApplication.DataBind();
        }

        protected void gvVolunteerApplication_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVolunteerApplication.PageIndex = e.NewPageIndex;
            BindVolunteerApplicationData();
        }
        
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRow dr = ((System.Data.DataRowView)e.Row.DataItem).Row;
                if (dr != null)
                {
                    ((Label) e.Row.FindControl("lblPreferredUnit")).Text = Setting.UnitList().Find(x => x.ID == Convert.ToInt32(dr["PreferredUnit"])).Value;
                    ((Label)e.Row.FindControl("lblAvailability")).Text = Setting.AvailabilityList().Find(x => x.ID == Convert.ToInt32(dr["Availability"])).Value;
                    DropDownList ddlStatus = (e.Row.FindControl("ddlStatus") as DropDownList);
                    string status = (e.Row.FindControl("lblStatus") as Label).Text;
                    ddlStatus.Items.FindByValue(status).Selected = true;
               }
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList dropDownList = sender as DropDownList;
                GridViewRow row = (GridViewRow) dropDownList.Parent.Parent;
                int selectedValue = Convert.ToInt32(dropDownList.SelectedItem.Value);
                int rowIndex = row.RowIndex;
                int volunteerApplicationID = Convert.ToInt32(gvVolunteerApplication.DataKeys[rowIndex].Values[0]);
                FuncAdmin.UpdateVolunteerApplicationStatus(volunteerApplicationID, selectedValue);
                FuncAdmin.SendEmailToApplicant(volunteerApplicationID, selectedValue);
            }
            catch (Exception ex)
            {

            }
            
        }
        
       

    }
}
