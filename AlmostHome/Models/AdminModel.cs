using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmostHome.Models
{
    public class AdminModel
    {
        public int AdminID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }



        public static void SaveAdmin(string username, string password)
        {
            //getting the database connectivity
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            //set command type as stored procedure
            SqlCommand cmd = new SqlCommand("sp_save_Admin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //setting parameters
            cmd.Parameters.AddWithValue("Username", username);
            cmd.Parameters.AddWithValue("Password", Encryption.Encrypt(password));
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static bool ValidateUsername(string username)
        {
            SqlDataReader rd;
            //getting the database connectivity
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            //set command type as stored procedure
            SqlCommand cmd = new SqlCommand("sp_validate_AdminUsername", con);
            cmd.CommandType = CommandType.StoredProcedure;
            // Passing parameters
            cmd.Parameters.AddWithValue("Username", username);
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

        public static AdminModel Login(string Username, string Password)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlDataReader rd;

            AdminModel adminModel = null;

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_get_Admin", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Passing parameters
                cmd.Parameters.AddWithValue("Username", Username);
                cmd.Parameters.AddWithValue("Password", Encryption.Encrypt(Password));

                con.Open();
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    adminModel = new AdminModel();
                    adminModel.AdminID = Convert.ToInt32(rd["AdminID"]);
                    adminModel.Username = rd["Username"].ToString();
                    adminModel.Password = rd["Password"].ToString();
                }
                rd.Close();
            }
            con.Close();

            return adminModel;
        }
    }
    
}