using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using TeamLLama.Controller;
using TeamLLama.Entity;
using System.Data;

namespace TeamLLama
{
    public partial class ReferPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //set namedropdownlist names
                Account a = new Account();
                a = (Account)Session["id"];

                int accountID = 1;

                if (a != null)
                {
                    accountID = a.accountID;
                }
                AppointmentManagementSystem ams = new AppointmentManagementSystem();
                a = ams.getAccount(accountID);
                lb_name.Text = a.name;
                lb_id.Text = a.accountID.ToString();

                //set hospitaldropdownlist
                HospitalDropDownList.DataSource = ams.getFacilities();
                HospitalDropDownList.DataTextField = "facilityName";
                HospitalDropDownList.DataValueField = "facilityID";
                HospitalDropDownList.DataBind();

                HospitalDropDownList.Items.Insert(0, new ListItem("-Select a Hospital-", "-1"));//add blank space at top of droplist

            }
        }

        protected void HospitalDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            AppointmentManagementSystem ams = new AppointmentManagementSystem();

            DepartmentDropDownList.DataSource = ams.getDepartments(HospitalDropDownList.SelectedValue.ToString());
            DepartmentDropDownList.DataTextField = "departmentName";
            DepartmentDropDownList.DataValueField = "departmentID";
            DepartmentDropDownList.DataBind();


            DepartmentDropDownList.Items.Insert(0, new ListItem("(Select a Department)", "-1"));

            //get opening hours and set it
            if (HospitalDropDownList.SelectedValue.ToString() != "-1")
            {
                Facility f = ams.getOpeningHrs(HospitalDropDownList.SelectedValue.ToString());
                int open = Convert.ToInt32(f.openingHrs.Substring(0, 2));

                HourDropDownList.ClearSelection();
                HourDropDownList.Items.FindByText(open.ToString()).Selected = true;

                MinDropDownList.ClearSelection();
                MinDropDownList.Items.FindByText(f.openingHrs.Substring(2, 2)).Selected = true;

                AMPMDropDownList.ClearSelection();
                AMPMDropDownList.Items.FindByText(f.openingHrs.Substring(4, 2)).Selected = true;

                lb_actualOpening.Text = f.generalInfo;
                lb_actualClosing.Text = f.region;
                lb_actualClosing.Visible = true;
                lb_actualOpening.Visible = true;

            }
            else
            {
                HourDropDownList.ClearSelection();

                MinDropDownList.ClearSelection();

                AMPMDropDownList.ClearSelection();

                lb_actualClosing.Visible = false;
                lb_actualOpening.Visible = false;

            }

        }

        protected void BookButton_Click(object sender, EventArgs e)
        {
            //get opening hours and closing hours of selected hospital from database and store in int open and close

            lblActualDate.Text = Request.Form[TextBox1.UniqueID];
            AppointmentManagementSystem ams = new AppointmentManagementSystem();
            Facility f = ams.getOpeningHrs(HospitalDropDownList.SelectedValue.ToString());

            int open = 0;
            int close = 0;

            open = Convert.ToInt32(f.openingHrs.Substring(0, 2));
            close = Convert.ToInt32(f.closingHrs.Substring(0, 2));


            //convert selected time (HourDropDownList) into 24 hour format and store in int time
            int time = -1;
            if (HourDropDownList.SelectedValue != " ")
            {
                time = Convert.ToInt32(HourDropDownList.SelectedValue);
                if (AMPMDropDownList.SelectedValue.ToString() == "PM")
                {
                    time = time + 12;
                }
            }

            DateTime check;
            //check if any value is missing
            if (HospitalDropDownList.SelectedValue.ToString() == "-1" ||
                Request.Form[TextBox1.UniqueID] == "" ||//date
                HourDropDownList.SelectedValue.ToString() == "-1" ||
                MinDropDownList.SelectedValue.ToString() == "-1" ||
                AMPMDropDownList.SelectedValue.ToString() == "-1" ||
                DepartmentDropDownList.SelectedValue.ToString() == "-1")
            {
                Panel1.Visible = false;

                if (Request.Form[TextBox1.UniqueID] == "")
                {
                    Response.Write("<script type=\"text/javascript\">alert('Date Missing!');</script>");
                }
                else if (HospitalDropDownList.SelectedValue.ToString() == "-1")
                {
                    Response.Write("<script type=\"text/javascript\">alert('Hospital Missing!');</script>");
                }
                else if (DepartmentDropDownList.SelectedValue.ToString() == "-1")
                {
                    Response.Write("<script type=\"text/javascript\">alert('Department Missing');</script>");
                }
                else if (HourDropDownList.SelectedValue.ToString() == "-1")
                {
                    Response.Write("<script type=\"text/javascript\">alert('Hour Missing!');</script>");
                }
                else if (MinDropDownList.SelectedValue.ToString() == "-1")
                {
                    Response.Write("<script type=\"text/javascript\">alert('Min Missing!');</script>");
                }
                else if (AMPMDropDownList.SelectedValue.ToString() == "-1")
                {
                    Response.Write("<script type=\"text/javascript\">alert('AM/ PM Missing!');</script>");
                }

                ModalPopupExtender1.Show();

            }
            //check if selected date is before today
            else if (DateTime.TryParse(Request.Form[TextBox1.UniqueID], out check) && check < DateTime.Now)
            {
                TextBox1.Text = "";

                Panel1.Visible = false;
                Response.Write("<script type=\"text/javascript\">alert('Select a date after " + DateTime.Now.ToString("dd/MM/yyyy") + "!');</script>");
                ModalPopupExtender1.Show();
            }
            //check if selected time is before or after opening and closing hours
            else if (time < open || time > close)
            {
                if (close <= 12)
                    Response.Write("<script type=\"text/javascript\">alert('Opening hours is from " + open.ToString() + "am to " + close.ToString() + "pm!');</script>");
                else
                    Response.Write("<script type=\"text/javascript\">alert('Opening hours is from " + open.ToString() + "am to " + (close - 12).ToString() + "pm!');</script>");

                HourDropDownList.ClearSelection();
                MinDropDownList.ClearSelection();
                AMPMDropDownList.ClearSelection();
            }
            //good to go. show modalpopupextender
            else
            {
                Panel1.Visible = true;
                ModalPopupExtender1.Show();
            }


        }

        protected void YesButton_Click(object sender, EventArgs e)
        {
            //get account id
            Account a = new Account();
            a = (Account)Session["id"];

            int accountID = 1;

            if (a != null)
            {
                accountID = a.accountID;
            }
            int time;
            if (AMPMDropDownList.SelectedValue.ToString() == "PM")
            {
                time = (Convert.ToInt32(HourDropDownList.SelectedValue) + 12) * 10000 + Convert.ToInt32(MinDropDownList.SelectedValue) * 100;
            }
            else
            {
                time = Convert.ToInt32(HourDropDownList.SelectedValue) * 10000 + Convert.ToInt32(MinDropDownList.SelectedValue) * 100;
            }

            //insert values into database and redirect to patientappointment page
            AppointmentManagementSystem ams = new AppointmentManagementSystem();
            Appointment ap = new Appointment();

            ap.accountID = accountID;
            ap.facilityID = Convert.ToInt32(HospitalDropDownList.SelectedValue);
            ap.departmentID = Convert.ToInt32(DepartmentDropDownList.SelectedValue);
            ap.time = time.ToString();
            ap.date = lblActualDate.Text;
            ap.comments= "Referral - " + CommentTextBox.Text.ToString();
            int result = ams.bookAppointment(ap);

            if (result == 1)
            {
                Response.Write("<script type=\"text/javascript\">alert('Appointment Added!');location.href='PatientAppointmentPage.aspx'</script>");
            }
            
            
        }
    }
}