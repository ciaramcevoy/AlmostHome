using AlmostHome.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;

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
        public bool Rehomed { get; set; }
        public DateTime RehomedDate { get; set; }

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
            cmd.Parameters.AddWithValue("AnimalID", animal.AnimalID);
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

        public static void DeleteAnimal(int animalID)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_delete_Animal", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("AnimalID", animalID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static DataTable GetSearchResult(Animal animalFilter, int pageIndex, int pageSize, out int rowCount)
        {
            DataTable dt = new DataTable("dt");
            using (SqlConnection con = new SqlConnection(DBCon.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_get_AnimalSearch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AnimalType", animalFilter.AnimalType);
                cmd.Parameters.AddWithValue("@AnimalAge", animalFilter.AnimalAge);
                cmd.Parameters.AddWithValue("@Children", animalFilter.Children);
                cmd.Parameters.AddWithValue("@SecureGarden ", animalFilter.SecureGarden);
                cmd.Parameters.AddWithValue("@OtherPets", animalFilter.OtherPets);
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", pageSize);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
                con.Close();
                int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                rowCount = recordCount;
            }

            return dt;
        }

        public static Animal GetAnimalByAnimalID(string animalId)
        {
            SqlConnection con = new SqlConnection(DBCon.GetDBCon());
            SqlDataReader rd;

            Animal animal = null;

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_get_AnimalByAnimalID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Passing parameters
                cmd.Parameters.AddWithValue("AnimalID", Convert.ToInt32(animalId));

                con.Open();
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    animal = new Animal();
                    animal.AnimalID = Convert.ToInt32(rd["AnimalID"]);
                    animal.AnimalName = rd["AnimalName"].ToString();
                    animal.AnimalAge = Convert.ToInt32(rd["AnimalAge"].ToString());
                    animal.AnimalType = Convert.ToInt32(rd["AnimalType"].ToString());
                    animal.Children = Convert.ToBoolean(rd["Children"].ToString());
                    animal.SecureGarden = Convert.ToBoolean(rd["SecureGarden"].ToString());
                    animal.OtherPets = Convert.ToBoolean(rd["OtherPets"].ToString());
                    animal.ImageUrl = rd["ImageUrl"].ToString();
                }
                rd.Close();
            }
            con.Close();

            return animal;
            
        }
    }

}