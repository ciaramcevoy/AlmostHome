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

namespace AlmostHome
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            //get connection string from the config file
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //sql connection object initilisation
            SqlConnection con = new SqlConnection(connectionString);

            try
            {
                string username = usernameTxt.Text;
                string password = passwordTxt.Text;

                //select query string
                string query = "select * from Admin where Username=@username and Password=@password";

                //open the connection to the database
                con.Open();

                //select sql command object to send query to the database
                SqlCommand cmd = new SqlCommand(query, con);

                //username and password are added as parameters
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                //check for the data
                SqlDataAdapter sda = new SqlDataAdapter(cmd); 
                DataTable dt = new DataTable();

                //fill the table
                sda.Fill(dt);
                
              
                if (dt.Rows.Count > 0)
                {  //if data row count is greater than 0 (which means there is valid data), then redirect admin to admin page
                    Response.Redirect("AdminPage.aspx");
                }
                else
                {
                    //if not show error message in the label
                    LblLoginMessage.Text = "Your Username or Password is incorrect. Please try again.";
                    LblLoginMessage.ForeColor = System.Drawing.Color.Red;

                }

                

            }
            catch (Exception ex)
            {
                //if there are any system errors the below error message will appear
                LblLoginMessage.Text = "Login Page Error.";
                LblLoginMessage.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                //close connection
                con.Close();

            }
        }

        protected void usernameTxt_TextChanged(object sender, EventArgs e)
        {

        }
    }
}