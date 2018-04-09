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
            DateTextBox.Attributes.Add("readonly", "readonly");//prevents textbox from losing text after postback
            if (!IsPostBack)
            {
                //set namedropdownlist names
                Account a = new Account();

                string nric = Session["id"].ToString();

                AppointmentManagementSystem ams = new AppointmentManagementSystem();
                a = ams.getAccountViaNRIC(nric);
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
            lblTime.Text = "";
            //set opening and closing label to visible
            if (HospitalDropDownList.SelectedItem.ToString() != "-Select a Hospital-")
            {
                lb_openingHrs.Visible = true;
                lb_closingHrs.Visible = true;
                lblHospital.Visible = false;
            }
            else
            {
                lb_openingHrs.Visible = false;
                lb_closingHrs.Visible = false;
            }


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
                HourChange("AM");

                AMPMDropDownList.ClearSelection();
                AMPMDropDownList.Items.FindByText(f.openingHrs.Substring(4, 2)).Selected = true;

                lb_actualOpening.Text = f.generalInfo;
                lb_actualClosing.Text = f.region;
                lb_actualClosing.Visible = true;
                lb_actualOpening.Visible = true;

            }
            else
            {
                HourDropDownList.Items.Clear();
                HourDropDownList.Items.Insert(0, new ListItem("-Hr-", "-1"));
                MinDropDownList.Items.Clear();
                MinDropDownList.Items.Insert(0, new ListItem("-Min-", "-1"));

                AMPMDropDownList.ClearSelection();

                lb_actualClosing.Visible = false;
                lb_actualOpening.Visible = false;

            }

        }

        protected void BookButton_Click(object sender, EventArgs e)
        {
            //check if any value is missing
            if (checkForEmptyField())
            {
                return;
            }

            DateTime myDate = DateTime.ParseExact(DateTextBox.Text.ToString(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);

            string time = HourDropDownList.SelectedValue.ToString() + ":" + MinDropDownList.SelectedItem.ToString() + ":00";
            TimeSpan mytime = TimeSpan.ParseExact(time, "hh\\:mm\\:ss", System.Globalization.CultureInfo.InvariantCulture);

            if (myDate < DateTime.Now && mytime < DateTime.Now.TimeOfDay)
            {
                lblTime.Text = "Select a date and time after " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + "!";
                return;
            }
            //good to go. show modalpopupextender
            //Panel1.Visible = true;
            confirmPopup.Show();


        }

        protected void YesButton_Click(object sender, EventArgs e)
        {
            AppointmentManagementSystem ams = new AppointmentManagementSystem();

            //get account id
            string nric = Session["id"].ToString();
            Account a = new Account();
            a = ams.getAccountViaNRIC(nric);

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
            Appointment ap = new Appointment();

            ap.accountID = accountID;
            ap.facilityID = Convert.ToInt32(HospitalDropDownList.SelectedValue);
            ap.departmentID = Convert.ToInt32(DepartmentDropDownList.SelectedValue);
            ap.time = time.ToString();
            ap.date = DateTextBox.Text; //this was lblActualDate.Text. is this intentional?
            ap.comments = "Referral - " + CommentTextBox.Text.ToString();
            int result = ams.bookAppointment(ap);

            if (result == 1)
            {
                Response.Write("<script type=\"text/javascript\">alert('Appointment Added!');location.href='DoctorAppointmentPage.aspx'</script>");
            }


        }
        protected void AMPMDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblTime.Text = "";
            if (HospitalDropDownList.SelectedItem.ToString() != "-Select a Hospital-")
            {
                if (AMPMDropDownList.SelectedValue.ToString() == "AM")
                {
                    HourChange("AM");
                }
                else if (AMPMDropDownList.SelectedValue.ToString() == "PM")
                {
                    HourChange("PM");
                }
                else
                {
                    HourDropDownList.Items.Clear();
                    HourDropDownList.Items.Insert(0, new ListItem("-Hr-", "-1"));//add heading in dropdownlist
                    MinDropDownList.Items.Clear();
                    MinDropDownList.Items.Insert(0, new ListItem("-Min-", "-1"));//add heading in dropdownlist
                }

            }


        }


        protected void HourDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            MinChange(Convert.ToInt32(HourDropDownList.SelectedValue));
            lblTime.Text = "";
        }

        void MinChange(int hour)
        {

            AppointmentManagementSystem ams = new AppointmentManagementSystem();
            Facility f = ams.getOpeningHrs(HospitalDropDownList.SelectedValue.ToString());
            int openHours = Convert.ToInt32(f.openingHrs.Substring(0, 2));
            int closeHours = Convert.ToInt32(f.closingHrs.Substring(0, 2));
            int openMins = Convert.ToInt32(f.openingHrs.Substring(2, 2));
            int closeMins = Convert.ToInt32(f.closingHrs.Substring(2, 2));

            MinDropDownList.Items.Clear();
            MinDropDownList.Items.Insert(0, new ListItem("-Min-", "-1"));//add heading in dropdownlist

            if (hour == openHours)
            {
                for (int min = openMins; min <= 45; min = min + 15)
                {
                    MinDropDownList.Items.Add(new ListItem(min.ToString(), min.ToString()));
                }
            }
            else if (hour == closeHours - 1)
            {
                for (int min = 0; min <= closeMins; min = min + 15)
                {
                    MinDropDownList.Items.Add(new ListItem(min.ToString(), min.ToString()));
                }
            }
            else if (hour == -1)
            {
                //do nothing~
            }
            else
            {

                for (int i = 0; i <= 45; i = i + 15)
                {
                    MinDropDownList.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

            }
            //set selected min to first index
            MinDropDownList.ClearSelection();
            if (hour != -1)
            {
                MinDropDownList.SelectedIndex = 1;
            }


            //change the text "0" to "00"
            if (MinDropDownList.SelectedItem.ToString() == "0")
            {
                MinDropDownList.SelectedItem.Text = "00";
            }
        }

        void HourChange(string AMPM)
        {
            AppointmentManagementSystem ams = new AppointmentManagementSystem();
            Facility f = ams.getOpeningHrs(HospitalDropDownList.SelectedValue.ToString());
            int openHours = Convert.ToInt32(f.openingHrs.Substring(0, 2));
            int closeHours = Convert.ToInt32(f.closingHrs.Substring(0, 2));

            HourDropDownList.Items.Clear();

            if (AMPM == "AM")
            {
                if (openHours > 12)//if opening time after 12pm no time slot in am
                {
                    HourDropDownList.Items.Add(new ListItem("No time slot!", "-1"));
                }
                else
                {
                    for (openHours = openHours + 0; openHours < closeHours && openHours < 12; openHours++)//add time slot in dropdownlist
                    {
                        HourDropDownList.Items.Add(new ListItem(openHours.ToString(), openHours.ToString()));
                    }
                }

            }
            else if (AMPM == "PM")
            {
                if (closeHours < 12)//if closing time before 12pm no slot for pm slot
                {
                    HourDropDownList.Items.Add(new ListItem("No time slot!", "-1"));
                }
                else
                {
                    if (openHours < 12)//if opening time before 12pm set open to 12pm for pm slot
                    {
                        openHours = 12;
                    }

                    for (openHours = openHours + 0; openHours < closeHours; openHours++)
                    {
                        if (openHours != 12)
                        {
                            HourDropDownList.Items.Add(new ListItem((openHours - 12).ToString(), openHours.ToString()));//minus 12 cos time is in 24 hr format. 12pm dunnid minus
                        }
                        else
                        {
                            HourDropDownList.Items.Add(new ListItem((openHours).ToString(), openHours.ToString()));
                        }

                    }
                }

            }
            HourDropDownList.ClearSelection();

            //add "0" to single digit number. e.g. "8" becomes "08"
            foreach (ListItem li in HourDropDownList.Items)
            {
                if (Convert.ToInt32(li.Value) < 10)
                {
                    li.Text = "0" + li.Text;
                    li.Value = li.Text;
                }
            }
            HourDropDownList.Items.Insert(0, new ListItem("-Hr-", "-1"));//add heading in dropdownlist
            //set default value of hour
            HourDropDownList.ClearSelection();
            HourDropDownList.SelectedIndex = 1;

            openHours = Convert.ToInt32(f.openingHrs.Substring(0, 2));//reset open time

            if (AMPM == "PM" && openHours < 12)//if opening time before 12pm set open to 12pm for pm slot
            {
                openHours = 12;
            }

            MinChange(openHours);//set mins
        }

        Boolean checkForEmptyField()
        {
            Boolean empty = false;
            if (HospitalDropDownList.SelectedValue.ToString() == "-1")
            {
                lblHospital.Visible = true;
                empty = true;
            }

            if (DepartmentDropDownList.SelectedValue.ToString() == "-1")
            {
                lblDepartment.Visible = true;
                empty = true;
            }

            if (Request.Form[DateTextBox.UniqueID] == "")
            {
                lblDate.Visible = true;
                empty = true;
            }

            String timeText = "";

            if (HourDropDownList.SelectedValue.ToString() == "-1")
            {
                timeText += "Hour";
            }
            if (MinDropDownList.SelectedValue.ToString() == "-1")
            {
                if (timeText != "")
                {
                    timeText += ", Min";
                }
                else
                {
                    timeText += "Min";
                }

            }
            if (AMPMDropDownList.SelectedValue.ToString() == "-1")
            {
                if (timeText != "")
                {
                    timeText += ", AM/PM";
                }
                else
                {
                    timeText += "AM/PM";
                }

            }
            if (timeText != "")
            {
                timeText += " cannot be empty";
                empty = true;
            }

            lblTime.Text = timeText;
            return empty;
        }

        protected void DepartmentDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DepartmentDropDownList.SelectedItem.ToString() != "")
            {
                lblDepartment.Visible = false;
            }

        }

        protected void DateTextBox_TextChanged(object sender, EventArgs e)
        {
            //convert datetextbox + time to DateTime
            //string time = HourDropDownList.SelectedValue.ToString() + ":" + MinDropDownList.SelectedItem.ToString() + ":00";
            DateTime myDate = DateTime.ParseExact(DateTextBox.Text.ToString(), "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);

            //check if selected date and time is before today
            if (myDate < DateTime.Now && myDate.Day != DateTime.Now.Day)
            {

                DateTextBox.Text = "";
                lblDate.Text = "Select a date after " + DateTime.Now.ToString("yyyy-MM-dd") + "!";
                lblDate.Visible = true;

            }
            else
            {
                lblDate.Text = "";
                lblDate.Visible = false;
            }
        }

        protected void MinDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblTime.Text = "";
        }
    }
}