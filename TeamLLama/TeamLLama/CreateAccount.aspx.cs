using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data.MySqlClient;
using TeamLLama.Controller;
using TeamLLama.Entity;

namespace TeamLLama
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            Validation vc = new Validation();
            bool check = true;

            lblPassword.Text = lblAddress.Text = lblEmail.Text = lblName.Text = lblPassword.Text = "";
            if (vc.isEmpty(txtName.Text))
            {
                lblName.Text = "Name cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtNric.Text))
            {
                lblNric.Text = "NRIC cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtPassword.Text))
            {
                lblPassword.Text = "Password cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtConfirmPassword.Text))
            {
                lblConfirmPassword.Text = "Password cannot be empty";
                check = false;
            }

            if (vc.ComparePassword(txtPassword.Text, txtConfirmPassword.Text) == false)
                {

                    lblPassword.Text = "Please re-enter password, Passwords are different";
                    check = false;
                }
                else if (vc.CheckEmail(txtEmail.Text) == false)
                {
                    lblEmail.Text = "Invalid Email";
                    check = false;
                }

            
            if(check == true)
            {
                Account a = new Account();
                a.name = txtName.Text;
                a.nric = txtNric.Text;
                a.password = txtPassword.Text;
                a.email = txtEmail.Text;
                a.address = txtAddress.Text;

                AccountManagementSystem app = new AccountManagementSystem();

                app.createAccount(a);

            }




        }
    }
}