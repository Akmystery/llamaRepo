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
            Account a = new Account();
            a = (Account)Session["Account"];

            if (a == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!a.accountType.Equals("Doctor"))
            {
                Response.Redirect("LoginPage.aspx");
            }
            txtFromDate.Attributes.Add("readonly", "readonly");
            txtToDate.Attributes.Add("readonly", "readonly");
            if (!Page.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Date");
                dt.Columns.Add("NRIC");
                dt.Columns.Add("Time");
                dt.Columns.Add("Comments");
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
            
            grdPickAppointment.DataSource = AppointmentManagementSystem.getRequestPool(accountID,lblActualFrom.Text,lblActualTo.Text);
            grdPickAppointment.DataBind();
       
        }

        protected void grdPickAppointment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPickAppointment.PageIndex = e.NewPageIndex;
            bindAppointments();
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
            
            int result = AppointmentManagementSystem.pickAppointment(id, accountID);

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

        protected void btnPick_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblAppointmentID = grdPickAppointment.Rows[i].FindControl("lblAppointmentID") as System.Web.UI.WebControls.Label;
            lbl_id.Text = lblAppointmentID.Text;
            
            confirmPopup.Show();
        }
    }
}