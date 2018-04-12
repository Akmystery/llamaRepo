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
            Account a = new Account();
            a = (Account)Session["Account"];
            
            if (a == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
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
            
            if (c == 1)
            {
                grdAppointmentHistory.DataSource = AppointmentManagementSystem.getAppointmentHistory(accountID);
                grdAppointmentHistory.DataBind();
            }
            else
            {
                grdUpcomingAppointment.DataSource = AppointmentManagementSystem.getUpcomingAppointments(accountID);
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
        
        protected void btnYes_Click(object sender, EventArgs e)
        {
            string id = lbl_id.Text;

            int result= AppointmentManagementSystem.deleteAppointment(id);
            

            if (result == 1)
            {
                Response.Write("<script type=\"text/javascript\">alert('Appointment Cancelled!');location.href='PatientAppointmentPage.aspx'</script>");

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Appointment Not Cancelled!');location.href='PatientAppointmentPage.aspx'</script>");
            }


        }

        protected void btn_Delete1_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblAppointmentID = grdUpcomingAppointment.Rows[i].FindControl("lblAppointmentID1") as System.Web.UI.WebControls.Label;
            lbl_id.Text = lblAppointmentID.Text;

            confirmPopup.Show();
        }
    }
}