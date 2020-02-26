using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
            gvAdoptApplication.DataSource = AnimalApplication.GetGetApplication();
            gvAdoptApplication.DataBind();
        }

        protected void gvAdoptApplication_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAdoptApplication.PageIndex = e.NewPageIndex;
            BindAnimalApplicationData();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRow dr = ((System.Data.DataRowView)e.Row.DataItem).Row;
                if (dr != null)
                {
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
                GridViewRow row = (GridViewRow)dropDownList.Parent.Parent;
                int selectedValue = Convert.ToInt32(dropDownList.SelectedItem.Value);
                int rowIndex = row.RowIndex;
                int applicationID = Convert.ToInt32(gvAdoptApplication.DataKeys[rowIndex].Values[0]);
                int animalID = Convert.ToInt32(gvAdoptApplication.DataKeys[rowIndex].Values[1]);
                AnimalApplication.UpdateAnimalApplicationStatus(applicationID, selectedValue, animalID);
                AnimalApplication.SendEmailToApplicant(applicationID, selectedValue);
                BindAnimalApplicationData();
            }
            catch (Exception ex)
            {

            }

        }
    }
}