﻿using System;
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
    public partial class AdminUpdateAccPage : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = new Account();
            a = (Account)Session["Account"];

            if (a == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!a.accountType.Equals("admin"))
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!IsPostBack)
            {
                int id = Int32.Parse((string)Session["doc_id"]);
                
                a = AccountManagementSystem.GetAccount(id);
                txtNric.Attributes.Add("placeholder", a.nric);
                txtName.Attributes.Add("placeholder", a.name);
                txtPassword.Attributes.Add("placeholder", a.password);
                txtEmail.Attributes.Add("placeholder", a.email);
                txtAddress.Attributes.Add("placeholder", a.address);

                Department D = new Department();
                D = DepartmentManagementSystem.GetDepartmentByUserID(id);


                Facility F = new Facility();
                F = FacilityManagementSystem.GetFacility(D.facilityId);

                FacilityDropDownList.DataSource = FacilityManagementSystem.GetAllfacility();
                FacilityDropDownList.DataBind();

                FacilityDropDownList.SelectedValue = F.facilityID.ToString();


                DepartmentDropDownList.DataSource = DepartmentManagementSystem.getDepartmentsFromThisFacility(FacilityDropDownList.SelectedItem.Value);
                DepartmentDropDownList.DataBind();


                DepartmentDropDownList.SelectedValue = D.departmentID.ToString();

            }
        }

        protected void FilterDept(object sender, EventArgs e) //action fired after selecting facility
        {
            DepartmentDropDownList.DataSource = DepartmentManagementSystem.getDepartmentsFromThisFacility(FacilityDropDownList.SelectedItem.Value);
            DepartmentDropDownList.DataBind();
        }

        protected void UpDate_Click(object sender, EventArgs e)
        {
            Account a = new Account();
            Boolean check = true;
           

            Account update = new Account();
            a = AccountManagementSystem.GetAccount(Int32.Parse((string)Session["doc_id"]));

            if (string.IsNullOrEmpty(txtNric.Text))
            {
                update.nric = txtNric.Text = a.nric;
            }
            else
            {
                update.nric = txtNric.Text;
            }

            if (string.IsNullOrEmpty(txtName.Text))
            {
                update.name = txtName.Text = a.name;
            }
            else
            {
                update.name = txtName.Text;
            }

            if (string.IsNullOrEmpty(txtEmail.Text))
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


            if (string.IsNullOrEmpty(txtAddress.Text))
            {
                update.address = txtAddress.Text = a.address;
            }
            else
            {
                update.address = txtAddress.Text;
            }

            if (DepartmentDropDownList.SelectedItem == null)
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
                if (!Validation.ImageCheck(ext))
                {
                    lblImage.Text = "This Picture format is not supported by the system";
                    check = false;
                }
                else if (width > 500 || height > 300)
                {
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
                //Session["Account"] = update;
                AccountManagementSystem.UpdateAccount(txtName.Text, txtPassword.Text, txtEmail.Text, txtAddress.Text, txtNric.Text, update.photo, a.accountID);

                

                int Departmentid = Int32.Parse(DepartmentDropDownList.SelectedValue);

                AccountManagementSystem.UpdateFacilityStaff(a.accountID, Departmentid);

                Response.Write("<script type=\"text/javascript\">alert('Account Info is successfully updated!');location.href='AdminHomePage.aspx'</script>");
            }
        }
    }
}