using AlmostHome.Common;
using AlmostHome.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmostHome.Functions
{
    public class FuncVolunteerApplication
    {

        public static bool Validate(string emailAddress)
        {

            SqlDataReader rd;
            //getting the database connectivity
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            //set command type as stored procedure
            SqlCommand cmd = new SqlCommand("sp_validate_VolunteerApplication", con);
            cmd.CommandType = CommandType.StoredProcedure;
            // Passing parameters
            cmd.Parameters.AddWithValue("EmailAddress", emailAddress);
            con.Open();
            //get row count (if no records count is 0)
            int rowCount = (int)cmd.ExecuteScalar();
            con.Close();
            if (rowCount > 0)
            {
                return false;
            }

            return true;
        }

        public static void SaveVolunteerApplication(VolunteerApplication volunteerApplication)
        {
            //getting the database connectivity
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            //set command type as stored procedure
            SqlCommand cmd = new SqlCommand("sp_save_VolunteerApplication", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //setting parameters
            cmd.Parameters.AddWithValue("VolunteerName", volunteerApplication.VolunteerName);
            cmd.Parameters.AddWithValue("Availability", volunteerApplication.Availability);
            cmd.Parameters.AddWithValue("PreferredUnit", volunteerApplication.PreferredUnit);
            cmd.Parameters.AddWithValue("Status", volunteerApplication.Status);
            cmd.Parameters.AddWithValue("ContactNumber", volunteerApplication.ContactNumber);
            cmd.Parameters.AddWithValue("EmailAddress", volunteerApplication.EmailAddress);
            cmd.Parameters.AddWithValue("ApplicationDate", volunteerApplication.ApplicationDate);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}