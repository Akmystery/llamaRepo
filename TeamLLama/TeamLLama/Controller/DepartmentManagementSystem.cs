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
    public class DepartmentManagementSystem
    {
        static string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;

        public static int AddDepartment(Department[] a)
        {
            int result = 0;


            var conn = new MySqlConnection(dbConnectionString);

            string query = "INSERT into department (department_name,facility_id) VALUES (@department_name,@facility_id)";

            var cmd = new MySqlCommand(query, conn);

            int reader = 0; ;
            
            for (int i =0;i<a.Length;i++)
            {
                if(a[i] != null && !checkdepartmentexist(a[i].facilityId, a[i].departmentName))
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@department_name", a[i].departmentName);
                cmd.Parameters.AddWithValue("@facility_id", a[i].facilityId);        
                reader = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                    conn.Close();
                }
            }
            

            result = reader;

            return result;
        }

        public static bool checkdepartmentexist(int hospitalSelected, string department)
        {
            using (MySqlConnection conn = new MySqlConnection(dbConnectionString))
            {
                string FacQuery = "Select department_id, department_name from department where facility_id = @s AND department_name= @dn";
                MySqlCommand FacCmd = new MySqlCommand(FacQuery, conn);
                FacCmd.Parameters.AddWithValue("@s", hospitalSelected);
                FacCmd.Parameters.AddWithValue("@dn", department);
                conn.Open();

                MySqlDataReader dr;
                dr = FacCmd.ExecuteReader();
                while (dr.Read())
                {
                    return true;
                }
                conn.Close();

            }
            return false;
        }

        public static List<Department> getDepartments(string hospitalSelected)
        {
            List<Department> d = new List<Department>();
            using (MySqlConnection conn = new MySqlConnection(dbConnectionString))
            {
                string FacQuery = "Select department_id, department_name from department where facility_id = @s";
                MySqlCommand FacCmd = new MySqlCommand(FacQuery, conn);
                FacCmd.Parameters.AddWithValue("@s", hospitalSelected);
                conn.Open();

                MySqlDataReader dr;
                dr = FacCmd.ExecuteReader();
                while (dr.Read())
                {
                    Department d1 = new Department();
                    d1.departmentID = Convert.ToInt32(dr["department_id"]);
                    d1.departmentName = dr["department_name"].ToString();
                    d.Add(d1);
                }
                conn.Close();

            }
            return d;
        }


        public static DataTable getDepartmentsFromThisFacility(string FacilitySelected)
        {
            Facility f = new Facility();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT department_id, department_name FROM department where facility_id="+ FacilitySelected;

            var cmd = new MySqlCommand(query, conn);

            DataTable dt = new DataTable();
            dt.Columns.Add("department_id");
            dt.Columns.Add("department_name");

            int i = 0;

            conn.Open();
            var reader = cmd.ExecuteReader();


            while (reader.Read())
            {

                dt.Rows.Add();
                dt.Rows[i]["department_id"] = reader["department_id"].ToString();
                dt.Rows[i]["department_name"] = reader["department_name"].ToString();
                i++;
            }
            reader.Close();
            conn.Close();

            return dt;
        }



        public static void DeleteDepartments(String facilityid)
        {

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "DELETE FROM department WHERE facility_id=@id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", facilityid);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteDepartment(Department[] a)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "DELETE FROM department WHERE facility_id=@facility_id AND department_name=@department_name";

            var cmd = new MySqlCommand(query, conn);

            conn.Open();

            for (int i = 0; i < a.Length; i++)
            {
                if (a[i] != null)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@department_name", a[i].departmentName);
                    cmd.Parameters.AddWithValue("@facility_id", a[i].facilityId);
                    cmd.ExecuteNonQuery();
                }
            }


            conn.Close();

        }

        public static String CheckDepartmentForStaff(Department a)
        {
            using (MySqlConnection conn = new MySqlConnection(dbConnectionString))
            {
                // to get dept id
                string FacQuery2 = "Select department_id, department_name from department where facility_id = @s AND department_name = @n";
                MySqlCommand FacCmd2 = new MySqlCommand(FacQuery2, conn);
                FacCmd2.Parameters.AddWithValue("@s", a.facilityId);
                FacCmd2.Parameters.AddWithValue("@n", a.departmentName);

                Department dept = new Department();
                    dept.departmentID = -1;

                conn.Open();

                MySqlDataReader dr;
                dr = FacCmd2.ExecuteReader();
                while (dr.Read())
                {
                    dept.departmentID = Convert.ToInt32(dr["department_id"]);
                    dept.departmentName = dr["department_name"].ToString();
                }
                conn.Close();

                conn.Open();
                if(dept.departmentID != -1)
                { 
                string FacQuery = "Select * from facility_staff WHERE department_id=@s";
                MySqlCommand FacCmd = new MySqlCommand(FacQuery, conn);
                FacCmd.Parameters.AddWithValue("@s", dept.departmentID);
                dr = FacCmd.ExecuteReader();
                while (dr.Read())
                {
                    return dept.departmentName; //cannot delete
                }
                }
                conn.Close();

            }

            return null; //can delete

   

        }

        public static Department GetDepartmentByUserID(int id)
        {
            Department f = new Department();
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT department.department_id,department_name,facility_id FROM department,facility_staff where facility_staff.department_id=department.department_id AND account_id=@id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", id);

            conn.Open();
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                f.departmentID = Convert.ToInt32(reader["department_id"]);
                f.departmentName = reader["department_name"].ToString();
                f.facilityId = Convert.ToInt32(reader["facility_id"]);
            }
            conn.Close();
            return f;
        }


        public static void UpdateDepartment(int departmentID, String departmentName, int facilityid)
        {

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "UPDATE department SET department_name=@department_name,facility_id=@facility_id WHERE department_id=@department_id";

            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@department_name", departmentName);
            cmd.Parameters.AddWithValue("@facility_id", facilityid);
            cmd.Parameters.AddWithValue("@department_id", departmentID);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

    }
}