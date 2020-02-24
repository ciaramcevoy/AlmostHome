using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AlmostHome.Models
{
    public class Animal
    {
        public int AnimalID { get; set; }
        public int AnimalType { get; set; }
        public string AnimalName { get; set; }
        public int AnimalAge { get; set; }
        public bool Children { get; set; }
        public bool SecureGarden { get; set; }
        public bool OtherPets { get; set; }
        public string ImageUrl { get; set; }

        public static void SaveAnimal(Animal animal)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_save_Animal", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("AnimalType", animal.AnimalType);
            cmd.Parameters.AddWithValue("AnimalAge", animal.AnimalAge);
            cmd.Parameters.AddWithValue("AnimalName", animal.AnimalName);
            cmd.Parameters.AddWithValue("Children", animal.Children);
            cmd.Parameters.AddWithValue("OtherPets", animal.OtherPets);
            cmd.Parameters.AddWithValue("SecureGarden", animal.SecureGarden);
            cmd.Parameters.AddWithValue("ImageUrl", animal.ImageUrl);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        
        public static DataSet GetAnimal()
        {
            DataSet dataSet = new DataSet("dt");
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_get_Animals", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dataSet);
            }

            return dataSet;

        }

        public static DataTable GetSearchResult(int animalType,int animalAge, bool children, bool secureGarden, bool otherPets)
        {
            DataTable dt = new DataTable("dt");
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_get_AnimalSearch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AnimalType", animalType);
                cmd.Parameters.AddWithValue("@AnimalAge", animalAge);
                cmd.Parameters.AddWithValue("@Children", children);
                cmd.Parameters.AddWithValue("@SecureGarden ", secureGarden);
                cmd.Parameters.AddWithValue("@OtherPets", otherPets);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
            }

            return dt;

        }
    }

}