using AlmostHome.Common;
using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages.Admin.Report
{
    public partial class RptVolunteerApplications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("/Pages/Login");
            }
            if (!IsPostBack)
            {
                BindReportGrid();
            }
        }

        public void BindReportGrid()
        {
            DateTime from = Convert.ToDateTime(Request.QueryString["from"].ToString());
            DateTime to = Convert.ToDateTime(Request.QueryString["to"].ToString());
            DataSet ds = Reporting.GetVolunteerApplication(from, to);
            lstGrid.DataSource = ds;
            lstGrid.DataBind();
            SetReportDetails(ds.Tables[0].Rows.Count);
        }

        public void SetReportDetails(int rowCount)
        {
            Models.Admin admin = (Models.Admin)Session["Admin"];
            lblReporTitle.Text = "Volunteer Applications Report";
            lblFrom.Text = Request.QueryString["from"].ToString();
            lblTo.Text = Request.QueryString["to"].ToString();
            lblReportDate.Text = DateTime.Now.ToShortDateString();
            lblGeneratedBy.Text = admin.Username;
            lblTotalRecords.Text = rowCount.ToString();
        }

        protected void btnDownload_OnClick(object sender, EventArgs e)
        {
            try
            {
                string cssPath = System.Web.HttpContext.Current.Server.MapPath(@"/Content/material-kit/material-kit.css");
                StringBuilder sb = new StringBuilder();
                StringWriter tw = new StringWriter(sb);
                HtmlTextWriter hw = new HtmlTextWriter(tw);
                reportPanel.RenderControl(hw);
                var html = sb.ToString();
                var pdf = PDF.CreatePDF(html, cssPath);
                Response.ContentType = "application/pdf";
                Response.BinaryWrite(pdf);
                Response.AddHeader("content-disposition", "attachment;filename=VolunteerApplicationsReport.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.End();

            }
            catch (Exception ex)
            {

            }

        }
    }
}