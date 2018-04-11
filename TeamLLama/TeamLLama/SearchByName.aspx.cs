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
    public partial class SearchByName : System.Web.UI.Page
    {
        protected ReviewControlSystem rcs = new ReviewControlSystem();
        protected bool noResults = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            FacilityManagementSystem app = new FacilityManagementSystem();
            List<Facility> facilities = app.SearchFacility(Request.QueryString["q"]??"");
            if (facilities == null || facilities.Count == 0)
            {
                noResults = true;
                return;
            }
            listResults.DataSource = facilities;
            listResults.DataBind();
        }

        protected void btnSearchFacility_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("SearchByName.aspx?q={0}", Uri.EscapeDataString(tbSearch.Text)));
        }

    }
}