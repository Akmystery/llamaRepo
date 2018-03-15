using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using TeamLLama.Entity;

namespace TeamLLama.Controller
{
    public class ReviewControlSystem
    {
        public void CreateReview(Review r)
        {

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "INSERT into review (rating,comment,account_id,facility_id) VALUES (@rating,@comment,@account,@facility)";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@rating", r.rating);
            cmd.Parameters.AddWithValue("@comment", r.comment);
            cmd.Parameters.AddWithValue("@account", r.accountId);
            cmd.Parameters.AddWithValue("@facility", r.facilityId);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}