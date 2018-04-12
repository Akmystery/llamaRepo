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
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }



        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            bool check = true;

            lblNRIC.Text = lblPassword.Text = "";
            if (Validation.isEmpty(txtNRIC.Text))
            {
                lblNRIC.Text = "NRIC cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtPassword.Text))
            {
                lblPassword.Text = "Password cannot be empty";
                check = false;
            }



            if (check == true)
            {
                Account a = AccountVerificationSystem.LoginAccount(txtNRIC.Text, txtPassword.Text);

                if(a.nric==null)
                {
                    lblPassword.Text = "Invalid NRIC or password";
                }

                else if (a!=null)
                {
                    Session["Account"] = a;

                    switch(a.accountType)
                    {
                        case "patient":
                            Response.Redirect("HomePage.aspx", false);
                            break;
                        case "Doctor":
                            Response.Redirect("DoctorAppointmentPage.aspx", false);
                            break;
                        case "admin":
                            Response.Redirect("AdminHomePage.aspx", false);
                            break;
                        default:
                            Response.Redirect("LoginPage.aspx", false);
                            break;

                    };
                }
 
                    

            }
        }
    }
        
}