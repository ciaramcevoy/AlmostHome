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


        public static DataSet GetSuccessStories()
        {
            DataSet dataSet = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_getAll_SuccessStory", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                // Getting the data and filing to data set variable
                da.Fill(dataSet);
            }

            return dataSet;

        }
    }
}