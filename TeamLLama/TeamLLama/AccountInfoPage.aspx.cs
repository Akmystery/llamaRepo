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
    public partial class AccountInfoPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];
            if (a != null)
            {
                lblName.Text = a.name;
                lblNric.Text = a.nric;
                lblPassword.Text = a.password;
                lblEmail.Text = a.email;
                lblAddress.Text = a.address;
            }
        }

        protected void UpDate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateAccount.aspx");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];
            AccountManagementSystem app = new AccountManagementSystem();
            app.DeleteAccount(a.accountID);
            Session["Account"] = null;
            Response.Redirect("HomePage.aspx");
        }
    }
}