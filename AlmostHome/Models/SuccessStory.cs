using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmostHome.Models
{
    public class SuccessStory
    {
        public int StoryID { get; set; }
        public string Name { get; set; }
        public string StroryDescription { get; set; }
        public string Image { get; set; }
        public DateTime Date { get; set; }
        public bool Active { get; set; }


        public static DataSet GetSuccessStories(bool activeOnly)
        {
            DataSet dataSet = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_getAll_SuccessStory", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Active", activeOnly);

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                // Getting the data and filing to data set variable
                da.Fill(dataSet);
            }

            return dataSet;

        }

        public static void SaveSuccessStory(SuccessStory successStory)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_save_SuccessStory", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Name", successStory.Name);
            cmd.Parameters.AddWithValue("StroryDescription", successStory.StroryDescription);
            cmd.Parameters.AddWithValue("Image", successStory.Image);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static void UpdateSuccessStoryStatus(int storyID, bool active)
        {
            //getting the database connectivity
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            //set command type as stored procedure
            SqlCommand cmd = new SqlCommand("sp_update_SuccessStoryStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //setting parameters
            cmd.Parameters.AddWithValue("StoryID", storyID);
            cmd.Parameters.AddWithValue("Active", active);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}