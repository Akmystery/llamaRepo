using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;
using TeamLLama.Entity;
using System.IO;


namespace TeamLLama
{
    public partial class ReviewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                BindRatings();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Account a = new Account();
            //a = (Account)Session["Account"];
            //int fac_id = (int)Session["fac_id"];

            Review r = new Review();
            r.rating = Rating1.CurrentRating;
            r.comment = "";
            //r.accountId = a.accountID;
            r.accountId = 1;
            //r.facilityId = fac_id;
            r.facilityId = 1;
            ReviewControlSystem rcs = new ReviewControlSystem();
            rcs.CreateReview(r);
            BindRatings();

        }

        public void BindRatings()
        {
            ReviewControlSystem rc = new ReviewControlSystem();
            double i = rc.GetAverageRating("1");
            lblRating.Text = i.ToString();
        }
    }
}