using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;
using TeamLLama.Entity;
using System.IO;

namespace TeamLLama
{
    public partial class UpdateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];
            txtNric.Attributes.Add("placeholder",a.nric);
            txtName.Attributes.Add("placeholder",a.name);
            txtPassword.Attributes.Add("placeholder", a.password);
            txtEmail.Attributes.Add("placeholder",a.email);
            txtAddress.Attributes.Add("placeholder",a.address);
        }

        protected void UpDate_Click(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];

            Account update = new Account();
            AccountManagementSystem app = new AccountManagementSystem();

            if(string.IsNullOrEmpty(txtNric.Text))
            {
                update.nric = txtNric.Text = a.nric;
            }
            else
            {
                update.nric = txtNric.Text;
            }

           if(string.IsNullOrEmpty(txtName.Text))
            {
                update.name = txtName.Text = a.name;
            }
            else
            {
                update.name = txtName.Text;
            }

            if(string.IsNullOrEmpty(txtEmail.Text))
            {
                update.email = txtEmail.Text = a.email;
            }
            else
            {
                update.email = txtEmail.Text;
            }
            if(!string.Equals(txtPassword.Text, txtConfirmPassword.Text)){

                Response.Redirect("UpdateAccount.aspx");
            }
            else
            {
                if (string.IsNullOrEmpty(txtPassword.Text))
                {
                    update.password = txtPassword.Text = a.password;
                }
                else
                {
                    update.password = txtPassword.Text;
                }
            }
            
            if(string.IsNullOrEmpty(txtAddress.Text))
            {
                update.address = txtAddress.Text = a.address;
            }
            else
            {
                update.address = txtAddress.Text;
            }
            Validation vc = new Validation();
            if (ImageUpload.HasFile)
            {
                string ext = System.IO.Path.GetExtension(ImageUpload.PostedFile.FileName);
                if (!vc.ImageCheck(ext))
                {
                    lblImage.Text = "Invalid image type";
                }
                else
                {
                    update.photo = Path.GetFileName(ImageUpload.PostedFile.FileName);
                    ImageUpload.PostedFile.SaveAs(Server.MapPath("~/upload/user/") + update.photo);
                }

            }
            else
            {
                update.photo = a.photo;
            }

            Session["Account"] = update;
            app.UpdateAccount(txtName.Text, txtPassword.Text, txtEmail.Text, txtAddress.Text, txtNric.Text, update.photo, a.accountID);
            Response.Write("<script type=\"text/javascript\">alert('Account Info is successfully updated!');location.href='AccountInfoPage.aspx'</script>");
        }
    }
}