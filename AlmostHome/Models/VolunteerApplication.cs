using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmostHome.Models
{
    public class VolunteerApplication
    {
        public int VolunteerApplicationID { get; set; }
        public DateTime ApplicationDate { get; set; }
        public string VolunteerName { get; set; }
        public int Availability { get; set; }
        public int PreferredUnit { get; set; }
        public int Status { get; set; }
        public string ContactNumber { get; set; }
        public string EmailAddress { get; set; }

        public static DataSet GetVolunteerApplication(bool isActive)
        {
            DataSet dataSet = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_getAll_VolunteerApplication", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("isActive", isActive);
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
            VolunteerApplication applicant = GetVolunteerApplicationByID(volunteerApplicationID);
            //send email
            string status = Setting.StatusList().Find(x => x.ID == Convert.ToInt32(statusId)).Value;
            string message = "Your application status is updated to " + status;
            string emailBody = Email.PopulateBody(applicant.VolunteerName.Split(' ')[0], message);
            Email.SendEmail(applicant.EmailAddress, "Volunteer Application Status Updated", emailBody);

        }

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
                volunteerApplication.ContactNumber = rd["ContactNumber"].ToString();
                volunteerApplication.EmailAddress = rd["EmailAddress"].ToString();
                volunteerApplication.Availability = Convert.ToInt32(rd["Availability"].ToString());
                volunteerApplication.PreferredUnit = Convert.ToInt32(rd["PreferredUnit"].ToString());
                volunteerApplication.Status = Convert.ToInt32(rd["Status"].ToString());

            }
            rd.Close();
            con.Close();
            return volunteerApplication;
        }

        public static int[] GetWeeklyVolunteerApplicants()
        {
            Dictionary<string, int> dict = new Dictionary<string, int>
            {
                {"Monday", 0},
                {"Tuesday", 0},
                {"Wednesday", 0},
                {"Thursday", 0},
                {"Friday", 0},
                {"Saturday", 0},
                {"Sunday ", 0}
            };

            List<int> list = new List<int>(); ;
            SqlDataReader rd;
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_get_WeeklyVolunteerApplication", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    if (dict.ContainsKey(rd["Day"].ToString()))
                    {
                        dict[rd["Day"].ToString()] = Convert.ToInt32(rd["Count"]);
                    }
                }
                rd.Close();
            }
            return dict.Values.ToArray();
        }
    }
    
}