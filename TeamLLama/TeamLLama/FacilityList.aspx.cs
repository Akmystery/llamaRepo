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
    public partial class FacilityList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindFacility();
        }

        private void bindFacility()
        {
            Facility f = new Facility();

            FacilityManagementSystem app = new FacilityManagementSystem();
            grdFacility.DataSource = app.GetFacility();
            grdFacility.DataBind();

        }
    }
}