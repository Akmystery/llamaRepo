using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamLLama
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateDocAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCreateAccPage.aspx", false);
        }

        protected void CreateFacility_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateFacility.aspx", false);

        }

        protected void OpenFacility_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacilityListPage.aspx", false);
        }
    }
}