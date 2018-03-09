using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using TeamLLama.Controller;
using TeamLLama.Entity;

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
            Account a = new Account();
            a = (Account)Session["Account"];

            int accountID=1;

            if (a != null)
            {
                accountID = a.accountID;
            }
            AppointmentManagementSystem ams = new AppointmentManagementSystem();
           
            if (c == 1)
            {
                grdAppointmentHistory.DataSource = ams.getAppointmentHistory(accountID);
                grdAppointmentHistory.DataBind();
            }
            else
            {
                grdUpcomingAppointment.DataSource = ams.getUpcomingAppointments(accountID);
                grdUpcomingAppointment.DataBind();
            }
            
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

            AppointmentManagementSystem ams = new AppointmentManagementSystem();

            Appointment ap = ams.getPatientAppointment(appointmentID);
            if (ap!=null)
            {
                lbl_id.Text = ap.appointmentID.ToString();
                lbl_DateDetail.Text= String.Format("{0:dd/MM/yyyy}", ap.date);
                lbl_FacilityDetail.Text = ap.facilityName;
                lbl_DepartmentDetail.Text = ap.departmentName;
                lbl_TimeDetail.Text = ap.time;
            }

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

            AppointmentManagementSystem ams = new AppointmentManagementSystem();

            Appointment ap = ams.getPatientAppointment(appointmentID);

            if (ap != null)
            {
                lbl_id.Text = ap.appointmentID.ToString();
                lbl_DateDetail.Text = String.Format("{0:dd/MM/yyyy}", ap.date);
                lbl_FacilityDetail.Text = ap.facilityName;
                lbl_DepartmentDetail.Text = ap.departmentName;
                lbl_TimeDetail.Text = ap.time;
            }
            
            btnDelete.Visible = true;
            mp1.Show();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            string id = lbl_id.Text;

            AppointmentManagementSystem ams = new AppointmentManagementSystem();
            int result=ams.deleteAppointment(id);
            

            if (result == 1)
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