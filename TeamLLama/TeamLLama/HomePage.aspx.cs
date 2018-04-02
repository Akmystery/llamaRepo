using System;

namespace TeamLLama
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearchFacility_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("SearchByName.aspx?q={0}", Uri.EscapeDataString(tbSearchFacility.Text)));
        }

        protected void btnSearchNearby_Click(object sender, EventArgs e)
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