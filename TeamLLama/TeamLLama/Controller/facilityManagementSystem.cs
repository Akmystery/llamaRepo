using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using TeamLLama.Controller;
using TeamLLama.Entity;

namespace TeamLLama.Controller
{
    public class FacilityManagementSystem
    {
        public void createFacility(Facility f)
        {
            int result = 0;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "INSERT into facility (facility_type,facility_name,generalInfo,phoneNumber,openingHrs,closingHrs,address,region,image) " +
                "VALUES (@type,@name,@info,@number,@open,@close,@address,@region,@image)";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@type", f.facilityType);
            cmd.Parameters.AddWithValue("@name", f.facilityName);
            cmd.Parameters.AddWithValue("@info", f.generalInfo);
            cmd.Parameters.AddWithValue("@number", f.phoneNumber);
            cmd.Parameters.AddWithValue("@open", f.openingHrs);
            cmd.Parameters.AddWithValue("@close", f.closingHrs);
            cmd.Parameters.AddWithValue("@address", f.address);
            cmd.Parameters.AddWithValue("@region", f.region);
            cmd.Parameters.AddWithValue("@image", f.image);

            conn.Open();
            result = cmd.ExecuteNonQuery();

            conn.Close();
        }
    }
}