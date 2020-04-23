using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmostHome.Models
{
    public class Volunteer
    {
        public int VolunteerID { get; set; }
        public string VolunteerName { get; set; }
        public int Availability { get; set; }
        public int PreferredUnit { get; set; }
        public string ContactNumber { get; set; }
        public string EmailAddress { get; set; }
        public bool Active { get; set; }

        public static int GetVolunteerCount()
        {
            int count = 0;
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_get_VolunteerCount", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }

            return count;
        }
    }
}