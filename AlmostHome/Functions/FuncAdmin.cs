using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using AlmostHome.Models;

namespace AlmostHome.Functions
{
    public class FuncAdmin
    {
        public static DataSet GetVolunteerApplication()
        {
            DataSet dataSet = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_getAll_VolunteerApplication", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                // Getting the data and filing to data set variable
                da.Fill(dataSet);
            }

            return dataSet;

        }

        public static void UpdateVolunteerApplicationStatus(int volunteerApplicationID, int status)
        {
            //getting the database connectivity
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            //set command type as stored procedure
            SqlCommand cmd = new SqlCommand("sp_update_VolunteerApplicationStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //setting parameters
            cmd.Parameters.AddWithValue("VolunteerApplicationID", volunteerApplicationID);
            cmd.Parameters.AddWithValue("Status", status);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static void SendEmailToApplicant(int volunteerApplicationID, int statusId)
        {
            //get applicant details
            VolunteerApplication applicant = FuncVolunteerApplication.GetVolunteerApplicationByID(volunteerApplicationID);
            //send email
            string status = Setting.StatusList().Find(x => x.ID == Convert.ToInt32(statusId)).Value;
            string message = "Your application status is updated to " + status;
            string emailBody = Email.PopulateBody(applicant.VolunteerName.Split(' ')[0], message);
            Email.SendEmail(applicant.EmailAddress, "Volunteer Application Status Updated", emailBody);

        }


    }
}