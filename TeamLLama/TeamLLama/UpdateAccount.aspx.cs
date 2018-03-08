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
    public partial class UpdateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];
            txtNric.Attributes.Add("placeholder", a.nric);
            txtName.Attributes.Add("placeholder", a.name);
            txtPassword.Attributes.Add("placeholder", a.password);
            txtEmail.Attributes.Add("placeholder", a.email);
            txtAddress.Attributes.Add("placeholder", a.address);
        }

        protected void UpDate_Click(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];
            AccountManagementSystem app = new AccountManagementSystem();
            app.UpdateAccount(txtName.Text, txtPassword.Text, txtEmail.Text, txtAddress.Text, txtNric.Text, a.accountID);
            Response.Redirect("AccountInfoPage.aspx");
        }
    }
}