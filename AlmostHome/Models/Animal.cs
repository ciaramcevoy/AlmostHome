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
    }
    
}