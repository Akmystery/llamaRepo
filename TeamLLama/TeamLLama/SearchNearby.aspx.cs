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
    public partial class SearchNearby : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FacilityManagementSystem app = new FacilityManagementSystem();
            List<Facility> facilities = app.SearchFacility(Request.QueryString["q"] ?? "");
            grdFacility.DataSource = facilities;
            grdFacility.DataBind();
        }
    }
}