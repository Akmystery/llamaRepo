using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using TeamLLama.Entity;
using System.Data;
using System.Globalization;

namespace TeamLLama.Controller
{
    public class AppointmentManagementSystem
    {
        static string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;

        public static int bookAppointment(Appointment a)
        {
            int result = 0;
            
            //insert values into database and redirect to patientappointment page
            DateTime date = Convert.ToDateTime(a.date.Trim());
            string dateString = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

            MySqlConnection connection = new MySqlConnection(dbConnectionString);

            string insertData = "insert into appointment(account_id, facility_id, department_id, time, date, taken, comments)" +
                                  "values (@account_id, @facility_id, @department_id, @time, @date, @taken, @comments)";

            MySqlCommand command = new MySqlCommand(insertData, connection);

            command.Parameters.AddWithValue("@account_id", a.accountID);
            command.Parameters.AddWithValue("@facility_id", a.facilityID);
            command.Parameters.AddWithValue("@department_id", a.departmentID);
            command.Parameters.AddWithValue("@time", a.time);
            command.Parameters.AddWithValue("@date", date);
            command.Parameters.AddWithValue("@taken", "0");
            command.Parameters.AddWithValue("@comments", a.comments);

            connection.Open();
            var reader = command.ExecuteNonQuery();
            connection.Close();

            result = reader;

            return result;
        }

        public static Appointment GetAppointment()
        {
            Appointment a = new Appointment();

            //string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT * FROM appointment";

            var cmd = new MySqlCommand(query, conn);
            //cmd.Parameters.AddWithValue("@idTest", 1);

            conn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                a.appointmentID = Convert.ToInt32(reader["appointment_id"]);
                a.accountID = Convert.ToInt32(reader["account_id"]);
                a.facilityID = Convert.ToInt32(reader["facility_id"]);
                a.departmentID = Convert.ToInt32(reader["department_id"]);
                a.time = reader["time"].ToString();
                a.date = reader["date"].ToString();
                a.taken = Convert.ToBoolean(reader["taken"]);
            }
            conn.Close();
            return a;
        }
        public static DataTable getUpcomingAppointments(int accountID)
        {
            //string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT appointment_id AS 'ID' ,date As 'Date', facility_name As 'Facility', department_name As 'Department', TIME_FORMAT(time, '%h:%i%p') As 'Time' from appointment, facility, department where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND account_id=@account AND date >=@date  ORDER BY date";


            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@account", accountID);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
            conn.Open();
            var reader = cmd.ExecuteReader();


            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Date");
            dt.Columns.Add("Facility");
            dt.Columns.Add("Department");
            dt.Columns.Add("Time");

            int i = 0;


            while (reader.Read())
            {

                dt.Rows.Add();
                dt.Rows[i]["ID"] = reader["ID"].ToString();
                dt.Rows[i]["Date"] = String.Format("{0:dd/MM/yyyy}", reader["date"]);
                dt.Rows[i]["Facility"] = reader["Facility"].ToString();
                dt.Rows[i]["Department"] = reader["Department"].ToString();
                dt.Rows[i]["Time"] = reader["Time"].ToString();

                i++;

            }
            reader.Close();
            conn.Close();

            return dt;
        }
        public static DataTable getAppointmentHistory(int accountID)
        {
            //string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT appointment_id AS 'ID' ,date As 'Date', facility_name As 'Facility', department_name As 'Department', TIME_FORMAT(time, '%h:%i%p') As 'Time' from appointment, facility, department where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND account_id=@account AND date <@date  ORDER BY date";


            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@account", accountID);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
            conn.Open();
            var reader = cmd.ExecuteReader();


            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Date");
            dt.Columns.Add("Facility");
            dt.Columns.Add("Department");
            dt.Columns.Add("Time");

            int i = 0;


            while (reader.Read())
            {

                dt.Rows.Add();
                dt.Rows[i]["ID"] = reader["ID"].ToString();
                dt.Rows[i]["Date"] = String.Format("{0:dd/MM/yyyy}", reader["date"]);
                dt.Rows[i]["Facility"] = reader["Facility"].ToString();
                dt.Rows[i]["Department"] = reader["Department"].ToString();
                dt.Rows[i]["Time"] = reader["Time"].ToString();

                i++;

            }
            reader.Close();
            conn.Close();

            return dt;
        }
        public static Appointment getPatientAppointment(string appointmentID)
        {
            Appointment ap = new Appointment();

            //string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT appointment_id AS 'ID' ,date As 'Date', facility_name As 'Facility', department_name As 'Department', TIME_FORMAT(time, '%h:%i%p') As 'Time' from appointment, facility, department where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND appointment_id=@appointmentID";
            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@appointmentID", appointmentID);

            conn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                ap.appointmentID = Convert.ToInt32(reader["ID"]);
                ap.date = String.Format("{0:dd/MM/yyyy}", reader["date"]);
                ap.facilityName = reader["Facility"].ToString();
                ap.departmentName = reader["Department"].ToString();
                ap.time = reader["Time"].ToString();
            }

            reader.Close();
            conn.Close();

            return ap;
        }
        public static int deleteAppointment(string id)
        {
            int result = 0;

            //string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT taken from appointment WHERE appointment_id=@appointmentID";
            string query1 = "DELETE from appointment WHERE appointment_id=@appointmentID";
            string query2 = "DELETE from doctor_appointment WHERE appointment_id=@appointmentID";
            var cmd = new MySqlCommand(query, conn);
            var cmd1 = new MySqlCommand(query1, conn);
            var cmd2 = new MySqlCommand(query2, conn);
            cmd.Parameters.AddWithValue("@appointmentID", id);
            cmd1.Parameters.AddWithValue("@appointmentID", id);
            cmd2.Parameters.AddWithValue("@appointmentID", id);

            conn.Open();
            var reader = cmd.ExecuteReader();
            int taken = 0;
            while (reader.Read())
            {
                taken = Convert.ToInt32(reader["taken"]);
            }
            reader.Close();
            if (taken == 1)
            {
                cmd2.ExecuteNonQuery();
            }
            var reader1 = cmd1.ExecuteNonQuery();

            conn.Close();

            result = reader1;

            return result;
        }
        public static DataTable getRequestPool(int accountID, string dateFrom, string dateTo)
        {
            //string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query1 = "SELECT department_id from facility_staff where account_id=@accountID";

            var cmd1 = new MySqlCommand(query1, conn);
            cmd1.Parameters.AddWithValue("@accountID", accountID);

            conn.Open();
            var reader1 = cmd1.ExecuteReader();

            int departmentID = 0;
            if (reader1.Read())
            {
                departmentID = Convert.ToInt32(reader1["department_id"]);
            }

            conn.Close();

            string query = "SELECT appointment_id AS 'ID' ,date As 'Date', nric As 'NRIC', comments As 'Comments', TIME_FORMAT(time, '%h:%i%p') As 'Time' from appointment, facility, department,account where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND appointment.account_id=account.account_id AND taken=0 AND appointment.department_id=@departmentID AND date >=@dateFrom AND date <=@dateTo ORDER BY date";


            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@departmentID", departmentID);
            DateTime date = Convert.ToDateTime(dateFrom.Trim());
            string dateString = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            cmd.Parameters.AddWithValue("@dateFrom", dateString);

            date = Convert.ToDateTime(dateTo.Trim());
            dateString = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            cmd.Parameters.AddWithValue("@dateTo", dateString);
            conn.Open();
            var reader = cmd.ExecuteReader();


            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Date");
            dt.Columns.Add("NRIC");
            dt.Columns.Add("Time");
            dt.Columns.Add("Comments");
            

            int i = 0;


            while (reader.Read())
            {

                dt.Rows.Add();
                dt.Rows[i]["ID"] = reader["ID"].ToString();
                dt.Rows[i]["Date"] = String.Format("{0:dd/MM/yyyy}", reader["date"]);
                dt.Rows[i]["NRIC"] = reader["NRIC"].ToString();
                dt.Rows[i]["Time"] = reader["Time"].ToString();
                dt.Rows[i]["Comments"] = reader["Comments"].ToString();
                

                i++;

            }
            reader.Close();
            conn.Close();

            return dt;
        }
        public static int pickAppointment(string id, int accountID)
        {
            int result = 0;

            //string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT taken from appointment WHERE appointment_id=@appointmentID";
            string query1 = "INSERT into doctor_appointment VALUES(@accountID, @appointmentID)";
            string query2 = "UPDATE appointment SET taken=1 WHERE appointment_id=@appointmentID";
            var cmd = new MySqlCommand(query, conn);
            var cmd1 = new MySqlCommand(query1, conn);
            var cmd2 = new MySqlCommand(query2, conn);
            cmd.Parameters.AddWithValue("@appointmentID", id);
            cmd1.Parameters.AddWithValue("@accountID", accountID);
            cmd1.Parameters.AddWithValue("@appointmentID", id);
            cmd2.Parameters.AddWithValue("@appointmentID", id);

            conn.Open();
            var reader = cmd.ExecuteReader();
            int taken = 0;
            while (reader.Read())
            {
                taken = Convert.ToInt32(reader["taken"]);
            }
            reader.Close();
            if (taken == 0)
            {
                cmd2.ExecuteNonQuery();
            }
            var reader1 = cmd1.ExecuteNonQuery();

            conn.Close();

            result = reader1;
            return result;
        }
        public static DataTable getDoctorAppointmentHistory(int accountID)
        {
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT appointment.appointment_id AS 'ID' ,date As 'Date', nric As 'NRIC', comments As 'Comments', TIME_FORMAT(time, '%h:%i%p') As 'Time' from appointment, facility, department,doctor_appointment, account where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND appointment.appointment_id=doctor_appointment.appointment_id AND appointment.account_id=account.account_id AND doctor_appointment.account_id=@account AND date <@date";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@account", accountID);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
            conn.Open();
            var reader = cmd.ExecuteReader();


            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Date");
            dt.Columns.Add("NRIC");
            dt.Columns.Add("Time");
            dt.Columns.Add("Comments");

            int i = 0;


            while (reader.Read())
            {

                dt.Rows.Add();
                dt.Rows[i]["ID"] = reader["ID"].ToString();
                dt.Rows[i]["Date"] = String.Format("{0:dd/MM/yyyy}", reader["date"]);
                dt.Rows[i]["NRIC"] = reader["NRIC"].ToString();
                dt.Rows[i]["Time"] = reader["Time"].ToString();
                dt.Rows[i]["Comments"] = reader["Comments"].ToString();

                i++;

            }
            reader.Close();
            conn.Close();

            return dt;
        }
        public static DataTable getDoctorUpcomingAppointment(int accountID)
        {
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT appointment.appointment_id AS 'ID' ,date As 'Date', nric As 'NRIC', comments As 'Comments', TIME_FORMAT(time, '%h:%i%p') As 'Time' from appointment, facility, department,doctor_appointment, account where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND appointment.appointment_id=doctor_appointment.appointment_id AND appointment.account_id=account.account_id AND doctor_appointment.account_id=@account AND date >=@date";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@account", accountID);
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
            conn.Open();
            var reader = cmd.ExecuteReader();


            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Date");
            dt.Columns.Add("NRIC");
            dt.Columns.Add("Time");
            dt.Columns.Add("Comments");

            int i = 0;


            while (reader.Read())
            {

                dt.Rows.Add();
                dt.Rows[i]["ID"] = reader["ID"].ToString();
                dt.Rows[i]["Date"] = String.Format("{0:dd/MM/yyyy}", reader["date"]);
                dt.Rows[i]["NRIC"] = reader["NRIC"].ToString();
                dt.Rows[i]["Time"] = reader["Time"].ToString();
                dt.Rows[i]["Comments"] = reader["Comments"].ToString();

                i++;

            }
            reader.Close();
            conn.Close();

            return dt;
        }
       
    }
}