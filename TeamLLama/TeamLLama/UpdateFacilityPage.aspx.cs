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
            String id = (String)Session["fac_id"];
            FacilityManagementSystem app = new FacilityManagementSystem();
            DepartmentManagementSystem dpp = new DepartmentManagementSystem();
            Facility f = new Facility();
            f = app.GetFacility(id);
            txtName.Attributes.Add("placeholder",f.facilityName);
            txtInfo.Attributes.Add("placeholder", f.generalInfo);
            txtPhoneNumber.Attributes.Add("placeholder", f.phoneNumber.ToString());

            string[] OpeningTimeArray = f.openingHrs.Split(':');
            txtOpeninghr.Attributes.Add("placeholder", OpeningTimeArray[0]);
            txtOpeningmin.Attributes.Add("placeholder", OpeningTimeArray[1]);

            string[] ClosingTimeArray = f.closingHrs.Split(':');
            txtClosinghr.Attributes.Add("placeholder", ClosingTimeArray[0]);
            txtClosingmin.Attributes.Add("placeholder", ClosingTimeArray[1]);


            txtAddress.Attributes.Add("placeholder", f.address);
            txtRegion.Attributes.Add("placeholder", f.region);


            listFacility.SelectedValue = f.facilityType;

            List<Department> Deptlist = dpp.getDepartments(id);

            for(int i=0;i< Deptlist.Count;i++)
            {
                foreach (ListItem listItem in CreateDepartmentList.Items)
                {
                    if (listItem.Text.Equals(Deptlist.ElementAt(i).departmentName))
                    {
                        listItem.Enabled = false;
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

            if (string.IsNullOrEmpty(txtOpeninghr.Text) || string.IsNullOrEmpty(txtOpeningmin.Text))
            {
                string[] OpeningTimeArray = f.openingHrs.Split(':');
                txtOpeninghr.Text = OpeningTimeArray[0];
            }

            if (string.IsNullOrEmpty(txtClosinghr.Text))
            {
                string[] ClosingTimeArray = f.closingHrs.Split(':');
                txtClosinghr.Text = ClosingTimeArray[0];
            }

            if (vc.isEmpty(txtOpeningmin.Text))
            {
                txtOpeningmin.Text = "00";
            }

            if (vc.isEmpty(txtClosingmin.Text))
            {
                txtClosingmin.Text = "00";
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

            app.UpdateFacility(txtName.Text, listFacility.SelectedItem.Text, txtInfo.Text, Convert.ToInt32(txtPhoneNumber.Text), txtOpeninghr.Text + ":" + txtOpeninghr.Text + ":" + "00", txtClosinghr.Text + ":" + txtClosingmin.Text + ":" + "00", txtAddress.Text, txtRegion.Text, image, f.facilityID);


            Response.Redirect("FacilityListPage.aspx", false);
        }
    }
}