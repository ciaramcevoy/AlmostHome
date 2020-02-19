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

        public static VolunteerApplication GetVolunteerApplicationByID(int volunteerApplicationID)
        {
            //declare object 
            VolunteerApplication volunteerApplication = new VolunteerApplication();
            //getting the database connectivity
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            //set command type as stored procedure
            SqlCommand cmd = new SqlCommand("sp_get_VolunteerApplication", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
            cmd.Parameters.AddWithValue("VolunteerApplicationID", volunteerApplicationID);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                //reads and set values to object
                volunteerApplication.VolunteerApplicationID = Convert.ToInt32(rd["VolunteerApplicationID"]);
                volunteerApplication.ApplicationDate = Convert.ToDateTime(rd["ApplicationDate"].ToString());
                volunteerApplication.VolunteerName = rd["VolunteerName"].ToString();
                volunteerApplication.ContactNumber = Convert.ToInt32(rd["ContactNumber"].ToString());
                volunteerApplication.EmailAddress = rd["EmailAddress"].ToString();
                volunteerApplication.Availability = Convert.ToInt32(rd["Availability"].ToString());
                volunteerApplication.PreferredUnit = Convert.ToInt32(rd["PreferredUnit"].ToString());
                volunteerApplication.Status = Convert.ToInt32(rd["Status"].ToString());

            }
            rd.Close();
            con.Close();
            return volunteerApplication;
        }
    }
}