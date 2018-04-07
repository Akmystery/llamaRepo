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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["id"], out facilityId))
            {
                return;
            }

            FacilityManagementSystem app = new FacilityManagementSystem();
            Facility facility = app.GetFacility(facilityId);
            if (facility == null) {
                return;
            }
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

            Validation v = new Validation();
            Review r = new Review();
            r.rating = Rating1.CurrentRating;
            r.comment = txtComment.Text;
            if (v.isEmpty(r.comment))
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
                ReviewControlSystem rcs = new ReviewControlSystem();
                rcs.CreateReview(r);
                BindRatings();
                BindComments();
            }
        }

        public void BindRatings()
        {
            ReviewControlSystem rc = new ReviewControlSystem();
            double i = rc.GetAverageRating(facilityId);
            lblRatingNumber.Text = lblRating.Text = double.IsNaN(i)?"No Ratings Yet":i.ToString();
        }

        private void BindComments()
        {
            ReviewControlSystem rcs = new ReviewControlSystem();
            Comments.DataSource = rcs.GetAllReviews(facilityId);
            Comments.DataBind();
        }

        protected void btnBookAppointment_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookAppointmentPage.aspx");
        }
    }


}