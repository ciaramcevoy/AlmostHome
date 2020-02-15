using System;
using System.Collections.Generic;
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
        public int ContactNumber { get; set; }
        public string EmailAddress { get; set; }
        public bool Active { get; set; }
    }
}