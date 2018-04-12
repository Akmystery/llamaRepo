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
                            Response.Write("<script type=\"text/javascript\">alert('Welcome Back!');location.href='HomePage.aspx'</script>");
                            break;
                        case "Doctor":
                            Response.Write("<script type=\"text/javascript\">alert('Welcome Back Doctor!');location.href='DoctorAppointmentPage.aspx'</script>");
                            break;
                        case "admin":
                            Response.Write("<script type=\"text/javascript\">alert('Welcome Back Admin!');location.href='AdminHomePage.aspx'</script>");
                            break;
                        default:
                            Response.Write("<script type=\"text/javascript\">alert('Login Failed!');location.href='LoginPage.aspx'</script>");
                            break;

                    };
                }
 
                    

            }
        }
    }
        
}