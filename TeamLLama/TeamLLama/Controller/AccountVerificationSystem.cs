using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using TeamLLama.Entity;

namespace TeamLLama.Controller
{
    public class AccountVerificationSystem
    {
        public static Account LoginAccount(string nric, string password)
        {
            Account a = new Account();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM account where NRIC = @nric And password = @password";
            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@nric", nric);
            cmd.Parameters.AddWithValue("@password", password);
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