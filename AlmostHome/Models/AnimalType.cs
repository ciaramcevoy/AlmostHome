using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmostHome.Models
{
    public class AnimalType
    {
        public int AnimalTypeID { get; set; }
        public string Type { get; set; }

        public static DataSet GetAnimalType()
        {
            DataSet dataSet = new DataSet("dt");
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_get_AnimalTypes", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dataSet);
            }

            return dataSet;

        }

        public static bool ValidateAnimalType(string animalType)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_validate_AnimalType", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Type", animalType);
            con.Open();
            int rowCount = (int)cmd.ExecuteScalar();
            con.Close();
            if (rowCount > 0)
            {
                return false;
            }

            return true;

        }

        public static void SaveAnimalType(string animalType)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_save_AnimalType", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Type", animalType);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
       
    }
}