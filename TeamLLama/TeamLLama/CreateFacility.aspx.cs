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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Create_Click(object sender, EventArgs e)
        {
            Validation vc = new Validation();
            bool check = true;

            if (vc.isEmpty(txtName.Text))
            {
                lblName.Text = "Name cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtInfo.Text))
            {
                lblInfo.Text = "Info cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtPhoneNumber.Text))
            {
                lblPhoneNumber.Text = "PhoneNumber cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtOpening.Text))
            {
                lblOpening.Text = "Opening Hours cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtClosing.Text))
            {
                lblClosing.Text = "Closing Hours cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtAddress.Text))
            {
                lblAddress.Text = "Address cannot be empty";
                check = false;
            }
            if (vc.isEmpty(txtRegion.Text))
            {
                lblRegion.Text = "Region cannot be empty";
                check = false;
            }
            if (ImageUpload.HasFile)
            {
                string ext = System.IO.Path.GetExtension(ImageUpload.PostedFile.FileName);
                if (!vc.ImageCheck(ext))
                {
                    check = false;
                    lblImage.Text = "Invalid image type";
                }
            }

            if (check == true)
            {
                Facility f = new Facility();
                f.facilityName = txtName.Text;
                f.facilityType = listFacility.SelectedItem.Text;
                f.generalInfo = txtInfo.Text;
                f.phoneNumber = Int32.Parse(txtPhoneNumber.Text);
                f.openingHrs = txtOpening.Text;
                f.closingHrs = txtClosing.Text;
                f.address = txtAddress.Text;
                f.region = txtRegion.Text;


                if (ImageUpload.HasFile)
                {
                    f.image = Path.GetFileName(ImageUpload.PostedFile.FileName);
                    ImageUpload.PostedFile.SaveAs(Server.MapPath("~/upload/facility/") + f.image);
                }

                FacilityManagementSystem app = new FacilityManagementSystem();

                app.createFacility(f);

                Response.Redirect("AdminHomePage.aspx", false);

            }

        }
    }
}