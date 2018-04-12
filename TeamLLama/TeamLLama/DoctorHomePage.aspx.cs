using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Entity;

namespace TeamLLama
{
    public partial class DoctorHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];

            if (a == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!a.accountType.Equals("Doctor"))
            {
                Response.Redirect("LoginPage.aspx");
            }
        }

        protected void btnPick_Click(object sender, EventArgs e)
        {
            Response.Redirect("PickAppointmentPage.aspx");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoctorAppointmentPage.aspx");
        }
    }
}