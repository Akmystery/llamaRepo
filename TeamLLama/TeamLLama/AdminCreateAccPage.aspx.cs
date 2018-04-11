using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;
using TeamLLama.Entity;
using System.IO;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace TeamLLama
{
    public partial class AdminCreateAccPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                FacilityManagementSystem fms = new FacilityManagementSystem();

                FacilityDropDownList.DataSource = fms.GetAllfacility();
                FacilityDropDownList.DataBind();
                //FacilityDropDownList.Items.Insert(0, new ListItem("- Select faciliy -", ""));
            }
        }

        protected void FilterDept(object sender, EventArgs e) //action fired after selecting facility
        {

            DepartmentManagementSystem dms = new DepartmentManagementSystem();
           


            DepartmentDropDownList.DataSource = dms.getDepartmentsFromThisFacility(FacilityDropDownList.SelectedItem.Value);
            DepartmentDropDownList.DataBind();
        }

        protected void CreatrDocAcc_Click(object sender, EventArgs e)
        {
            Validation vc = new Validation();
            bool check = true;

            lblPassword.Text = lblAddress.Text = lblEmail.Text = lblName.Text = lblPassword.Text = lblConfirmPassword.Text = lblNric.Text = "";
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

            if (vc.isEmpty(txtEmail.Text))
            {
                lblEmail.Text = "Email cannot be empty";
                check = false;
            }

            if (vc.isEmpty(txtAddress.Text))
            {
                lblAddress.Text = "Address cannot be empty";
                check = false;
            }

            if (!vc.isEmpty(txtNric.Text) && vc.checkNricExist(txtNric.Text))
            {
                lblNric.Text = "This NRIC already got an account";
                check = false;
            }

            if (vc.ComparePassword(txtPassword.Text, txtConfirmPassword.Text) == false)

            {
                lblPassword.Text = "Please re-enter password, Passwords are different";
                check = false;
            }

            if (vc.CheckEmail(txtEmail.Text) == false)
            {
                lblEmail.Text = "Invalid Email";
                check = false;

            }

            if(DepartmentDropDownList.SelectedItem == null)
            {
                lblDepartment.Text = "This facility do not have department for the doctor to join";
                check = false;
            }

            if (ImageUpload.HasFile)
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
                if (!vc.ImageCheck(ext))
                {
                    check = false;
                    lblImage.Text = "Invalid image type";
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
                    ImageUpload.PostedFile.SaveAs(Server.MapPath("~/images/") + a.photo);
                };

                int deptID = Int32.Parse(DepartmentDropDownList.SelectedValue);

                AccountManagementSystem app = new AccountManagementSystem();

                app.createDocAccount(a,deptID);

                txtAddress.Text = txtEmail.Text = txtName.Text = txtNric.Text = "";
                lblPassword.Text = lblAddress.Text = lblEmail.Text = lblName.Text = lblPassword.Text = lblConfirmPassword.Text = lblNric.Text = "";
                Response.Write("<script type=\"text/javascript\">alert('Account is created successfully!');location.href='AdminHomePage.aspx'</script>");

            }

        }
    }
}