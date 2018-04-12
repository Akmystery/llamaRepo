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
using System.IO;

namespace TeamLLama
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void create_Click(object sender, EventArgs e)
        {
            bool check = true;

            lblPassword.Text = lblAddress.Text = lblEmail.Text = lblName.Text = lblPassword.Text = lblConfirmPassword.Text = lblNric.Text = "";
            if (Validation.isEmpty(txtName.Text))
            {
                lblName.Text = "Name cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtNric.Text))
            {
                lblNric.Text = "NRIC cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtPassword.Text))
            {
                lblPassword.Text = "Password cannot be empty";
                check = false;
            }
            if (Validation.isEmpty(txtConfirmPassword.Text))
            {
                lblConfirmPassword.Text = "Password cannot be empty";
                check = false;
            }

            if (Validation.isEmpty(txtEmail.Text))
            {
                lblEmail.Text = "Email cannot be empty";
                check = false;
            }

            if (Validation.isEmpty(txtAddress.Text))
            {
                lblAddress.Text = "Address cannot be empty";
                check = false;
            }

            if (!Validation.isEmpty(txtNric.Text) && Validation.checkNricExist(txtNric.Text))
            {
                lblNric.Text = "There is already an account with this nric number";
                check = false;
            }

            if (Validation.ComparePassword(txtPassword.Text, txtConfirmPassword.Text) == false)

            {
                lblPassword.Text = "Confirmed password does not match";
                check = false;
            }

            if (Validation.CheckEmail(txtEmail.Text) == false)
            {
                lblEmail.Text = "Invalid Email Address format";
                check = false;

            }

            if(ImageUpload.HasFile)
            {
                string ext = System.IO.Path.GetExtension(ImageUpload.PostedFile.FileName);

                byte[] bytes = ImageUpload.FileBytes;
                int width;
                int height;

                using (Stream memStream = new MemoryStream(bytes))
                {
                    using (System.Drawing.Image img = System.Drawing.Image.FromStream(memStream))
                    {
                        width = img.Width;
                        height = img.Height;
                    }
                }
                if (!Validation.ImageCheck(ext))
                { 
                    check = false;
                    lblImage.Text = "This Picture format is not supported by the system";
                }
                else if (width > 500 || height > 300)
                {
                    lblImage.Text = "Profile Picture size does not meet specified requirements 500x300 pixels";
                    check = false;
                }
            }


            if (check == true)
            {
                Account a = new Account();
                a.name = txtName.Text;
                a.nric = txtNric.Text;
                a.password = txtPassword.Text;
                a.email = txtEmail.Text;
                a.address = txtAddress.Text;

                if (ImageUpload.HasFile)
                {  
                    a.photo = Path.GetFileName(ImageUpload.PostedFile.FileName);
                    ImageUpload.PostedFile.SaveAs(Server.MapPath("~/upload/user/") + a.photo);
                }
            
                AccountManagementSystem.createAccount(a);

                Response.Write("<script type=\"text/javascript\">alert('Account is created successfully!');location.href='LoginPage.aspx'</script>");

            }




        }
    }
}