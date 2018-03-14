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
            Facility f = new Facility();
            f = app.GetFacility(id);
            txtName.Text = f.facilityName;
            txtType.Text = f.facilityType;
            txtGeneralInfo.Text = f.generalInfo;
            txtPhoneNumber.Text = f.phoneNumber.ToString();
            txtOpeningHrs.Text = f.openingHrs;
            txtClosingHrs.Text = f.closingHrs;
            txtAddress.Text = f.address;
            txtRegion.Text = f.region;
        }

        protected void UpDate_Click(object sender, EventArgs e)
        {
            Validation vc = new Validation();
            String id = (String)Session["fac_id"];
            FacilityManagementSystem app = new FacilityManagementSystem();
            Facility f = new Facility();
            f = app.GetFacility(id);

            if (string.IsNullOrEmpty(txtName.Text))
            {
                 txtName.Text = f.facilityName;
            }

            if (string.IsNullOrEmpty(txtType.Text))
            {
                txtType.Text = f.facilityType;
            }

            if (string.IsNullOrEmpty(txtGeneralInfo.Text))
            {
                txtGeneralInfo.Text = f.generalInfo;
            }
            if (string.IsNullOrEmpty(txtPhoneNumber.Text))
            {
                txtPhoneNumber.Text = f.phoneNumber.ToString();
            }

            if (string.IsNullOrEmpty(txtOpeningHrs.Text))
            {
                txtOpeningHrs.Text = f.openingHrs;
            }

            if (string.IsNullOrEmpty(txtClosingHrs.Text))
            {
                txtClosingHrs.Text = f.closingHrs;
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
            app.UpdateFacility(txtName.Text, txtType.Text, txtGeneralInfo.Text, txtPhoneNumber.Text, txtOpeningHrs.Text, txtClosingHrs.Text, txtAddress.Text, txtRegion.Text, image, id);


            Response.Redirect("FacilityListPage.aspx", false);
        }
    }
}