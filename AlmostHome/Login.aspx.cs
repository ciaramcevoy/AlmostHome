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
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string username = usernameTxt.Text;
                string password = passwordTxt.Text;

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                string query = "select * from Admin where Username=@username and Password=@password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("Pages/AdminPage.aspx");
                }
                else
                {
                    LblLoginMessage.Text = "Your Username or Password is incorrect. Please try again.";
                    LblLoginMessage.ForeColor = System.Drawing.Color.Red;

                }

            }
            catch (Exception ex)
            {
                LblLoginMessage.Text = "Login Page Error.";
                LblLoginMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}