using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace AlmostHome.Common
{
    public class DBCon
    {
        public static string GetDBCon()
        {
            //reading the connection string from web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            return connectionString;
        }
    }

}