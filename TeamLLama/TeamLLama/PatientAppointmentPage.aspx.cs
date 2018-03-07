using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace TeamLLama
{
    public partial class PatientAppointmentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindAppointments(0);
                bindAppointments(1);
            }
        }
        private void bindAppointments(int c)
        {
            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            //string query = "SELECT date As 'Date', facility_name As 'Facility', department_name As 'Department', time As 'Time' from appointment, facility, department where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND account_id=1 AND date >=@date";
            string query;

            if (c == 1)
            {
                query = "SELECT appointment_id AS 'ID' ,date As 'Date', facility_name As 'Facility', department_name As 'Department', time As 'Time' from appointment, facility, department where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND account_id=@account AND date <@date";
            }
            else
            {
                query = "SELECT appointment_id AS 'ID' ,date As 'Date', facility_name As 'Facility', department_name As 'Department', time As 'Time' from appointment, facility, department where appointment.facility_id=facility.facility_id AND appointment.department_id=department.department_id AND account_id=@account AND date >=@date";

            }
            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@account", 1);
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

            if (c == 1)
            {
                grdAppointmentHistory.DataSource = dt;
                grdAppointmentHistory.DataBind();
            }
            else
            {
                grdUpcomingAppointment.DataSource = dt;
                grdUpcomingAppointment.DataBind();
            }
            
            
            reader.Close();
            conn.Close();
        }

        protected void grdAppointmentHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAppointmentHistory.PageIndex = e.NewPageIndex;
            bindAppointments(1);
        }
        protected void grdUpcomingAppointment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdUpcomingAppointment.PageIndex = e.NewPageIndex;
            bindAppointments(0);
        }

        protected void lbn_view_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblAppointmentID = grdAppointmentHistory.Rows[i].FindControl("lblAppointmentID") as System.Web.UI.WebControls.Label;
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
                lbl_id.Text= reader["ID"].ToString();
                lbl_DateDetail.Text= String.Format("{0:dd/MM/yyyy}", reader["date"]);
                lbl_FacilityDetail.Text= reader["Facility"].ToString();
                lbl_DepartmentDetail.Text = reader["Department"].ToString();
                lbl_TimeDetail.Text = reader["Time"].ToString();
            }

            reader.Close();
            conn.Close();
            btnDelete.Visible = false;
            mp1.Show();
        }
        protected void lbn_view1_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblAppointmentID1 = grdUpcomingAppointment.Rows[i].FindControl("lblAppointmentID1") as System.Web.UI.WebControls.Label;
            string appointmentID = lblAppointmentID1.Text;

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
            btnDelete.Visible = true;
            mp1.Show();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            string id = lbl_id.Text;

            string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
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
            var reader1=cmd1.ExecuteNonQuery();

            conn.Close();

            if (reader1 == 1)
            {
                Response.Write("<script type=\"text/javascript\">alert('Appointment Cancelled!');location.href='PatientAppointmentPage.aspx'</script>");

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Appointment Not Cancelled!');location.href='PatientAppointmentPage.aspx'</script>");
            }


        }
    }
}