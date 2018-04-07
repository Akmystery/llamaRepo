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

        public int AddDepartment(Department[] a)
        {
            int result = 0;


            var conn = new MySqlConnection(dbConnectionString);

            string query = "INSERT into department (department_name,facility_id) VALUES (@department_name,@facility_id)";

            var cmd = new MySqlCommand(query, conn);

            int reader = 0; ;
            conn.Open();
            for (int i =0;i<a.Length;i++)
            {
                if(a[i] != null)
                { 
                cmd.Parameters.AddWithValue("@department_name", a[i].departmentName);
                cmd.Parameters.AddWithValue("@facility_id", a[i].facilityId);        
                reader = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                }
            }
            conn.Close();

            result = reader;

            return result;
        }

        public List<Department> getDepartments(string hospitalSelected)
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


        public void DeleteDepartments(String facilityid)
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


    }
}