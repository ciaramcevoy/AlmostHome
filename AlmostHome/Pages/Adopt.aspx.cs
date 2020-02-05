using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AlmostHome;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace AlmostHome
{
    public partial class Adopt : System.Web.UI.Page
    {
      protected void Page_Load(object sender, EventArgs e)
      {

            if (!Page.IsPostBack)
            {
                //bind data to animal age dropdown list
                BindAgeDropdownList();
                LblSearchMessage.Text = "";
            }
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            //get connection string from the config file
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //sql connection object initilization
            SqlConnection con = new SqlConnection(connectionString);
            try
            {
               
                //select query string
                string query = "select AnimalType,AnimalName,AnimalAge,Children,SecureGarden,OtherPets,ImageUrl from Animal " +
                               "where AnimalType=@animalType and Children=@children and SecureGarden=@secureGarden and OtherPets=@otherPets " +
                               "and ((@animalAge=1 AND AnimalAge BETWEEN 0 AND 3) OR (@animalAge=2 AND AnimalAge BETWEEN 3 AND 6) " +
                               "OR (@animalAge=3 AND AnimalAge > 6))";

                //open connection to the database
                con.Open();
                //sql command object - to send query to the database
                SqlCommand cmd = new SqlCommand(query, con);
                //search criterias are added as parameters
                cmd.Parameters.AddWithValue("@animalType", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@animalAge", DropDownList2.SelectedValue);
                cmd.Parameters.AddWithValue("@children", DropDownList3.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@secureGarden ", DropDownList4.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@otherPets", DropDownList5.SelectedValue.Trim());

                //read for the data using sql adapter object
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    //fill the data table using data adapter
                    sda.Fill(dt);
                   
                    if (dt.Rows.Count > 0)
                    {
                        //if there are results then add data to session and redirect user to SearchResults page
                        Session["SearchResult"] = dt;
                        Response.Redirect("/Pages/SearchResults.aspx");
                    }
                    else
                    {
                        //if no result show lable to indicate user that there are no results found.
                        LblSearchMessage.Text = "No Records Found!";
                        LblSearchMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }

            }
            catch (Exception ex)
            {
                //If there are any system errors then display this error message
                LblSearchMessage.Text = "Page Error. Please Refresh the Page.";
                LblSearchMessage.ForeColor = System.Drawing.Color.Red;

            }
            finally
            {
                //close connection
                con.Close();

            }

        }
        public void BindAgeDropdownList()
        {
            DropDownList2.Items.Add(new ListItem("0-3", "1"));
            DropDownList2.Items.Add(new ListItem("3-6", "2"));
            DropDownList2.Items.Add(new ListItem("6+", "3"));
        }


    }
}