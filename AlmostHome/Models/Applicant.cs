using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmostHome.Models
{
    public class Applicant
    {
        public int ApplicantID { get; set; }
        public string ApplicantName { get; set; }
        public int ContactNumber { get; set; }
        public string EmailAddress { get; set; }


        public static int SaveApplicant(Applicant applicant)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_save_Applicant", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ApplicantName", applicant.ApplicantName);
            cmd.Parameters.AddWithValue("ContactNumber", applicant.ContactNumber);
            cmd.Parameters.AddWithValue("EmailAddress", applicant.EmailAddress);
            cmd.Parameters.Add("@ApplicantID", SqlDbType.Int).Direction = ParameterDirection.Output;
            con.Open();
            //insert and return  inserted applicant id
            cmd.ExecuteNonQuery();
            int applicantId = Convert.ToInt32(cmd.Parameters["@ApplicantID"].Value.ToString());
            con.Close();
            return applicantId;
        }

        public static Applicant GetApplicantByApplicantID(int applicantID)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlDataReader rd;

            Applicant applicant = null;

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_get_ApplicantByApplicantID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Passing parameters
                cmd.Parameters.AddWithValue("ApplicantID", applicantID);

                con.Open();
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    applicant = new Applicant();
                    applicant.ApplicantID = Convert.ToInt32(rd["ApplicantID"]);
                    applicant.ApplicantName= rd["ApplicantName"].ToString();
                    applicant.ContactNumber = Convert.ToInt32(rd["ContactNumber"].ToString());
                    applicant.EmailAddress = rd["EmailAddress"].ToString();
                }
                rd.Close();
            }
            con.Close();

            return applicant;
        }
    }
}