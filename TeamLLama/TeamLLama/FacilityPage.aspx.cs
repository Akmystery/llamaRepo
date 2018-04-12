using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;
using TeamLLama.Entity;

namespace TeamLLama
{
    public partial class FacilityPage : System.Web.UI.Page
    {
        protected int facilityId;
        protected string facilityName;

        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];

            if (a == null)
            {
                btnBookAppointment.Visible = false;
            }
            facilityName = Request.QueryString["name"];
            Facility facility = FacilityManagementSystem.GetFacilityFromName(facilityName);
            if (facility == null) {
                return;
            }
            facilityId = facility.facilityID;
            lblName.Text = facility.facilityName;
            lblInformation.Text = facility.generalInfo;
            lblContact.Text = facility.phoneNumber.ToString();
            lblAddress.Text = facility.address;
            lblOperatingHours.Text = string.Format("{0} to {1}", facility.openingHrs, facility.closingHrs);

            if (!IsPostBack)
            {
                BindRatings();
                BindComments();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Account a = new Account();
            Account a = (Account)Session["Account"];
            //int fac_id = (int)Session["fac_id"];

            Review r = new Review();
            r.rating = Rating1.CurrentRating;
            r.comment = txtComment.Text;
            if (Validation.isEmpty(r.comment))
            {
                lblComment.Text = "Please write comment";
            }
            else
            {
                lblComment.Text = "";
                Rating1.CurrentRating = 0;
                txtComment.Text = "";
                r.accountId = a.accountID;
                r.facilityId = facilityId;
             
                ReviewControlSystem.CreateReview(r);
                BindRatings();
                BindComments();
            }
        }

        public void BindRatings()
        {
            double i = ReviewControlSystem.GetAverageRating(facilityId);
            lblRatingNumber.Text = lblRating.Text = double.IsNaN(i)?"No Ratings Yet":i.ToString();
        }

        private void BindComments()
        {
            Comments.DataSource = ReviewControlSystem.GetAllReviews(facilityId);
            Comments.DataBind();
        }

        protected void btnBookAppointment_Click(object sender, EventArgs e)
        {
            //Response.Redirect("BookAppointmentPage.aspx");
            Response.Redirect(string.Format("BookAppointmentPage.aspx?q={0}", Uri.EscapeDataString(lblName.Text)));
        }
    }


}