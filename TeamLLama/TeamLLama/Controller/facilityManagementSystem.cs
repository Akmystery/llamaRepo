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
        

        public DataTable GetFacility()
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

        public Facility GetFacility(String id)
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

        public bool CheckFacilityName(String name)
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

        public void CreateFacility(Facility f)
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

        public void UpdateFacility(String name, String type, String generalinfo, int phoneNumber, String openingHrs, String closingHrs, String Address, String Region, String image, int id)
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

        public void DeleteFacility(String id)
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
        public List<SearchResults> getAPIData(string query)
        {
            var url = "https://developers.onemap.sg/commonapi/search?searchVal=" +query +" &returnGeom=N&getAddrDetails=Y&pageNum=1";
            var hospital = _download_serialized_json_data<JsonData>(url);
            List<SearchResults> results = hospital.results;
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