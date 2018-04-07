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
            //Session.Clear();
            //lblimg.ImageUrl = "~/images/logo.png"; //to load image
            /*string dbConnectionString = ConfigurationManager.ConnectionStrings["Llama"].ConnectionString;
            var conn = new MySqlConnection(dbConnectionString);

            string query = "SELECT testName FROM test WHERE idTest=@idTest";
            
            var cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@idTest", 1);

            conn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var someValue = reader["testName"];
                Label1.Text = someValue.ToString();
                // Do something with someValue
            }*/
        }



        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            Validation vc = new Validation();
            bool check = true;

            lblNRIC.Text = lblPassword.Text = "";
            if (vc.isEmpty(txtNRIC.Text))
            {
                lblNRIC.Text = "NRIC cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtPassword.Text))
            {
                lblPassword.Text = "Password cannot be empty";
                check = false;
            }



            if (check == true)
            {
                AccountVerificationSystem app = new AccountVerificationSystem();
                Account a = app.LoginAccount(txtNRIC.Text, txtPassword.Text);

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