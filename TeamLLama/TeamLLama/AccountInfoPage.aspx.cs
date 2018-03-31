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
                lblEmail.Text = a.email;
                lblAddress.Text = a.address;
                profilePic.ImageUrl = "~/upload/user/" + a.photo;
            }
        }

        protected void UpDate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateAccountPage.aspx");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            passwordPopup.Show();
            /*Account a = new Account();
            a = (Account)Session["Account"];
            AccountManagementSystem app = new AccountManagementSystem();
            app.DeleteAccount(a.accountID);
            Session["Account"] = null;
            Response.Redirect("HomePage.aspx");*/

        }
        protected void btnYes_Click(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];
            if (txtPassword.Text == a.password)
            {
                deletePopup.Show();
            }
            else
            {
                confirmPopup.Show();
            }
        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];
            AccountManagementSystem app = new AccountManagementSystem();
            app.DeleteAccount(a.accountID);
            Session["Account"] = null;
            Response.Write("<script type=\"text/javascript\">alert('Account Deactivated!');location.href='LoginPage.aspx'</script>");
        }
    }
}