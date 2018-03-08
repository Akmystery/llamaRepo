using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Globalization;

namespace TeamLLama
{
    public partial class PickAppointmentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //bindAppointments();
            }
        }

        private void bindAppointments()
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query1 = "SELECT department_id from facility_staff where account_id=@accountID";

            var cmd1 = new MySqlCommand(query1, conn);
            cmd1.Parameters.AddWithValue("@accountID", 2);

            conn.Open();
            var reader1 = cmd1.ExecuteReader();

            int departmentID = 0;
            if (reader1.Read())
            {
                departmentID = Convert.ToInt32(reader1["department_id"]);
            }

            conn.Close();

            string query = "SELECT appointment_id AS 'ID' ,date As 'Date', facility_name As 'Facility', department_name As 'Department', time As 'Time' from appointment, facility, department where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND taken=0 AND appointment.department_id=@departmentID AND date >=@dateFrom AND date <=@dateTo ORDER BY date";

                
            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@departmentID", departmentID);
            DateTime date = Convert.ToDateTime(lblActualFrom.Text.Trim());
            string dateString = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            cmd.Parameters.AddWithValue("@dateFrom", dateString);

            date = Convert.ToDateTime(lblActualTo.Text.Trim());
            dateString = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            cmd.Parameters.AddWithValue("@dateTo", dateString);
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
            grdPickAppointment.DataSource = dt;
            grdPickAppointment.DataBind();
       
            reader.Close();
            conn.Close();
        }

        protected void grdPickAppointment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPickAppointment.PageIndex = e.NewPageIndex;
            bindAppointments();
        }
       
        protected void lbn_view_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblAppointmentID = grdPickAppointment.Rows[i].FindControl("lblAppointmentID") as System.Web.UI.WebControls.Label;
            string appointmentID = lblAppointmentID.Text;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT appointment_id AS 'ID' ,date As 'Date', facility_name As 'Facility', department_name As 'Department', time As 'Time' from appointment, facility, department where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND appointment_id=@appointmentID";
            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@appointmentID", appointmentID);

            conn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lbl_id.Text = reader["ID"].ToString();
                lbl_DateDetail.Text = String.Format("{0:dd/MM/yyyy}", reader["date"]);
                lbl_FacilityDetail.Text = reader["Facility"].ToString();
                lbl_DepartmentDetail.Text = reader["Department"].ToString();
                lbl_TimeDetail.Text = reader["Time"].ToString();
            }

            reader.Close();
            conn.Close();
            
            mp1.Show();
        }
        
        protected void btnYes_Click(object sender, EventArgs e)
        {
            string id = lbl_id.Text;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT taken from appointment WHERE appointment_id=@appointmentID";
            string query1 = "INSERT into doctor_appointment VALUES(@accountID, @appointmentID)";
            string query2 = "UPDATE appointment SET taken=1 WHERE appointment_id=@appointmentID";
            var cmd = new MySqlCommand(query, conn);
            var cmd1 = new MySqlCommand(query1, conn);
            var cmd2 = new MySqlCommand(query2, conn);
            cmd.Parameters.AddWithValue("@appointmentID", id);
            cmd1.Parameters.AddWithValue("@accountID", 2);
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

            if (reader1 == 1)
            {
                Response.Write("<script type=\"text/javascript\">alert('Appointment Added!');location.href='DoctorAppointmentPage.aspx'</script>");

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Appointment Not Added!');location.href='DoctorAppointmentPage.aspx'</script>");
            }


        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Request.Form[txtFromDate.UniqueID])|| string.IsNullOrWhiteSpace(Request.Form[txtToDate.UniqueID]))
            {
                Response.Write("<script type=\"text/javascript\">alert('Please select Dates!')</script>");

            }
            else
            {
                lblActualFrom.Text = Request.Form[txtFromDate.UniqueID];
                lblActualTo.Text = Request.Form[txtToDate.UniqueID];
                bindAppointments();
            }
            
        }
    }
}