using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using TeamLLama.Entity;

namespace TeamLLama.Controller
{
    public class AppointmentManagementSystem
    {
        public int bookAppointment()
        {
            int result = 0;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "INSERT into appointment (account_id,facility_id,department_id,time,date) VALUES (@accountID,@facilityID,@departmentID,@time,@date)";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@accountID", 1);
            cmd.Parameters.AddWithValue("@facilityID", 1);
            cmd.Parameters.AddWithValue("@departmentID", 1);
            cmd.Parameters.AddWithValue("@time", "3.30");
            cmd.Parameters.AddWithValue("@date", "05/03/18");

            conn.Open();
            result = cmd.ExecuteNonQuery();

            conn.Close();
            return result;
        }
        public Appointment GetAppointment()
        {
            Appointment a = new Appointment();

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM appointment";
            
            var cmd = new MySqlCommand(query, conn);
            //cmd.Parameters.AddWithValue("@idTest", 1);

            conn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                a.appointmentID = Convert.ToInt32(reader["appointment_id"]);
                a.accountID= Convert.ToInt32(reader["account_id"]);
                a.facilityID= Convert.ToInt32(reader["facility_id"]);
                a.departmentID= Convert.ToInt32(reader["department_id"]);
                a.time = reader["time"].ToString();
                a.date = reader["date"].ToString();
                a.taken = Convert.ToBoolean(reader["taken"]);
            }
            conn.Close();
            return a;
        }
    }
}