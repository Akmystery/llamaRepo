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
using TeamLLama.Entity;
using TeamLLama.Controller;

namespace TeamLLama
{
    public partial class PickAppointmentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Date");
                dt.Columns.Add("Facility");
                dt.Columns.Add("Department");
                dt.Columns.Add("Time");
                grdPickAppointment.DataSource = dt;
                grdPickAppointment.DataBind();
            }
        }

        private void bindAppointments()
        {
            Account a = new Account();
            a = (Account)Session["Account"];

            int accountID = 2;

            if (a != null)
            {
                accountID = a.accountID;
            }
            AppointmentManagementSystem ams = new AppointmentManagementSystem();

            
            grdPickAppointment.DataSource = ams.getRequestPool(accountID,lblActualFrom.Text,lblActualTo.Text);
            grdPickAppointment.DataBind();
       
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

            mp1.Show();
        }
        
        protected void btnYes_Click(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];

            int accountID = 2;

            if (a != null)
            {
                accountID = a.accountID;
            }

            string id = lbl_id.Text;

            AppointmentManagementSystem ams = new AppointmentManagementSystem();

            int result = ams.pickAppointment(id, accountID);

            if (result == 1)
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
                DateTime d1 = DateTime.Parse(lblActualFrom.Text);
                DateTime d2 = DateTime.Parse(lblActualTo.Text);
                if (DateTime.Compare(d1, d2)>0)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Please select Valid Date Range!')</script>");

                }
                else
                {
                    bindAppointments();
                }
                
            }
            
        }
    }
}