using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using TeamLLama.Entity;

namespace TeamLLama.Controller
{
    public class AccountManagementSystem
    {
        public int createAccount()
        {
            int result = 0;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "INSERT into account (account_type,name,nric,password,email,address,photo) VALUES (@account_type,@name,@nric,@password,@email,@address,@photo)";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@account_type", 1);
            cmd.Parameters.AddWithValue("@name", 1);
            cmd.Parameters.AddWithValue("@nric", 1);
            cmd.Parameters.AddWithValue("@password", 1);
            cmd.Parameters.AddWithValue("@email", 1);
            cmd.Parameters.AddWithValue("@address", 1);
            cmd.Parameters.AddWithValue("@photo", 1);

            conn.Open();
            result = cmd.ExecuteNonQuery();

            conn.Close();
            return result;
        }

        public int createAccount(Account a)
        {
            int result = 0;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "INSERT into account (account_type,name,nric,password,email,address,photo) VALUES (@account_type,@name,@nric,@password,@email,@address,@photo)";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@account_type", "patient");
            cmd.Parameters.AddWithValue("@name", a.name);
            cmd.Parameters.AddWithValue("@nric", a.nric);
            cmd.Parameters.AddWithValue("@password", a.password);
            cmd.Parameters.AddWithValue("@email", a.email);
            cmd.Parameters.AddWithValue("@address", a.address);
            cmd.Parameters.AddWithValue("@photo", "http:abc.com");

            conn.Open();
            result = cmd.ExecuteNonQuery();

            conn.Close();
            return result;
        }

        public Account GetAccount()
        {
            Account a = new Account();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM account";

            var cmd = new MySqlCommand(query, conn);
            //cmd.Parameters.AddWithValue("@idTest", 1);

            conn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                a.accountID = Convert.ToInt32(reader["account_id"]);
                a.accountType = reader["account_type"].ToString();
                a.name = reader["name"].ToString();
                a.nric = reader["nric"].ToString();
                a.password = reader["password"].ToString();
                a.email = reader["email"].ToString();
                a.address = reader["address"].ToString();
                a.photo = reader["photo"].ToString();
            }
            conn.Close();
            return a;
        }
    }
}