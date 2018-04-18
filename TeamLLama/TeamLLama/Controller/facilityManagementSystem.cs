using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using TeamLLama.Entity;
using System.Data;
using System.Globalization;
using System.Net;
using Newtonsoft.Json;

namespace TeamLLama.Controller
{
    public class FacilityManagementSystem
    {


        public static DataTable GetFacility()
        {
            Facility f = new Facility();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM facility";

            var cmd = new MySqlCommand(query, conn);

            conn.Open();
            var reader = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");
            dt.Columns.Add("Type");
            dt.Columns.Add("GeneralInfo");
            dt.Columns.Add("PhoneNumber");
            dt.Columns.Add("OpeningHrs");
            dt.Columns.Add("ClosingHrs");
            dt.Columns.Add("Address");
            dt.Columns.Add("Region");

            int i = 0;

            while (reader.Read())
            {
                dt.Rows.Add();
                dt.Rows[i]["ID"] = Convert.ToInt32(reader["facility_id"]);
                dt.Rows[i]["Name"] = reader["facility_name"].ToString();
                dt.Rows[i]["Type"] = reader["facility_type"].ToString();
                dt.Rows[i]["GeneralInfo"] = reader["generalInfo"].ToString();
                dt.Rows[i]["PhoneNumber"] = Convert.ToInt32(reader["phoneNumber"]);
                dt.Rows[i]["OpeningHrs"] = reader["openingHrs"].ToString();
                dt.Rows[i]["ClosingHrs"] = reader["closingHrs"].ToString();
                dt.Rows[i]["Address"] = reader["address"].ToString();
                dt.Rows[i]["Region"] = reader["region"].ToString();
                i++;
            }
            conn.Close();
            return dt;
        }

        public static Facility GetFacility(String id)
        {
            if (!int.TryParse(id, out int result))
            {
                return null;
            }
            return GetFacility(result);
        }

        public static Facility GetFacility(int id)
        {
            Facility f = new Facility();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM facility WHERE facility_id=@id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", id);

            conn.Open();
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                f.facilityID = Convert.ToInt32(reader["facility_id"]);
                f.facilityName = reader["facility_name"].ToString();
                f.facilityType = reader["facility_type"].ToString();
                f.generalInfo = reader["generalInfo"].ToString();
                f.phoneNumber = Convert.ToInt32(reader["phoneNumber"]);
                f.openingHrs = reader["openingHrs"].ToString();
                f.closingHrs = reader["closingHrs"].ToString();
                f.address = reader["address"].ToString();
                f.region = reader["region"].ToString();
            }
            conn.Close();
            return f;
        }
        public static Facility GetFacilityFromName(String name)
        {
            Facility f = new Facility();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM facility WHERE facility_name=@name";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", name);

            conn.Open();
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                f.facilityID = Convert.ToInt32(reader["facility_id"]);
                f.facilityName = reader["facility_name"].ToString();
                f.facilityType = reader["facility_type"].ToString();
                f.generalInfo = reader["generalInfo"].ToString();
                f.phoneNumber = Convert.ToInt32(reader["phoneNumber"]);
                f.openingHrs = reader["openingHrs"].ToString();
                f.closingHrs = reader["closingHrs"].ToString();
                f.address = reader["address"].ToString();
                f.region = reader["region"].ToString();
                f.image = reader["image"].ToString();
            }
            conn.Close();
            return f;
        }

        public static List<Facility> SearchFacility(String name)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM facility WHERE facility_name LIKE concat('%', @name, '%')";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", name);

            conn.Open();
            var reader = cmd.ExecuteReader();
            List<Facility> searchResults = new List<Facility>();
            while (reader.Read())
            {
                Facility f = new Facility();
                f.facilityID = Convert.ToInt32(reader["facility_id"]);
                f.facilityName = reader["facility_name"].ToString();
                f.facilityType = reader["facility_type"].ToString();
                f.generalInfo = reader["generalInfo"].ToString();
                f.phoneNumber = Convert.ToInt32(reader["phoneNumber"]);
                f.openingHrs = reader["openingHrs"].ToString();
                f.closingHrs = reader["closingHrs"].ToString();
                f.image = reader["image"].ToString();
                f.address = reader["address"].ToString();
                f.region = reader["region"].ToString();
                searchResults.Add(f);
            }
            conn.Close();
            return searchResults;
        }

        public static List<Facility> SearchNearby(decimal x, decimal y)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "select *, abs(pow(x - @x,2) + pow(y - @y,2)) AS distance FROM facility ORDER BY distance ASC limit 5";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@x", x);
            cmd.Parameters.AddWithValue("@y", y);

            conn.Open();
            var reader = cmd.ExecuteReader();
            List<Facility> searchResults = new List<Facility>();
            while (reader.Read())
            {
                Facility f = new Facility();
                f.facilityID = Convert.ToInt32(reader["facility_id"]);
                f.facilityName = reader["facility_name"].ToString();
                f.facilityType = reader["facility_type"].ToString();
                f.generalInfo = reader["generalInfo"].ToString();
                f.phoneNumber = Convert.ToInt32(reader["phoneNumber"]);
                f.openingHrs = reader["openingHrs"].ToString();
                f.closingHrs = reader["closingHrs"].ToString();
                f.address = reader["address"].ToString();
                f.image = reader["image"].ToString();
                f.region = reader["region"].ToString();
                f.x = (decimal)reader["x"];
                f.y = (decimal)reader["y"];
                searchResults.Add(f);
            }
            conn.Close();
            return searchResults;
        }

        public static bool CheckFacilityName(String name)
        {
            Facility f = new Facility();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM facility WHERE facility_name=@name";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", name);

            conn.Open();
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                conn.Close();
                return true;
            }
            conn.Close();
            return false;

        }

        public static int GetFacilityId(String name)
        {
            Facility f = new Facility();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM facility WHERE facility_name=@name";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", name);

            conn.Open();
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                return Convert.ToInt32(reader["facility_id"]);
            }

            return -1;//for error checking

        }

        public static DataTable GetAllfacility()
        {
            Facility f = new Facility();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT facility_id, facility_name FROM facility";

            var cmd = new MySqlCommand(query, conn);

            DataTable dt = new DataTable();
            dt.Columns.Add("facility_id");
            dt.Columns.Add("facility_name");

            int i = 0;

            conn.Open();
            var reader = cmd.ExecuteReader();


            while (reader.Read())
            {

                dt.Rows.Add();
                dt.Rows[i]["facility_id"] = reader["facility_id"].ToString();
                dt.Rows[i]["facility_name"] = reader["facility_name"].ToString();
                i++;
            }
            reader.Close();
            conn.Close();

            return dt;
        }

        public static void CreateFacility(Facility f)
        {
            int result = 0;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);


            string query = "INSERT into facility (facility_type,facility_name,generalInfo,phoneNumber,openingHrs,closingHrs,address,region,image,x,y) " +
                            "VALUES (@type,@name,@info,@number,@open,@close,@address,@region,@image,@x,@y)";

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
            cmd.Parameters.AddWithValue("@x", f.x);
            cmd.Parameters.AddWithValue("@y", f.y);

            conn.Open();
            result = cmd.ExecuteNonQuery();

            conn.Close();
        }

        public static void UpdateFacility(String name, String type, String generalinfo, int phoneNumber, String openingHrs, String closingHrs, String Address, String Region, String image, int id)
        {

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "UPDATE facility SET facility_name=@name,facility_type=@type,generalInfo=@generalInfo,phoneNumber=@phoneNumber,openingHrs=@openingHrs,closingHrs=@closingHrs," +
                "address=@address,region=@region,image=@image WHERE facility_id=@id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@type", type);
            cmd.Parameters.AddWithValue("@generalInfo", generalinfo);
            cmd.Parameters.AddWithValue("@phoneNumber", phoneNumber);
            cmd.Parameters.AddWithValue("@openingHrs", openingHrs);
            cmd.Parameters.AddWithValue("@closingHrs", closingHrs);
            cmd.Parameters.AddWithValue("@address", Address);
            cmd.Parameters.AddWithValue("@region", Region);
            cmd.Parameters.AddWithValue("@image", image);
            cmd.Parameters.AddWithValue("@id", id);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteFacility(String id)
        {

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "DELETE FROM facility WHERE facility_id=@id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", id);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static Facility getOpeningHrs(string hospitalSelected)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;

            Facility f1 = new Facility();
            using (MySqlConnection conn = new MySqlConnection(dbConnectionString))
            {
                string FacQuery = "SELECT TIME_FORMAT(openingHrs, '%H%i%p') openingHrs,TIME_FORMAT(closingHrs, '%H%i%p') closingHrs,TIME_FORMAT(openingHrs, '%h %i%p') opHrs,TIME_FORMAT(closingHrs, '%h %i%p') clHrs from facility where facility_id = @s";
                MySqlCommand FacCmd = new MySqlCommand(FacQuery, conn);
                FacCmd.Parameters.AddWithValue("@s", hospitalSelected);
                conn.Open();

                MySqlDataReader dr;
                dr = FacCmd.ExecuteReader();
                if (dr.Read())
                {

                    f1.openingHrs = dr["openingHrs"].ToString();
                    f1.closingHrs = dr["closingHrs"].ToString();
                    f1.generalInfo = dr["opHrs"].ToString();
                    f1.region = dr["clHrs"].ToString();
                }
                conn.Close();

            }
            return f1;
        }
        public static List<SearchResults> getAPIData(string query)
        {
            var url = "https://developers.onemap.sg/commonapi/search?searchVal=" +query +" &returnGeom=Y&getAddrDetails=Y&pageNum=1";
            var hospital = _download_serialized_json_data<JsonData>(url);
            List<SearchResults> results = hospital.results;
            return results;
        }
        public static List<Pharmacy> getPharmacyData(string category)
        {
            var url = "https://data.gov.sg/api/action/datastore_search?resource_id=16db7800-d81e-4d0d-9d59-936f2c10d668&q=%7B%22pharmacy_name%22%3A%20%22{0}%22%7D";
            url = string.Format(url, category);
            var data = _download_serialized_json_data<GovData>(url);
            List<Pharmacy> results = data.result.records;
            return results;
        }
        public static T _download_serialized_json_data<T>(string url) where T : new()
        {
            using (var w = new WebClient())
            {
                var json_data = string.Empty;
                // attempt to download JSON data as a string
                try
                {
                    json_data = w.DownloadString(url);
                }
                catch (Exception) { }
                // if string with JSON data is not empty, deserialize it to class and return its instance 
                return !string.IsNullOrEmpty(json_data) ? JsonConvert.DeserializeObject<T>(json_data) : new T();
            }
        }
    }
}