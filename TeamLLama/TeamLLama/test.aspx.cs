using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data.MySqlClient;
using TeamLLama.Controller;
using TeamLLama.Entity;

namespace TeamLLama
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT testName FROM test WHERE idTest=@idTest";
            
            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@idTest", 1);

            conn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var someValue = reader["testName"];
                Label1.Text = someValue.ToString();
                // Do something with someValue
            }*/
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AppointmentManagementSystem app = new AppointmentManagementSystem();
            int result=app.bookAppointment();
            Label1.Text = result.ToString();

            Appointment a=app.GetAppointment();
            appointmentLabel.Text = a.appointmentID.ToString();
            accountLabel.Text = a.accountID.ToString();
            facilityLabel.Text = a.facilityID.ToString();
            departmentLabel.Text = a.departmentID.ToString();
            timeLabel.Text = a.time;
            dateLabel.Text = a.date;
            takenLabel.Text = a.taken.ToString();
        }
    }
}