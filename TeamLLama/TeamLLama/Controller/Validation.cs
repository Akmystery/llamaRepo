using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using TeamLLama.Entity;

namespace TeamLLama.Controller
{
    public class Validation
    {
        public bool ComparePassword(string a, string b)
        {
            if (a == b)
                return true;
            else
                return false;
        }

        public bool isEmpty(String s)
        {
            if (s == null || s == String.Empty)
                return true;
            else
                return false;

        }

        public bool CheckEmail(string email)
        {
            if (String.IsNullOrEmpty(email))
            { return false; }
            try
            {
                Regex _regex = new Regex("^((([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])" +
                        "+(\\.([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+)*)|((\\x22)" +
                        "((((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(([\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x7f]|\\x21|[\\x23-\\x5b]|[\\x5d-\\x7e]|" +
                        "[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(\\\\([\\x01-\\x09\\x0b\\x0c\\x0d-\\x7f]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\u" +
                        "FDF0-\\uFFEF]))))*(((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(\\x22)))@((([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|" +
                        "(([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|\\d|" +
                        "[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])))\\.)+(([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(([a-z]|[\\u00A0-\\uD7FF\\uF900" +
                        "-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFF" +
                        "EF])))\\.?$", RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture | RegexOptions.Compiled);
                return _regex.IsMatch(email);
            }
            catch (RegexMatchTimeoutException)
            {
                return false;
            }
        }

        public bool ValidNumber(string a)
        {
            int test;
            return int.TryParse(a, out test);
        }

        public bool checkNricExist(string nric)
        {
            Account a = new Account();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM account where NRIC = @nric";



            var cmd = new MySqlCommand(query, conn);
            //cmd.Parameters.AddWithValue("@idTest", 1);

            cmd.Parameters.AddWithValue("@nric", a);

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

            if (a.nric == null)
                return true;
            else
                return false;
        }
    }
}