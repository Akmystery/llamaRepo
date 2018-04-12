using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using TeamLLama.Entity;
using System.Data;

namespace TeamLLama.Controller
{
    public class AccountManagementSystem
    {
        public static int createAccount()
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

        public static int createAccount(Account a)
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
            cmd.Parameters.AddWithValue("@photo", a.photo);

            conn.Open();
            result = cmd.ExecuteNonQuery();

            conn.Close();
            return result;
        }

        public static int createDocAccount(Account a,int dept_id)
        {
            int result = 0;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);


            //to insert doc account
            string query = "INSERT into account (account_type,name,nric,password,email,address,photo) VALUES (@account_type,@name,@nric,@password,@email,@address,@photo)";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@account_type", "Doctor");
            cmd.Parameters.AddWithValue("@name", a.name);
            cmd.Parameters.AddWithValue("@nric", a.nric);
            cmd.Parameters.AddWithValue("@password", a.password);
            cmd.Parameters.AddWithValue("@email", a.email);
            cmd.Parameters.AddWithValue("@address", a.address);
            cmd.Parameters.AddWithValue("@photo", a.photo);

            conn.Open();

            result = cmd.ExecuteNonQuery();


            //to get doc id
            string query2 = "SELECT account_id FROM account where nric= @nric";

            var cmd2 = new MySqlCommand(query2, conn);
            cmd2.Parameters.AddWithValue("@nric", a.nric);

            var reader = cmd2.ExecuteReader();
            int acc_id=0;
            while (reader.Read())
            {
                acc_id = Convert.ToInt32(reader["account_id"]);
            }
            conn.Close();

            //insert into facility Staff table
            string query3 = "INSERT into facility_staff (account_id,department_id) VALUES (@account_id,@department_id)";

            conn.Open();
            var cmd3 = new MySqlCommand(query3, conn);
            cmd3.Parameters.AddWithValue("@account_id", acc_id);
            cmd3.Parameters.AddWithValue("@department_id", dept_id);   
            result = cmd3.ExecuteNonQuery();

            conn.Close();
            return result;
        }

        public static Account GetAccount(int id)
        {
            Account a = new Account();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM account WHERE account_id=@id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", id);

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


        public static void UpdateAccount(String name, String password, String email, String address, String nric, String photo,int id)
        {
           
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "UPDATE account SET name=@name,password=@password,email=@email,address=@address,nric=@nric,photo=@photo WHERE account_id=@id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@nric", nric);
            cmd.Parameters.AddWithValue("@name",name);
            cmd.Parameters.AddWithValue("@password",password);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@photo", photo);
            cmd.Parameters.AddWithValue("@id", id);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteAccount(int id)
        {

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);


            ///////////////////////////////////delete data from facility_staff as that's the child of account
            string query2 = "DELETE FROM facility_staff WHERE account_id=@id";
            var cmd2 = new MySqlCommand(query2, conn);
            cmd2.Parameters.AddWithValue("@id", id);
            conn.Open();
            cmd2.ExecuteNonQuery();
            conn.Close();
            //////////////////////////////////////////////////////////////////

            string query = "DELETE FROM account WHERE account_id=@id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", id);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static DataTable getAllDoctorAcc()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT account.account_id AS 'ID',photo,name,nric,facility_name,department_name FROM account,facility_staff,department,facility where account.account_id=facility_staff.account_id AND facility_staff.department_id = department.department_id AND department.facility_id = facility.facility_id";


            var cmd = new MySqlCommand(query, conn);
            conn.Open();
            var reader = cmd.ExecuteReader();


            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Photo");
            dt.Columns.Add("Name");
            dt.Columns.Add("NRIC");
            dt.Columns.Add("Facility");
            dt.Columns.Add("Department");

            int i = 0;


            while (reader.Read())
            {

                dt.Rows.Add();
                dt.Rows[i]["ID"] = reader["ID"].ToString();
                dt.Rows[i]["Photo"] = reader["photo"].ToString();
                dt.Rows[i]["Name"] = reader["name"].ToString();
                dt.Rows[i]["NRIC"] = reader["nric"].ToString();
                dt.Rows[i]["Facility"] = reader["facility_name"].ToString();
                dt.Rows[i]["Department"] = reader["department_name"].ToString();

                i++;

            }
            return dt;
        }


        public static void UpdateFacilityStaff(int account_id, int department_id)
        {

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "UPDATE facility_staff SET department_id=@department_id WHERE account_id=@account_id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@department_id", department_id);
            cmd.Parameters.AddWithValue("@account_id", account_id);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}