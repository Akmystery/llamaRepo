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
            Response.Redirect(string.Format("SearchByName.aspx?q={0}", Uri.EscapeDataString(tbSearch.Text)));
        }

        protected void btnSearchNearby_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("SearchNearby.aspx?q={0}", Uri.EscapeDataString(tbSearch.Text)));
        }
    }
}