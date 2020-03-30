﻿using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmostHome.Models
{
    public class AnimalApplication
    {
        public int ApplicationID { get; set; }
        public int AnimalID { get; set; }
        public int ApplicantID { get; set; }
        public DateTime ApplicationDate { get; set; }
        public int Status { get; set; }

        public static void SaveAnimalApplication(AnimalApplication application)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_save_AnimalApplication", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("AnimalID", application.AnimalID);
            cmd.Parameters.AddWithValue("ApplicantID", application.ApplicantID);
            cmd.Parameters.AddWithValue("Status", application.Status);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static DataSet GetGetApplication(bool isRehomed)
        {
            DataSet dataSet = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_getAll_AnimalApplication", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("isRehomed", isRehomed);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                // Getting the data and filing to data set variable
                da.Fill(dataSet);
            }

            return dataSet;
        }

        public static void UpdateAnimalApplicationStatus(int applicationID, int status, int animalID)
        {
            //getting the database connectivity
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            //set command type as stored procedure
            SqlCommand cmd = new SqlCommand("sp_update_AnimalApplicationStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //setting parameters
            cmd.Parameters.AddWithValue("ApplicationID", applicationID);
            cmd.Parameters.AddWithValue("Status", status);
            cmd.Parameters.AddWithValue("AnimalID", animalID); 
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static void SendEmailToApplicant(int applicationID, int statusId)
        {
            //get applicant details
            Applicant applicant = Applicant.GetApplicantByApplicantID(applicationID);
            //send email
            string status = Setting.AnimalApplicationStatusList().Find(x => x.ID == Convert.ToInt32(statusId)).Value;
            string message = "Your adoption application status is updated to " + status;
            string emailBody = Email.PopulateBody(applicant.ApplicantName.Split(' ')[0], message);
            Email.SendEmail(applicant.EmailAddress, "Adoption Application Status Updated", emailBody);

        }


    }
}