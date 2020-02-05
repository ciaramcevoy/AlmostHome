using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmostHome.Pages
{
    public partial class AnimalDatabase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            BindDataToGrid();

        }

        public void BindDataToGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "select AnimalType,AnimalName,AnimalAge,Children,SecureGarden,OtherPets,ImageUrl from Animal";
            SqlConnection con = new SqlConnection(connectionString);
            try
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sqlDataAdapter.Fill(dt);
                GridAnimalDb.DataSource = dt;
                GridAnimalDb.DataBind();

            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }

        }
    }
}