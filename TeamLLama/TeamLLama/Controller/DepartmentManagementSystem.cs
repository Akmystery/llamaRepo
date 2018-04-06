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


    }
}