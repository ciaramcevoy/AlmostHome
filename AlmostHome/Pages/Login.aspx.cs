using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;
using AlmostHome.Common;
using AlmostHome.Models;

namespace AlmostHome
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {

            try
            {
                // creating blank object of Admin
                Admin adminModel = null;

                // filling admin object
                adminModel = Admin.Login(txtUsername.Text);

                if (adminModel == null)
                {
                    // if admin object is not filled, display invalid login details message
                    ShowError("Invalid Username.");
                }
                else
                {
                    //compare password
                    if (txtPassword.Text == Encryption.Decrypt(adminModel.Password))
                    {
                        // if login is success, stores admin object into a session and redirects to Admin page
                        Session["Admin"] = adminModel;
                        Response.Redirect("/Pages/Admin/Index");
                    }
                    else
                    {
                        ShowError("Invalid Password.");
                    }
                    
                    
                }
            }
            catch (Exception ex)
            {
                // displays error messsage
                ShowError(ex.Message);
            }

        }

        public void ShowError(string errorMessage)
        {
            lblError.Text = errorMessage;
            panelError.Visible = true;
        }
    }
}