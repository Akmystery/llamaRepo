﻿using System;
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

        public double GetAverageRating(String id)
        {
            float avg = 0;
            float total = 0;
            float i = 0;
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);
            string query = "SELECT rating FROM review WHERE facility_id=@id";
            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", id);
            conn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                total += Convert.ToInt32(reader["rating"]);
                i++;
            }
            conn.Close();
            avg = total / i;
            return System.Math.Round(avg,2);
        }

        public Review GetReview(String id)
        {
            Review r = new Review();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);
            string query = "SELECT * FROM review WHERE facility_id=@id";
            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", id);
            conn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                r.reviewId = Convert.ToInt32(reader["review_id"]);
                r.accountId = Convert.ToInt32(reader["account_id"]);
                r.rating = Convert.ToInt32(reader["rating"]);
                r.comment = reader["comment"].ToString();
            }
            conn.Close();
            return r;
        }

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