using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AlmostHome.Common;
using AlmostHome.Models;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using iTextSharp.tool.xml.css;
using iTextSharp.tool.xml.html;
using iTextSharp.tool.xml.parser;
using iTextSharp.tool.xml.pipeline.css;
using iTextSharp.tool.xml.pipeline.end;
using iTextSharp.tool.xml.pipeline.html;

namespace AlmostHome.Pages.Admin
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("/Pages/Login");
            }
        }

        protected void RunBtn_OnClick(object sender, EventArgs e)
        {
            string redirectUrl = "";
            if (ddlReportType.SelectedValue == "1")
            {
                redirectUrl = "RptAnimalApplications.aspx";
            }
            else if (ddlReportType.SelectedValue == "2")
            {
                redirectUrl = "RptVolunteerApplications.aspx";
            }
            else if (ddlReportType.SelectedValue == "3")
            {
                redirectUrl = "RptAnimals.aspx";
            }
            
            string parameters = "?from=" + txFrom.Text + "&to=" + txtTo.Text;
            if (panelAnimal.Visible == true)
            {
                parameters = parameters + "&filter=" + ddlAnimalStatus.Text;
            }
            
            Response.Redirect("/Pages/Admin/Report/" + redirectUrl + parameters);
        }

        protected void ddlReportType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlReportType.SelectedValue == "3")
            {
                panelAnimal.Visible = true;
            }
            else
            {
                panelAnimal.Visible = false;
            }
        }
    }
}