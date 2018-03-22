using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using TeamLLama.Entity;
using TeamLLama.Controller;

namespace TeamLLama
{
    public partial class DoctorAppointmentPage : System.Web.UI.Page
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

            int accountID = 2;

            if (a != null)
            {
                accountID = a.accountID;
            }
            AppointmentManagementSystem ams = new AppointmentManagementSystem();

            if (c == 1)
            {
                grdAppointmentHistory.DataSource = ams.getDoctorAppointmentHistory(accountID);
                grdAppointmentHistory.DataBind();
            }
            else
            {
                grdUpcomingAppointment.DataSource = ams.getDoctorUpcomingAppointment(accountID);
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
            Session["id"] = id;

            Response.Redirect("ReferPatient.aspx");
            

        }

        protected void btnRefer_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblNRIC = grdUpcomingAppointment.Rows[i].FindControl("lblNRIC") as System.Web.UI.WebControls.Label;
            lbl_id.Text = lblNRIC.Text;

            confirmPopup.Show();
        }
    }
}