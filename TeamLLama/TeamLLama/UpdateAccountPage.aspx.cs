using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;
using TeamLLama.Entity;
using System.IO;
using System.Drawing;

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
            Boolean check = true;
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
            
            if (string.IsNullOrEmpty(txtPassword.Text))
            {
                    update.password = txtPassword.Text = a.password;
            }
            else
            {
                    update.password = txtPassword.Text;
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
                    lblImage.Text = "This Picture format is not supported by the system";
                    check = false;
                }else if(width > 500|| height > 300){
                    lblImage.Text = "Profile Picture size does not meet specified requirements 500x300 pixels";
                    check = false;
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

            if (check == true)
            {
                update.accountType = a.accountType;
                Session["Account"] = update;
                app.UpdateAccount(txtName.Text, txtPassword.Text, txtEmail.Text, txtAddress.Text, txtNric.Text, update.photo, a.accountID);
                Response.Write("<script type=\"text/javascript\">alert('Account Info is successfully updated!');location.href='AccountInfoPage.aspx'</script>");
            }
        }
    }
}