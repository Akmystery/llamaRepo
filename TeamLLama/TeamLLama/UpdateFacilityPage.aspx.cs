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
    public partial class UpdateFacilityPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                String id = (String)Session["fac_id"];
            FacilityManagementSystem app = new FacilityManagementSystem();
            DepartmentManagementSystem dpp = new DepartmentManagementSystem();
            Facility f = new Facility();
            f = app.GetFacility(id);
            txtName.Attributes.Add("placeholder",f.facilityName);
            txtInfo.Attributes.Add("placeholder", f.generalInfo);
            txtPhoneNumber.Attributes.Add("placeholder", f.phoneNumber.ToString());

            string[] OpeningTimeArray = f.openingHrs.Split(':');
            UpdateOpeninghr.SelectedValue = OpeningTimeArray[0]+":"+ OpeningTimeArray[1];
      

            string[] ClosingTimeArray = f.closingHrs.Split(':');
                UpdateClosinghr.SelectedValue = ClosingTimeArray[0] + ":" + ClosingTimeArray[1];


                txtAddress.Attributes.Add("placeholder", f.address);
            txtRegion.Attributes.Add("placeholder", f.region);


            listFacility.SelectedValue = f.facilityType;

            List<Department> Deptlist = dpp.getDepartments(id);

            //////////////////////////////////////Department can't be deleted because doctor is tied to the department
            for(int i=0;i< Deptlist.Count;i++)
            {
                foreach (ListItem listItem in UpdateDepartmentList.Items)
                {
                    if(listItem.Value.Equals(Deptlist.ElementAt(i).departmentName))
                    {
                        listItem.Selected = true;
                    }
                }

            }


            }
        }

        protected void UpDate_Click(object sender, EventArgs e)
        {
            String id = (String)Session["fac_id"];
            Validation vc = new Validation();
            FacilityManagementSystem app = new FacilityManagementSystem();
            Facility f = new Facility();
            f = app.GetFacility(id);

            if (string.IsNullOrEmpty(txtName.Text))
            {
                txtName.Text = f.facilityName;
            }

            if (string.IsNullOrEmpty(txtInfo.Text))
            {
                txtInfo.Text = f.generalInfo;
            }

            if (string.IsNullOrEmpty(txtPhoneNumber.Text))
            {
                txtPhoneNumber.Text = f.phoneNumber.ToString();
            }


            if (string.IsNullOrEmpty(txtAddress.Text))
            {
                txtAddress.Text = f.address;
            }

            if (string.IsNullOrEmpty(txtRegion.Text))
            {
                txtRegion.Text = f.region;
            }

            String image = f.image;

            if (ImageUpload.HasFile)
            {
                string ext = System.IO.Path.GetExtension(ImageUpload.PostedFile.FileName);
                if (!vc.ImageCheck(ext))
                {
                    lblImage.Text = "Invalid image type";
                }
                else
                {
                    image = Path.GetFileName(ImageUpload.PostedFile.FileName);
                    ImageUpload.PostedFile.SaveAs(Server.MapPath("~/upload/facility/") + image);
                }

            }

            app.UpdateFacility(txtName.Text, listFacility.SelectedItem.Text, txtInfo.Text, Convert.ToInt32(txtPhoneNumber.Text), UpdateOpeninghr.SelectedItem.Text + ":" + "00", UpdateClosinghr.SelectedItem.Text + ":" + "00", txtAddress.Text, txtRegion.Text, image, f.facilityID);

            //need to check whether there's any doctor with these department
            DepartmentManagementSystem dpp = new DepartmentManagementSystem();
            Department[] dp = new Department[12]; //selected
            Department[] ndp = new Department[12]; //not selected
            int index = 0;
            int nindex = 0;
            foreach (ListItem listItem in UpdateDepartmentList.Items)
            {
                if (listItem.Selected)
                {
                    dp[index] = new Department();
                    dp[index].facilityId = f.facilityID;
                    dp[index].departmentName = listItem.Value;

                    index++;
                }
                else
                {
                    ndp[nindex] = new Department();
                    ndp[nindex].facilityId = f.facilityID;
                    ndp[nindex].departmentName = listItem.Value;

                    nindex++;
                }
            }


            bool DepartmentCheckexist = false; //this is to check whether there's child dependency for facility_staff before deleting the uncheck facility to prevent database error
            String tempDeptName;
            foreach(Department d in ndp)
            {
                if (d != null) { 
                tempDeptName = dpp.CheckDepartmentForStaff(d);
                if (tempDeptName != null)
                {
                    lblImage.Text = "unable to remove department: " + tempDeptName + ", there are doctors working in that department";
                    DepartmentCheckexist = true;//don't allow the update 
                }
                }
            }
            if(DepartmentCheckexist == false)
            { 
            dpp.DeleteDepartment(ndp);
            dpp.AddDepartment(dp);
            Response.Write("<script type=\"text/javascript\">alert('Facility Updated!');location.href='AdminHomePage.aspx'</script>");
            }
           
        }
    }
}