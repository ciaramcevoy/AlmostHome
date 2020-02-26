using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace AlmostHome.Models
{
    public class Setting
    {
        public int ID { get; set; }
        public string Value { get; set; }

        public static List<Setting> UnitList()
        {
            List<Setting> settings = new List<Setting>();
            settings.Add(new Setting { ID = 1, Value = "Puppy Unit" });
            settings.Add(new Setting { ID = 2, Value = "Old Dogs" });
            settings.Add(new Setting { ID = 3, Value = "Big Dogs" });
            settings.Add(new Setting { ID = 4, Value = "Cats" });
            return settings;
        }

        public static List<Setting> AvailabilityList()
        {
            List<Setting> settings = new List<Setting>();
            settings.Add(new Setting { ID = 1, Value = "Mornings" });
            settings.Add(new Setting { ID = 2, Value = "Afternoons" });
            settings.Add(new Setting { ID = 3, Value = "Evenings" });
            return settings;
        }

        public static List<Setting> StatusList()
        {
            List<Setting> settings = new List<Setting>();
            settings.Add(new Setting { ID = 1, Value = "Submitted" });
            settings.Add(new Setting { ID = 2, Value = "Successful" });
            settings.Add(new Setting { ID = 3, Value = "Waiting list" });
            return settings;
        }

        public static List<Setting> AnimalApplicationStatusList()
        {
            List<Setting> settings = new List<Setting>();
            settings.Add(new Setting { ID = 1, Value = "Submitted" });
            settings.Add(new Setting { ID = 2, Value = "Successful" });
            settings.Add(new Setting { ID = 3, Value = "In Progress" });
            settings.Add(new Setting { ID = 4, Value = "Unsuccessful" });
            return settings;
        }

    }

   
}