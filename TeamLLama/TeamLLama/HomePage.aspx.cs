using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamLLama
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnPick_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookAppointmentPage.aspx");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientAppointmentPage.aspx");
        }
    }
}