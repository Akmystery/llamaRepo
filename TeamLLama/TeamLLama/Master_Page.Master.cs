using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Entity;

namespace TeamLLama
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                Account a = new Account();
                a = (Account)Session["Account"];
                


                if(a != null)
            {
                Session["Type"] = a.accountType;
                lblUsername.Text = a.name;
                lblUsername_admin.Text = a.name;
            }
        
        }
    }
}