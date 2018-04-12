using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Entity;

namespace TeamLLama
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];

            if (a == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!a.accountType.Equals("admin"))
            {
                Response.Redirect("LoginPage.aspx");
            }
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

        protected void DeleteDocAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDeleteAccPage.aspx", false);
        }
        
    }
}